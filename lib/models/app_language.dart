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
      name: "EN",
      apiKey: "en",
      formatKey: "en",
      locale: const Locale.fromSubtags(languageCode: "en"),
      icon: "en",
    ),
    AppLanguage(
      name: "CN",
      apiKey: "zh",
      formatKey: "zh_CN",
      locale: const Locale.fromSubtags(languageCode: 'zh', scriptCode: "Hans"),
      icon: "cn",
    ),
  ];
}
