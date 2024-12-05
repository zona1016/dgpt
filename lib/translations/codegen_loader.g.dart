// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "app_name": "AIDAV2",
  "chat": {
    "message": "Message",
    "copy_success": "Copy Success",
    "no_personal_introduction_available": "No personal introduction available",
    "image_saved_successfully": "Image saved successfully",
    "download": "Download",
    "scan": "Scan",
    "scan_to_add_me_as_a_friend": "Scan to add me as a friend",
    "avatar_selection": "Avatar Selection",
    "select_date": "Select Date",
    "email": "Email",
    "permission_management": "Permission Management",
    "help_center": "Help Center"
  }
};
static const Map<String,dynamic> zh_Hans = {
  "app_name": "AIDAV2",
  "chat": {
    "message": "消息",
    "copy_success": "复制成功",
    "no_personal_introduction_available": "暂无个人简介",
    "image_saved_successfully": "图片保存成功",
    "download": "下载",
    "scan": "扫一扫",
    "scan_to_add_me_as_a_friend": "扫一扫，加我为好友",
    "avatar_selection": "头像选择",
    "select_date": "选择日期",
    "email": "邮箱",
    "permission_management": "权限管理",
    "help_center": "帮助中心"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "zh_Hans": zh_Hans};
}
