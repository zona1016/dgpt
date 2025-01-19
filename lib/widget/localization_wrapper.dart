import 'package:dgpt/models/app_language.dart';
import 'package:dgpt/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationWrapper extends StatelessWidget {
  final Widget child;
  const LocalizationWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppLanguage.languages.map((e) => e.locale).toList(),
      startLocale: AppLanguage.defaultLanguage.locale,
      fallbackLocale: AppLanguage.defaultLanguage.locale,
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      child: child,
    );
  }
}
