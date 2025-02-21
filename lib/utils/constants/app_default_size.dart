import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;

const double defaultAppBarHeight = 60;
const double gap = 15;
const double defaultPadding = 20;
const double defaultBorderRadius = 20;

double safeAreaTopHeight = MediaQuery.of(Get.context!).padding.top;
double safeAreaBottomHeight = MediaQuery.of(Get.context!).padding.bottom;


bool isMobile() {
  final userAgent = html.window.navigator.userAgent.toLowerCase();
  return userAgent.contains('mobile') || userAgent.contains('android') || userAgent.contains('iphone');
}