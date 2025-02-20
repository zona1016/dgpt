import 'package:dgpt/screens/profile/about_us_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsTab extends GetView<AboutUsScreenController> {
  const ContactUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/home/lxwm_content.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  color: BaseColors.weakTextColor,
                ),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Text(
                tr('home.contact_us'),
                style: fontSFProMedium.copyWith(
                  fontSize: 14,
                  color: BaseColors.white,
                ),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: BaseColors.weakTextColor,
                ),
              )
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding / 2,
              childAspectRatio: 1.5,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final uri = Uri.parse(controller.urlList[index]);
                      await launchUrl(uri, mode: LaunchMode.inAppWebView);
                    },
                    child: Center(
                      child: Image.asset(
                        controller.urlPathList[index],
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
