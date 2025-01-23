import 'package:carousel_slider/carousel_slider.dart';
import 'package:dgpt/screens/home/home_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: _buildHeader(),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  _carousel(context),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(
            "assets/images/tab/home_inactive.png",
            width: 20,
          ),
          const SizedBox(width: defaultPadding / 2),
          Text(
            'Numerical Center',
            style: fontSFProMedium.copyWith(
              fontSize: 14,
              color: BaseColors.white,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              "assets/images/tab/home_inactive.png",
              width: 20,
            ),
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 35,
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.5),
                  color: BaseColors.primaryColor),
              child: Center(
                child: Text(
                  'Rules',
                  style: fontSFProMedium.copyWith(
                    fontSize: 14,
                    color: BaseColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _carousel(BuildContext context) {
    final banners = [
      'https://pic.rmb.bdstatic.com/bjh/events/c1e0c639d8e35ee85ec722988ec059e38721.png@h_1280',
      'https://q0.itc.cn/q_70/images01/20240304/0b8e5c32de4d4277a64c9f9e606273e1.jpeg',
      'https://q0.itc.cn/q_70/images01/20240304/0b8e5c32de4d4277a64c9f9e606273e1.jpeg'
    ];
    return banners.isNotEmpty
        ? Column(children: [
            Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                      .copyWith(topRight: const Radius.circular(75)),
                ),
                child: CarouselSlider.builder(
                    carouselController: controller.carouselSliderController,
                    itemCount: banners.length,
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {},
                        child: BaseNetworkImage(
                          imageURL: banners[index] ?? '',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      aspectRatio: 1,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        controller.selectedBannerIndex.value = index;
                      },
                    ))),
            const SizedBox(height: 5),
            Obx(() => DotsIndicator(
                  dotsCount: banners.length,
                  position: controller.selectedBannerIndex.value,
                  decorator: DotsDecorator(
                    spacing: const EdgeInsets.all(3.0),
                    color: context.appTheme.indicatorColor,
                    activeColor: BaseColors.primaryColor,
                    size: const Size(10, 10),
                    activeSize: const Size(10, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ))
          ])
        : Container();
  }
}
