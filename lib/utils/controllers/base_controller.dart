import 'package:aida/models/api/pagination_response.dart';
import 'package:aida/utils/api/api_exception.dart';
import 'package:aida/utils/api/base_response.dart';
import 'package:aida/utils/constants/app_enums.dart';
import 'package:aida/utils/controllers/user_controller.dart';
import 'package:aida/utils/packages/dialog.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class BaseController<S> extends GetxController {
  S? _args;
  S? get args => _args;
  final EasyRefreshController refreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );
  RxBool hasLoadMore = false.obs;
  RxBool isFormValidated = false.obs;
  int currentPage = 1;
  Rx<UIState> uiState = UIState.initial.obs;
  RxInt ongoingRequests = 0.obs;
  RxInt failedRequests = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _args = Get.arguments as S?;
    hasLoadMore.listen((val) {
      refreshController.finishLoad(hasLoadMore.isTrue
          ? IndicatorResult.success
          : IndicatorResult.noMore);
    });
  }

  Future<T?> fetchData<T>(
      {required Future<BaseResponse<T>> Function() request,
        AppLoadingState loadingState = AppLoadingState.normal}) async {
    updateState(UIState.loading, loadingState);
    ongoingRequests++;

    try {
      final response = await request();
      ongoingRequests--;
      if (ongoingRequests.value == 0) {
        updateState(UIState.success, loadingState);
      }
      return response.data;
    } on Exception catch (e) {
      ongoingRequests--;
      failedRequests++;
      handleError(e, loadingState);
    }
    return null;
  }

  Future<T?> fetchPaginatedData<T>(
      {required Future<BaseResponse<T>> Function() request,
        dynamic Function(T response)? paginationResponseBuilder,
        AppLoadingState loadingState = AppLoadingState.normal}) async {
    updateState(UIState.loading, loadingState);
    ongoingRequests++;

    try {
      final response = await request();
      final paginationResponse = (paginationResponseBuilder == null
          ? response.data
          : paginationResponseBuilder(response.data as T))
      as PaginationResponse;
      currentPage = paginationResponse.currentPage;
      hasLoadMore.value = paginationResponse.hasLoadMore;
      debugPrint('loadmore = ${hasLoadMore.value.toString()}');
      ongoingRequests--;
      if (ongoingRequests.value == 0) {
        updateState(UIState.success, loadingState);
      }
      return response.data;
    } on Exception catch (e) {
      ongoingRequests--;
      failedRequests++;
      handleError(e, loadingState);
    }
    return null;
  }

  void updateFinalState(AppLoadingState loadingState) {
    if (failedRequests.value == 0) {
      updateState(UIState.success, loadingState);
    } else if (failedRequests.value < ongoingRequests.value) {
      updateState(UIState.partialSuccess, loadingState);
    } else {
      updateState(UIState.error, loadingState);
    }
    failedRequests.value = 0; // Reset for next batch of requests
  }

  handleError(Exception e, loadingState) {
    if (ongoingRequests.value == 0) {
      updateFinalState(loadingState);
    }
    updateState(UIState.error, loadingState);
    if (e is ServerResponseException) {
      switch (e.response.code) {
        case 401:
          Get.find<UserController>().clearUser();
          break;
        default:
      }
    }
    if (loadingState != AppLoadingState.backgroundWithoutError) {
      DialogUtils.showApiExceptionDialog(e);
    }
  }

  updateState(UIState currentUIState, AppLoadingState loadingState) async {
    if (loadingState == AppLoadingState.backgroundWithoutError) {
      return;
    }
    uiState.value = currentUIState;
    bool isError = currentUIState == UIState.error;
    bool isLoading = currentUIState == UIState.loading;
    switch (loadingState) {
      case AppLoadingState.normal:
        if (isLoading) {
          Get.context!.loaderOverlay.show();
        } else {
          Get.context!.loaderOverlay.hide();
          refreshController.finishLoad(hasLoadMore.isTrue
              ? IndicatorResult.success
              : IndicatorResult.noMore);
        }
        break;
      case AppLoadingState.pullToRefresh:
        if (!isLoading) {
          refreshController.finishRefresh(
              isError ? IndicatorResult.fail : IndicatorResult.success);
          refreshController.finishLoad(isError
              ? IndicatorResult.fail
              : hasLoadMore.isTrue
              ? IndicatorResult.success
              : IndicatorResult.noMore);
        }
        break;
      case AppLoadingState.loadMore:
        if (!isLoading) {
          refreshController.finishLoad(isError
              ? IndicatorResult.fail
              : hasLoadMore.isTrue
              ? IndicatorResult.success
              : IndicatorResult.noMore);
        }
        break;
      case AppLoadingState.background:
      case AppLoadingState.backgroundWithoutError:
        break;
    }
  }
}
