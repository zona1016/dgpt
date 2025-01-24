import 'package:carousel_slider/carousel_slider.dart';
import 'package:dgpt/screens/home/home_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/default_navigation_header.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

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
                  DefaultNavigationHeader(
                    defaultLeftTitle: 'Welcome To DGPT',
                    rightImages: const [
                      'assets/images/tab/home_inactive.png',
                      'assets/images/tab/home_inactive.png',
                      'assets/images/tab/home_inactive.png'
                    ],
                    onRightImageTaps: (index) {},
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: _carousel(context),
                  ),
                  _marquee(),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: _collectionOfFeatures(onTap: (index) {}),
                  )
                ],
              ),
            ),
          ],
        ),
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

  _marquee() {
    return Container(
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: BaseColors.black),
        child: Row(
          children: [
            Container(
              width: 60,
              color: Colors.cyan,
            ),
            const SizedBox(
              width: defaultPadding,
            ),
            Container(
              height: 24,
              width: 2,
              color: Colors.white,
            ),
            const SizedBox(
              width: defaultPadding,
            ),
            SizedBox(
              width: 100,
              child: Marquee(
                text: '1234567',
                style:
                    fontSFProMedium.copyWith(color: Colors.white, fontSize: 14),
                blankSpace: 50,
                velocity: 10.0,
                startPadding: defaultPadding / 2,
              ),
            ),
            Expanded(child: Container()),
            const Icon(
              Icons.keyboard_arrow_right,
              size: 24,
              color: Colors.white,
            ),
            const SizedBox(
              width: defaultPadding,
            ),
          ],
        ));
  }

  _collectionOfFeatures({required Function(int index) onTap}) {
    List titles = ['Task Center', 'Tutorials', 'Invitation', 'About Us'];
    return Row(
      children: List.generate(titles.length, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/tab/home_inactive.png',
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Text(
                    titles[index],
                    style: fontSFProMedium.copyWith(
                      fontSize: 12,
                      color: BaseColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
