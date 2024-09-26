import 'package:aida/utils/extensions/context_extension.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_auth_app_bar.dart';
import 'package:aida/widget/base/base_button.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:aida/widget/language_dropdown_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        appBar: BaseAuthAppBar(
          onBackTap: () {
            if (Get.key.currentState?.canPop() ?? false) {
              Get.back();
            } else {
              Get.offAndToNamed(AppRoutes.main);
            }
          },
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: LanguageDropdownButton(needRestart: false),
            )
          ],
        ),
        safeAreaBottom: false,
        backgroundColor: Colors.transparent,
        decorationBackgroundImage: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/image/background/landing_bg.png"),
            alignment: Alignment.topCenter),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(40)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      context.appTheme.containerColor,
                      context.appTheme.lightPrimaryColor
                    ]),
                color: context.appTheme.containerColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text((tr("button.get_started")),
                      style: fontBold.copyWith(fontSize: 24)),
                  Text(tr("auth.landing_desc"),
                      textAlign: TextAlign.center,
                      style: fontMedium.copyWith(
                          fontSize: 14, color: context.appTheme.weakTextColor)),
                  const SizedBox(height: 30),
                  BaseButton(
                      onPressed: () {},
                      text: tr("button.login")),
                  const SizedBox(height: 28),
                  BaseButton(
                      type: BaseButtonType.secondary,
                      onPressed: (){},
                      text: tr("button.create_account"),
                      textColor: context.appTheme.textColor),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ));
  }
}
