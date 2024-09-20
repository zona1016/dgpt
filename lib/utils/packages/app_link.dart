import 'dart:async';
import 'package:aida/utils/controllers/user_controller.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLinkUtils {
  AppLinkUtils._privateConstructor();

  static final AppLinkUtils _instance = AppLinkUtils._privateConstructor();

  static AppLinkUtils get instance => _instance;

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  Future<void> init() async {
    _appLinks = AppLinks();
    await initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialLink();
    if (appLink != null) {
      var uri = Uri.parse(appLink.toString());
      print(' here you can redirect from url as per your need ');
      print(uri);
      handleDeepLink(uri);
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen(
          (uri) {
        handleDeepLink(uri);
      },
      onError: (err) {
        debugPrint('====>>> error : $err');
      },
      onDone: () {
        _linkSubscription?.cancel();
      },
    );
  }

  void handleDeepLink(Uri uri) {
    List<String> pathSegments = uri.pathSegments;
    if (pathSegments.length == 2) {
      if (pathSegments[0] == 'event') {
        int? eventId = int.tryParse(pathSegments[1]);
        if (eventId != null) {
          navigateToEventPage(eventId);
        }
      } else if (pathSegments[0] == 'feed') {
        int? feedId = int.tryParse(pathSegments[1]);
        if (feedId != null) {
          Get.find<UserController>().navigateToFeedDetails(feedId);
        }
      }
    }
  }

  void navigateToEventPage(int eventId) {

  }
}
