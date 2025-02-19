import 'package:dgpt/models/app_language.dart';
import 'package:dgpt/screens/setting/change_language_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:dgpt/widget/restart_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends GetView<ChangeLanguageScreenController> {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 65,),
            Row(
              children: [
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    "assets/images/custom/register_back.png",
                    width: 36,
                  ),
                )
              ],
            ),
            const SizedBox(height: defaultPadding,),
            Text(
              '选择语言',
              style: fontDMBold.copyWith(
                color: BaseColors.white,
                fontSize: 27
              ),
            ),
            const SizedBox(height: defaultPadding,),
            Expanded(
              child: ListView.separated(
                itemCount: AppLanguage.languages.length,
                itemBuilder: (_, index) {
                  Locale locale = AppLanguage.languages[index].locale;
                  return InkWell(
                    onTap: () {
                      if (locale != controller.selectedLocale) {
                        controller.userSetLang(AppLanguage.languages[index].formatKey);
                        context.setLocale(locale);
                        Get.updateLocale(locale);
                        Get.find<UserController>().setLocale(locale);
                        RestartWidget.restartApp(context);
                      }
                    },
                    child: SizedBox(
                      height: 44,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/custom/${AppLanguage.languages[index].icon}.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: defaultPadding / 2,),
                          Text(
                            AppLanguage.languages[index].name,
                            style: fontDMRegular.copyWith(
                                color: BaseColors.white,
                                fontSize: 17
                            ),
                          ),
                          Expanded(child: Container()),
                          if (locale == controller.selectedLocale)
                            Image.asset(
                              'assets/images/custom/setting_selected.png',
                              width: 24,
                              height: 24,
                            ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return Container(
                    height: 1,
                    color: BaseColors.lightGray,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}
