import 'package:dgpt/utils/extensions/color_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppTheme extends ThemeExtension<AppTheme> {
  final Color lightPrimaryColor;
  final Color textColor;
  final Color secondaryTextColor;
  final Color weakTextColor;
  final Color backgroundColor;
  final Color secondaryBackgroundColor;
  final Color containerColor;
  final Color secondaryContainerColor;
  final Color indicatorColor;
  final Color secondaryGradientStartColor;
  final Color secondaryGradientEndColor;
  final Color inputFillColor;
  final Color secondaryInputFillColor;
  final Color unselectedColor;
  final Color dividerColor;
  final Color lightDividerColor;
  final Color shadowColor;
  final Color borderColor;
  final String loginBg;
  final String commonBg;
  final String bottomSheetBg;
  final String emptyImg;
  final String comingSoonImg;

  AppTheme(
      {this.lightPrimaryColor = BaseColors.white,
        this.textColor = BaseColors.black,
        this.secondaryTextColor = BaseColors.gray,
        this.weakTextColor = BaseColors.gray,
        this.backgroundColor = Colors.transparent,
        this.secondaryBackgroundColor = BaseColors.whiteGray,
        this.containerColor = Colors.white,
        this.secondaryContainerColor = BaseColors.whiteGray,
        this.indicatorColor = BaseColors.extraLightGray,
        this.secondaryGradientStartColor = BaseColors.secondaryGradientStartColor,
        this.secondaryGradientEndColor = BaseColors.secondaryGradientEndColor,
        this.inputFillColor = BaseColors.inputFillColor,
        this.secondaryInputFillColor = BaseColors.secondaryInputFillColor,
        this.unselectedColor = BaseColors.darkGray,
        this.dividerColor = BaseColors.gray85,
        this.lightDividerColor = BaseColors.extraLightGray,
        this.shadowColor = BaseColors.gray94,
        this.borderColor = BaseColors.lightGray,
        this.loginBg = "assets/image/background/login_bg.png",
        this.commonBg = "assets/image/background/common_bg.png",
        this.bottomSheetBg = "assets/image/background/bottom_sheet_bg.png",
        this.emptyImg = "assets/image/placeholder/empty.png",
        this.comingSoonImg = "assets/image/placeholder/coming_soon.png"});

  @override
  ThemeExtension<AppTheme> copyWith(
      {Color? lightPrimaryColor,
        Color? textColor,
        Color? secondaryTextColor,
        Color? weakTextColor,
        Color? backgroundColor,
        Color? secondaryBackgroundColor,
        Color? containerColor,
        Color? secondaryContainerColor,
        Color? indicatorColor,
        Color? secondaryGradientStartColor,
        Color? secondaryGradientEndColor,
        Color? inputFillColor,
        Color? secondaryInputFillColor,
        Color? unselectedColor,
        Color? dividerColor,
        Color? lightDividerColor,
        Color? shadowColor,
        Color? borderColor,
        String? loginBg,
        String? commonBg,
        String? bottomSheetBg,
        String? emptyImg,
        String? comingSoonImg}) {
    return AppTheme(
        lightPrimaryColor: lightPrimaryColor ?? this.lightPrimaryColor,
        textColor: textColor ?? this.textColor,
        secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
        weakTextColor: weakTextColor ?? this.weakTextColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        secondaryBackgroundColor:
        secondaryBackgroundColor ?? this.secondaryBackgroundColor,
        containerColor: containerColor ?? this.containerColor,
        secondaryContainerColor:
        secondaryContainerColor ?? this.secondaryContainerColor,
        indicatorColor: indicatorColor ?? this.indicatorColor,
        secondaryGradientStartColor:
        secondaryGradientStartColor ?? this.secondaryGradientStartColor,
        secondaryGradientEndColor:
        secondaryGradientEndColor ?? this.secondaryGradientEndColor,
        inputFillColor: inputFillColor ?? this.inputFillColor,
        secondaryInputFillColor:
        secondaryInputFillColor ?? this.secondaryInputFillColor,
        unselectedColor: unselectedColor ?? this.unselectedColor,
        dividerColor: dividerColor ?? this.dividerColor,
        lightDividerColor: lightDividerColor ?? this.lightDividerColor,
        shadowColor: shadowColor ?? this.shadowColor,
        borderColor: borderColor ?? this.borderColor,
        loginBg: loginBg ?? this.loginBg,
        commonBg: commonBg ?? this.commonBg,
        bottomSheetBg: bottomSheetBg ?? this.bottomSheetBg,
        emptyImg: emptyImg ?? this.emptyImg,
        comingSoonImg: comingSoonImg ?? this.comingSoonImg);
  }

  @override
  ThemeExtension<AppTheme> lerp(
      covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      lightPrimaryColor:
      Color.lerp(lightPrimaryColor, other.lightPrimaryColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      secondaryTextColor:
      Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      weakTextColor: Color.lerp(weakTextColor, other.weakTextColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      secondaryBackgroundColor: Color.lerp(
          secondaryBackgroundColor, other.secondaryBackgroundColor, t)!,
      containerColor: Color.lerp(containerColor, other.containerColor, t)!,
      secondaryContainerColor: Color.lerp(
          secondaryContainerColor, other.secondaryContainerColor, t)!,
      indicatorColor: Color.lerp(indicatorColor, other.indicatorColor, t)!,
      secondaryGradientStartColor: Color.lerp(
          secondaryGradientStartColor, other.secondaryGradientStartColor, t)!,
      secondaryGradientEndColor: Color.lerp(
          secondaryGradientEndColor, other.secondaryGradientEndColor, t)!,
      inputFillColor: Color.lerp(inputFillColor, other.inputFillColor, t)!,
      secondaryInputFillColor: Color.lerp(
          secondaryInputFillColor, other.secondaryInputFillColor, t)!,
      unselectedColor: Color.lerp(unselectedColor, other.unselectedColor, t)!,
      lightDividerColor:
      Color.lerp(lightDividerColor, other.lightDividerColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }
}

class DefTheme {
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: BaseColors.white,
        surfaceTintColor: BaseColors.white,
      ),
      timePickerTheme: const TimePickerThemeData(
          backgroundColor: BaseColors.white,
          dialBackgroundColor: BaseColors.whiteGray,
          dayPeriodColor: BaseColors.primaryColor,
          hourMinuteColor: BaseColors.primaryColor),
      colorScheme: const ColorScheme.light().copyWith(
          primary: BaseColors.primaryColor, surfaceTint: Colors.white),
      fontFamily: "PingFang SC",
      primarySwatch: BaseColors.primaryColor.toMaterialColor(),
      primaryColor: BaseColors.primaryColor,
      tabBarTheme: const TabBarTheme(
          overlayColor: MaterialStatePropertyAll(Colors.black12)),
      cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          primaryColor: BaseColors.primaryColor),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: BaseColors.primaryColor,
        selectionColor: BaseColors.primaryColor.withOpacity(0.5),
        selectionHandleColor: BaseColors.primaryColor,
      ),
      extensions: <ThemeExtension<dynamic>>[
        //Customize app light theme
        AppTheme(),
      ]);
  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: BaseColors.black,
        surfaceTintColor: BaseColors.black,
      ),
      timePickerTheme: const TimePickerThemeData(
          backgroundColor: BaseColors.black,
          dialBackgroundColor: BaseColors.gray20,
          dayPeriodColor: BaseColors.primaryColor,
          hourMinuteColor: BaseColors.primaryColor),
      colorScheme: const ColorScheme.dark().copyWith(
          primary: BaseColors.primaryColor, surfaceTint: Colors.black),
      fontFamily: "PingFang SC",
      primarySwatch: BaseColors.primaryColor.toMaterialColor(),
      primaryColor: BaseColors.primaryColor,
      tabBarTheme: const TabBarTheme(
          overlayColor: MaterialStatePropertyAll(Colors.black12)),
      cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          primaryColor: BaseColors.primaryColor),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: BaseColors.primaryColor,
        selectionColor: BaseColors.primaryColor.withOpacity(0.5),
        selectionHandleColor: BaseColors.primaryColor,
      ),
      extensions: <ThemeExtension<dynamic>>[
        //Customize app dark theme
        AppTheme(
            lightPrimaryColor: BaseColors.black,
            textColor: Colors.white,
            secondaryTextColor: Colors.white,
            backgroundColor: BaseColors.black,
            secondaryBackgroundColor: BaseColors.gray20,
            containerColor: BaseColors.gray20,
            secondaryContainerColor: BaseColors.black,
            indicatorColor: BaseColors.gray20,
            secondaryGradientStartColor:
            BaseColors.secondaryDarkGradientStartColor,
            secondaryGradientEndColor: BaseColors.secondaryDarkGradientEndColor,
            inputFillColor: BaseColors.darkInputFillColor,
            lightDividerColor: BaseColors.black,
            dividerColor: BaseColors.gray20,
            secondaryInputFillColor: BaseColors.secondaryDarkInputFillColor,
            unselectedColor: BaseColors.white,
            shadowColor: BaseColors.black,
            borderColor: BaseColors.gray20,
            loginBg: "assets/image/background/login_bg_dark.png",
            commonBg: "assets/image/base/base_bg.png",
            bottomSheetBg: "assets/image/background/bottom_sheet_bg_dark.png",
            emptyImg: "assets/image/placeholder/empty_dark.png",
            comingSoonImg: "assets/image/placeholder/coming_soon_dark.png"),
      ]);
}
