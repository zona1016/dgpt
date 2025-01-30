import 'package:dgpt/screens/profile/about_us_screen_controller.dart';
import 'package:dgpt/screens/profile/widgets/company_tab.dart';
import 'package:dgpt/screens/profile/widgets/contact_us_tab.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends GetView<AboutUsScreenController> {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      safeAreaTop: false,
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    height: 44,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.chevron_left, size: 30, color: Colors.white,),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          _buildTabBar(context),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(child: _buildTabBarViews(context)),
        ],
      )
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: TabBar(
        isScrollable: false,
        indicatorColor: BaseColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: BaseColors.primaryColor,
        labelStyle: fontHeavy.copyWith(fontSize: 14),
        unselectedLabelColor: context.appTheme.weakTextColor,
        unselectedLabelStyle: fontMedium.copyWith(fontSize: 14),
        controller: controller.tabController,
        tabs: controller.tabList
            .map(
              (String key) => Tab(
                height: 76,
                child: Column(
                  children: [
                    const Spacer(),
                    Image.asset(
                        "assets/images/tab/tutorial_inactive.png",
                        width: 20),
                    const Spacer(),
                    Text(
                      key,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                  ],
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
          CompanyTab(),
          ContactUsTab(),
        ],
      ),
    );
  }
}
