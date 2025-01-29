import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/default_empty_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class BaseSmartRefresher extends StatelessWidget {
  final EasyRefreshController refreshController;
  final bool? enablePullToRefresh;
  final bool? enableLoadMore;
  final Function(AppLoadingState loadingState)? onPullToRefresh;
  final Function(AppLoadingState loadingState)? onLoadMore;
  final Function(AppLoadingState loadingState)? onRetry;
  final bool isEmpty;
  final UIState uiState;
  final Widget Function(BuildContext context, ScrollPhysics physics)?
      emptyWidgetBuilder;
  final String? emptyText;
  final Widget Function(BuildContext context, ScrollPhysics physics)
      childBuilder;
  final Header? header;
  final Footer? footer;
  final bool isCustomHeaderPosition;
  final bool isCustomFooterPosition;
  final List<Widget>? emptyHeaderSlivers;
  final double? triggerOffset;

  const BaseSmartRefresher({
    super.key,
    required this.refreshController,
    this.enablePullToRefresh = true,
    this.enableLoadMore = false,
    this.onPullToRefresh,
    this.onLoadMore,
    this.isEmpty = false,
    this.uiState = UIState.initial,
    this.emptyWidgetBuilder,
    required this.childBuilder,
    this.header,
    this.footer,
    this.isCustomHeaderPosition = false,
    this.isCustomFooterPosition = false,
    this.onRetry,
    this.emptyText,
    this.emptyHeaderSlivers,
    this.triggerOffset,
  });

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.builder(
      childBuilder: (context, physics) => getChild(context, physics),
      header: header ??
          ClassicHeader(
              safeArea: false,
              clamping: isCustomHeaderPosition ? true : false,
              position: isCustomHeaderPosition
                  ? IndicatorPosition.locator
                  : IndicatorPosition.above,
              showText: false,
              showMessage: false,
              iconTheme:  IconThemeData(color: Get.currentRoute.contains("gw") ? BaseColors.primaryColor : BaseColors.primaryColor),
              triggerOffset: triggerOffset ?? 70),
      footer: footer ??
          ClassicFooter(
            position: isCustomFooterPosition
                ? IndicatorPosition.locator
                : IndicatorPosition.above,
            showMessage: false,
            showText: false,
            noMoreText: tr("msg.no_more_data"),
            textStyle: fontMedium.copyWith(
                color: Get.currentRoute.contains("gw") ? BaseColors.primaryColor : BaseColors.primaryColor, fontSize: 14),
            spacing: 4,
            // iconDimension: 0,
            iconTheme:
                 IconThemeData(color: Get.currentRoute.contains("gw") ? BaseColors.primaryColor : BaseColors.primaryColor, size: 0),
          ),
      controller: refreshController,
      onRefresh: enablePullToRefresh!
          ? () async {
              onPullToRefresh?.call(AppLoadingState.pullToRefresh);
            }
          : null,
      onLoad: enableLoadMore!
          ? isEmpty
              ? null
              : () async {
                  Future.delayed(Duration.zero, () async {
                    onLoadMore?.call(AppLoadingState.loadMore);
                  });
                }
          : null,
    );
  }

  Widget getChild(BuildContext context, ScrollPhysics physics) {
    return switch (uiState) {
      UIState.success || UIState.partialSuccess => isEmpty
          ? emptyWidgetBuilder?.call(context, physics) ??
              CustomScrollView(
                physics: physics,
                slivers: [
                  ...emptyHeaderSlivers ?? [],
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: DefaultEmptyView(
                      emptyText: emptyText,
                    ),
                  ),
                ],
              )
          : childBuilder(context, physics),
      UIState.loading =>
        refreshController.headerState?.mode == IndicatorMode.processing ||
                refreshController.footerState?.mode == IndicatorMode.processing
            ? childBuilder(context, physics)
            :  Center(
                child: SpinKitFadingCircle(
                  color: Get.currentRoute.contains("gw") ? BaseColors.primaryColor : BaseColors.primaryColor,
                ),
              ),
      UIState.initial => childBuilder(context, physics),
      UIState.error => childBuilder(context, physics) //Maybe show error view,
    };
  }
}
