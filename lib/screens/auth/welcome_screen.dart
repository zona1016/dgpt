import 'package:dgpt/screens/auth/welcome_screen_controller.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends GetView<WelcomeScreenController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 100, 26, 0),
          child: Column(
            children: [
              _carousel(context),
              const SizedBox(height: 60,),
              _type(context),
            ],
          )
        ),
      ),
    );
  }

  _carousel(BuildContext context) {
    return Column(children: [
      CarouselSlider.builder(
          itemCount: 4,
          itemBuilder: (context, index, realIndex) {
            return Column(
              children: [
                Expanded(
                    child: Container(
                  color: index / 2 == 0 ? Colors.red : Colors.black,
                )),
                const SizedBox(height: 10,),
                Text(
                  '多链钱包，安全好用',
                  style: fontMedium.copyWith(
                    color: BaseColors.primaryColor,
                    fontSize: 14
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    '支持主流公链、EVM兼容链及Layer2',
                    style: fontMedium.copyWith(
                        color: context.appTheme.weakTextColor,
                        fontSize: 14
                    ),
                  ),
                )
              ],
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            aspectRatio: 1,
            autoPlay: false,
            onPageChanged: (index, reason) {
              controller.selectedBannerIndex.value = index;
            },
          )),
      const SizedBox(height: 5),
      Obx(() => DotsIndicator(
        dotsCount: 4,
        position: controller.selectedBannerIndex.value,
        decorator: DotsDecorator(
          spacing: const EdgeInsets.all(3.0),
          color: context.appTheme.indicatorColor,
          activeColor: BaseColors.primaryColor,
          size: const Size(5, 5),
          activeSize: const Size(5, 5),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ))
    ]);
  }

  _type(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {

          },
          child: Container(
            decoration: BoxDecoration(
                color: BaseColors.white,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
              children: [
                const SizedBox(width: 16,),
                Image.asset(
                  'assets/image/tab/home_inactive.png',
                  height: 25,
                  width: 25,
                ),
                const SizedBox(width: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '我有钱包',
                        style: fontMedium.copyWith(
                            color: BaseColors.primaryColor,
                            fontSize: 14
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        '导入钱包、硬件钱包、多签钱包',
                        style: fontMedium.copyWith(
                            color: context.appTheme.weakTextColor,
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16,),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, index) {
        return Container(
          height: 10,
        );
      },
    );
  }
}
