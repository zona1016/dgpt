import 'package:aida/models/app_language.dart';
import 'package:aida/utils/controllers/user_controller.dart';
import 'package:aida/utils/extensions/context_extension.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/restart_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageDropdownButton extends StatefulWidget {
  final bool needRestart;
  const LanguageDropdownButton({super.key, this.needRestart = true});

  @override
  State<LanguageDropdownButton> createState() => _LanguageDropdownButtonState();
}

class _LanguageDropdownButtonState extends State<LanguageDropdownButton> {
  @override
  Widget build(BuildContext context) {
    final selectedLocale = Get.find<UserController>().selectedLanguage.locale;
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
          isExpanded: true,
          value: selectedLocale,
          onChanged: (locale) {
            if (locale != null && locale != selectedLocale) {
              context.setLocale(locale);
              Get.updateLocale(locale);
              Get.find<UserController>().setLocale(locale);
              if (widget.needRestart) {
                RestartWidget.restartApp(context);
              }
            }
          },
          buttonStyleData: ButtonStyleData(
              height: 45,
              width: 95,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: context.appTheme.containerColor,
                  borderRadius: BorderRadius.circular(22.5))),
          iconStyleData: IconStyleData(
              icon: Image.asset(
                "assets/image/arrow_down.png",
                color: context.appTheme.textColor,
                width: 8,
              )),
          dropdownStyleData: DropdownStyleData(
            elevation: 0,
            maxHeight: 200,
            offset: const Offset(0, -10),
            decoration: BoxDecoration(
                color: context.appTheme.containerColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x1A333333),
                      blurRadius: 3,
                      offset: Offset(0, 0))
                ]),
          ),
          menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 0)),
          selectedItemBuilder: (context) => AppLanguage.languages
              .map((language) => _dropDownItem(language))
              .toList(),
          items: AppLanguage.languages
              .map((language) => DropdownMenuItem<Locale>(
              value: language.locale,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: language.locale == selectedLocale
                    ? BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(colors: [
                      BaseColors.primaryGradientStartColor,
                      BaseColors.primaryGradientEndColor,
                    ]))
                    : null,
                child: _dropDownItem(language,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textColor: language.locale == selectedLocale
                        ? Colors.white
                        : context.appTheme.textColor),
              )))
              .toList()),
    );
  }

  Widget _dropDownItem(AppLanguage language,
      {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
        Color? textColor}) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Image.asset(
          "assets/image/${language.icon}.png",
          width: 24,
        ),
        const SizedBox(width: 4),
        Text(language.name,
            style: fontMedium.copyWith(
                fontSize: 14, color: textColor ?? context.appTheme.textColor))
      ],
    );
  }
}
