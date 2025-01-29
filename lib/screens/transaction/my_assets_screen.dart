import 'package:dgpt/screens/profile/widgets/company_tab.dart';
import 'package:dgpt/screens/profile/widgets/contact_us_tab.dart';
import 'package:dgpt/screens/transaction/my_assets_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAssetsScreen extends GetView<MyAssetsScreenController> {
  const MyAssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
        title: '',
        actions: [
          SizedBox(
            width: Get.width - 40,
            child: Text(
              'USDT-TRC20',
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: BaseColors.white,
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: defaultPadding / 4),
                    Center(
                      child: Image.asset(
                        'assets/images/tab/data_inactive.png',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding / 4,
                    ),
                    Center(
                      child: Text(
                        'DGPT',
                        style: fontSFProMedium.copyWith(
                          fontSize: 14,
                          color: BaseColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                _buildTabBar(context),
                const SizedBox(
                  height: defaultPadding,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
              hasScrollBody: true, child: _buildTabBarViews(context))
        ],
      ),
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
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
