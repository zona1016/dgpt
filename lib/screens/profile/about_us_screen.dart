import 'package:dgpt/screens/profile/about_us_screen_controller.dart';
import 'package:dgpt/screens/profile/widgets/company_tab.dart';
import 'package:dgpt/screens/profile/widgets/contact_us_tab.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/size.dart';
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
        backgroundColor: Colors.transparent,
        backgroundImage: 'assets/images/custom/about_us_bg.jpg',
        body: Column(
          children: [
            SizedBox(
              height: 169,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      height: 44,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.chevron_left,
                          size: 30,
                          color: Colors.white,
                        ),
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
        ));
  }

  Widget _buildTabBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtil.width() / 6.0),
      child: TabBar(
        isScrollable: false,
        dividerHeight: 0,
        indicatorColor: BaseColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: BaseColors.primaryColor,
        labelStyle: fontHeavy.copyWith(fontSize: 14),
        unselectedLabelColor: context.appTheme.weakTextColor,
        unselectedLabelStyle: fontMedium.copyWith(fontSize: 14),
        controller: controller.tabController,
        indicator: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/custom/tab_bar_line.png'),
            fit: BoxFit.contain, // 根据需要调整图片适应方式
            alignment: Alignment.bottomCenter,
          ),
        ),
        tabs: controller.tabList.asMap().entries.map(
          (entry) {
            int index = entry.key;
            String key = entry.value;
            return Tab(
              height: 90,
              child: Column(
                children: [
                  Image.asset(controller.tabPathList[index], width: 50),
                  const Spacer(),
                  Text(
                    key,
                    style: fontDMMedium.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                ],
              ),
            );
          },
        ).toList(),
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
