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
    "message": "message"
  }
};
static const Map<String,dynamic> zh_Hans = {
  "app_name": "AIDAV2",
  "chat": {
    "message": "消息"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "zh_Hans": zh_Hans};
}
