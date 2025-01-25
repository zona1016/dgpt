import 'package:dgpt/screens/profile/about_us_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsTab extends GetView<AboutUsScreenController> {
  const ContactUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            "assets/images/tab/data_inactive.png",
            width: 150,
            height: 150,
          ),
        ),
        const SizedBox(
          height: defaultPadding / 2,
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
              'Contact Us',
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
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // Prevent scrolling inside GridView
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: defaultPadding,
              childAspectRatio: 2,
            ),
            itemCount: 6,
            // Number of items
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final uri = Uri.parse(controller.urlList[index]);
                      await launchUrl(uri, mode: LaunchMode.inAppWebView);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 2),
                      decoration: BoxDecoration(
                        color: BaseColors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/tab/data_inactive.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
