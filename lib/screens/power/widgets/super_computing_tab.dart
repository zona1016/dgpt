import 'package:dgpt/screens/power/power_screen_controller.dart';
import 'package:dgpt/screens/power/widgets/super_computing_live_tab.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperComputingTab extends GetView<PowerScreenController> {
  const SuperComputingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.only(left: defaultPadding),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: BaseColors.primaryColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/tab/home_inactive.png",
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: defaultPadding / 2,
                                ),
                                Text(
                                  '440',
                                  style: fontSFProMedium.copyWith(
                                    fontSize: 14,
                                    color: BaseColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              'ending',
                              style: fontSFProMedium.copyWith(
                                fontSize: 14,
                                color: BaseColors.white,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: defaultPadding,
            ),
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.only(left: defaultPadding),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: BaseColors.primaryColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/tab/home_inactive.png",
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: defaultPadding / 2,
                                ),
                                Text(
                                  '440',
                                  style: fontSFProMedium.copyWith(
                                    fontSize: 14,
                                    color: BaseColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              'ending',
                              style: fontSFProMedium.copyWith(
                                fontSize: 14,
                                color: BaseColors.white,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding,),
        _buildTabBar(context),
        const SizedBox(height: defaultPadding,),
        Expanded(child: _buildTabBarViews(context))
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
        controller: controller.superTabController,
        tabs: controller.superComputingTabList
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
        controller: controller.superTabController,
        children: const [
          SuperComputingLiveTab(),
          SuperComputingLiveTab(),
          SuperComputingLiveTab(),
        ],
      ),
    );
  }
}
