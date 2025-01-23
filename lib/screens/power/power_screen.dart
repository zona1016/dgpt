import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dgpt/screens/power/power_screen_controller.dart';
import 'package:dgpt/screens/power/widgets/accelerator_tab_widget.dart';
import 'package:dgpt/screens/power/widgets/super_computing_tab.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/default_empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PowerScreen extends GetView<PowerScreenController> {
  const PowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: _buildHeader(),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                _carousel(context),
                const SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: _fixedSlider(context),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                _buildTabBar(context),
                const SizedBox(
                  height: defaultPadding,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: _buildTabBarViews(context)
          )
        ],
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
    final banners = ['1', '2', '3', '4', '5', '6'];
    return banners.isNotEmpty
        ? Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: CarouselSlider.builder(
                    itemCount: banners.length,
                    itemBuilder: (context, index, realIndex) {
                      final Random random = Random();
                      return Container(
                        color: Color.fromARGB(
                          random.nextInt(256), // A值 (0-255)
                          random.nextInt(256), // R值 (0-255)
                          random.nextInt(256), // G值 (0-255)
                          random.nextInt(256), // B值 (0-255)
                        ),
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        controller.selectedBannerIndex.value = index;
                      },
                    )),
              ),
            ),
          ])
        : Container();
  }

  _fixedSlider(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(child: Container()),
            _fixedSliderItem(context),
            _fixedSliderItem(context),
            _fixedSliderItem(context),
            _fixedSliderItem(context),
            _fixedSliderItem(context),
            _fixedSliderItem(context)
          ],
        ),
        Positioned(
          top: defaultPadding + 2,
          left: 0,
          right: 0,
          child: Container(
            height: 1,
            color: BaseColors.weakTextColor,
          ),
        ),
      ],
    );
  }

  _fixedSliderItem(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Container(
              height: defaultPadding,
              width: 1,
              color: Colors.red,
            ),
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
            )
          ],
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        Column(
          children: [
            Container(
              height: defaultPadding / 2,
              width: 1,
              color: Colors.red,
            ),
            Container(
              height: 3,
            ),
          ],
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        Column(
          children: [
            Container(
              height: defaultPadding / 2,
              width: 1,
              color: Colors.red,
            ),
            Container(
              height: 3,
            ),
          ],
        ),
        const SizedBox(
          width: defaultPadding,
        )
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: TabBar(
        isScrollable: false,
        indicatorColor: BaseColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: BaseColors.primaryColor,
        labelStyle: fontHeavy.copyWith(fontSize: 14),
        unselectedLabelColor: context.appTheme.weakTextColor,
        unselectedLabelStyle: fontMedium.copyWith(fontSize: 14),
        controller: controller.tabController,
        tabs: controller.tabList
            .map(
              (String key) => Tab(
                child: Text(
                  key,
                  textAlign: TextAlign.center,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildTabBarViews(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: TabBarView(
        controller: controller.tabController,
        children: const [
          AcceleratorTabWidget(),
          SuperComputingTab(),
        ],
      ),
    );
  }
}
