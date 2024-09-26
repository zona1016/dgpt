import 'dart:convert';

import 'package:aida/models/app_language.dart';
import 'package:aida/models/user/user_info.dart';
import 'package:aida/utils/constants/storage_keys.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/packages/storage_utils.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends BaseController {
  final _userInfo = Rxn<UserInfo>();
  final _token = RxnString("");
  final _selectedLanguage = Rx<AppLanguage>(AppLanguage.defaultLanguage);
  RxList<String> watchedLessons = <String>[].obs;
  Rxn<UserInfo> get rxUserInfo => _userInfo;
  RxBool isLoggedIn = false.obs;

  UserInfo get userInfo => _userInfo.value ?? UserInfo();
  String get token => _token.value ?? '';
  bool get isLogin => token.isNotEmpty;
  AppLanguage get selectedLanguage => _selectedLanguage.value;
  static const String _prefix = 'watched_videos_';

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
    _loadUser();
    _loadWatchedLessons();
    ever(watchedLessons, (_) => _saveWatchedLessons());
    ever(_token, (_) => _updateLoginState());
  }

  void _updateLoginState() {
    isLoggedIn.value = token.isNotEmpty;
  }

  checkLoginStatus(
      {void Function()? onVerified, Future Function()? onAuthenticated}) async {
    if (!isLogin) {
      // final result = await Get.toNamed(AppRoutes.landing);
      // if (result != null && result == "success") {
      //   await onAuthenticated?.call();
      //   onVerified?.call();
      // }
    } else {
      onVerified?.call();
    }
  }

  _loadLanguage() {
    final locale = StorageUtils.read(StorageKeys.currentLocale);
    final currentLanguage = AppLanguage.languages
        .firstWhereOrNull((element) => element.locale.toString() == locale);
    _selectedLanguage.value = currentLanguage ?? AppLanguage.defaultLanguage;
    debugPrint(_selectedLanguage.value.locale.toString());
  }

  setLocale(Locale locale) {
    _selectedLanguage.value =
        AppLanguage.languages.firstWhere((element) => element.locale == locale);
    StorageUtils.write(StorageKeys.currentLocale, locale.toString());
  }

  _loadUser() {
    final userJson = StorageUtils.read(StorageKeys.userInfo);
    final userToken = StorageUtils.read(StorageKeys.accessToken);
    if (userJson != null) {
      final storedUser = UserInfo.fromJson(userJson);
      _userInfo.value = storedUser;
    }
    _token.value = userToken;
  }

  setUserInfo(UserInfo? userInfo) {
    if (userInfo != null) {
      StorageUtils.write(StorageKeys.userInfo, userInfo);
    } else {
      StorageUtils.remove(StorageKeys.userInfo);
    }
    _userInfo.value = userInfo;
  }

  getProfileProgress() {
    int progress = 1;
    if (userInfo.username != null && userInfo.username!.isNotEmpty) {
      progress = 2;
    }
    if (userInfo.mobile != null && userInfo.mobile!.isNotEmpty) {
      progress = 3;
    }
    if (userInfo.email != null && userInfo.email!.isNotEmpty) {
      progress = 4;
    }
    if (userInfo.avatar != null && userInfo.avatar!.isNotEmpty) {
      progress = 5;
    }

    return progress;
  }

  saveUser(UserInfo? userInfo, String? token) {
    StorageUtils.write(StorageKeys.accessToken, token);
    _token.value = token;
    setUserInfo(userInfo);
    _loadWatchedLessons();
    if (userInfo != null) {
      // if (userInfo.interests.isEmpty) {
      //   Get.toNamed(AppRoutes.editInterest);
      // }
      // else if (userInfo.dob == null) {
      //   Get.toNamed(AppRoutes.editDob);
      // }
      // else {
      //   backToMain();
      // }
    }
  }

  backToMain() {
    // Get.until((route) => Get.currentRoute == AppRoutes.landing);
    // if (Get.key.currentState?.canPop() ?? false) {
    //   Get.back(result: "success");
    // } else {
    //   Get.offAndToNamed(AppRoutes.main);
    // }
  }

  clearUser() {
    StorageUtils.remove(StorageKeys.accessToken);
    StorageUtils.remove(StorageKeys.userInfo);
    setUserInfo(null);
    _token.value = null;
    // Get.offAllNamed(AppRoutes.landing);
  }

  void _loadWatchedLessons() {
    final username = userInfo.username;
    final String? watchedLessonsJson = StorageUtils.read('$_prefix$username');
    debugPrint("loaded lessons = $watchedLessonsJson");
    if (watchedLessonsJson != null) {
      watchedLessons
          .assignAll(List<String>.from(jsonDecode(watchedLessonsJson)));
    } else {
      watchedLessons.clear();
    }
  }

  void setWatchedLesson(String lessonId, bool watched) {
    if (watched && !watchedLessons.contains(lessonId)) {
      watchedLessons.add(lessonId);
    } else if (!watched) {
      watchedLessons.remove(lessonId);
    }
  }

  bool isLessonWatched(String lessonId) {
    return watchedLessons.contains(lessonId) && isLogin;
  }

  void _saveWatchedLessons() {
    final username = userInfo.username;
    if (username != null) {
      StorageUtils.write('$_prefix$username', jsonEncode(watchedLessons));
      debugPrint("saved lesson to $_prefix$username");
      final String? watchedLessonsJson = StorageUtils.read('$_prefix$username');
      debugPrint("loaded lessons = $watchedLessonsJson");
    }
  }

  navigateToFeedDetails(int feedId) async {
    // final result = await fetchData(
    //     loadingState: AppLoadingState.background,
    //     request: () =>
    //         Get.find<UserService>().fetchFeedDetails(feedId: feedId));
    // if (result != null) {
    //   Get.toNamed(AppRoutes.postDetails,
    //       arguments: PostDetailsScreenArgs(feed: result));
    // }
  }
}
