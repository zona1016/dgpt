import 'package:dgpt/screens/notice/notice_tab.dart';
import 'package:dgpt/screens/profile/widgets/company_tab.dart';
import 'package:dgpt/screens/profile/widgets/contact_us_tab.dart';
import 'package:dgpt/screens/transaction/assets_tab.dart';
import 'package:dgpt/screens/transaction/my_assets_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_auto_keep_alive.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAssetsScreen extends GetView<MyAssetsScreenController> {
  const MyAssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.transparent),
        ),
        title: tr('profile.my_assets'),
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/images/custom/logo.png",
              width: 25,
              height: 26,
            ),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: ExtendedNestedScrollView.sliverOverlapAbsorberHandleFor(
                    context),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      _buildHeader(),
                      _buildTabBar(context),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: _buildTabBarViews(context),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPadding),
              gradient: BaseColors.incomeLinearGradient
          ),
          child: Column(
            children: [
              Text(
                tr('profile.my_assets'),
                style: fontDMMedium.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: defaultPadding / 4,),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    '0.00',
                    style: fontDMBold.copyWith(
                      color: BaseColors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(width: defaultPadding / 4,),
                  Text(
                    'USDT',
                    style: fontDMBold.copyWith(
                      color: BaseColors.white,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: defaultPadding,),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.recharge),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/home/assets_cz.png',
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(height: defaultPadding / 4,),
                        Text(
                          tr('profile.deposit'),
                          style: fontDMMedium.copyWith(
                            color: BaseColors.lightGray,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/home/assets_zyzc.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(height: defaultPadding / 4,),
                      Text(
                        tr('profile.transfer_assets'),
                        style: fontDMMedium.copyWith(
                          color: BaseColors.lightGray,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/home/assets_tx.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(height: defaultPadding / 4,),
                      Text(
                        tr('profile.withdraw'),
                        style: fontDMMedium.copyWith(
                          color: BaseColors.lightGray,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding / 4,
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
      isScrollable: false,
      indicatorWeight: 0,
      dividerHeight: 0,
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: BaseColors.white,
      labelStyle: fontHeavy.copyWith(fontSize: 14),
      unselectedLabelColor: context.appTheme.weakTextColor,
      unselectedLabelStyle: fontMedium.copyWith(fontSize: 14),
      controller: controller.tabController,
      indicator: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/custom/tab_bar_line.png'),
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
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
    );
  }

  Widget _buildTabBarViews(BuildContext context) {
    return TabBarView(
      controller: controller.tabController,
      children: controller.tabs.entries
        .map(
    (e) {
      return ExtendedVisibilityDetector(
        uniqueKey: Key(e.key),
        child: BaseAutomaticKeepAlive(
          child: AssetsTab(
            key: PageStorageKey<String>(e.key),
            type: e.key,
            injector: Builder(
              builder: (BuildContext innerContext) {
                return SliverOverlapInjector(
                  handle: ExtendedNestedScrollView
                      .sliverOverlapAbsorberHandleFor(innerContext),
                );
              },
            ),
          ),
        ),
      );
    },
    )
    .toList(),
    );
  }
}
