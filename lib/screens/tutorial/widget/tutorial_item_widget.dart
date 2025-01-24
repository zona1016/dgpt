import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorialItemWidget extends StatefulWidget {
  const TutorialItemWidget({super.key});

  @override
  State<TutorialItemWidget> createState() => _TutorialItemWidgetState();
}

class _TutorialItemWidgetState extends State<TutorialItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.tutorialDetail),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: BaseColors.primaryColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Text(
                    '教程 2',
                    style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.white,
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2,
                          vertical: defaultPadding / 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.5),
                          color: BaseColors.secondPrimaryColor),
                      child: Center(
                        child: Text(
                          'Basic Tutorial',
                          style: fontSFProMedium.copyWith(
                            fontSize: 14,
                            color: BaseColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/images/tab/home_inactive.png',
                width: 44,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
