import 'package:flutter/material.dart';

class AppLanguage {
  final String name;
  final String apiKey;
  final String formatKey;
  final Locale locale;
  final String icon;

  AppLanguage(
      {required this.name,
        required this.apiKey,
        required this.formatKey,
        required this.locale,
        required this.icon});

  static final defaultLanguage = languages[0];

  static final languages = [
    AppLanguage(
      name: "English",
      apiKey: "en",
      formatKey: "en",
      locale: const Locale.fromSubtags(languageCode: "en"),
      icon: "setting_united_kingdom",
    ),
    AppLanguage(
      name: "中文/简体",
      apiKey: "zh",
      formatKey: "zh_CN",
      locale: const Locale.fromSubtags(languageCode: 'zh', scriptCode: "Hans"),
      icon: "setting_china",
    ),
  ];
}
