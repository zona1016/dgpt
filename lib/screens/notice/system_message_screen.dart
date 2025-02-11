import 'package:collection/collection.dart';
import 'package:dgpt/screens/notice/notice_tab.dart';
import 'package:dgpt/screens/notice/system_message_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_auto_keep_alive.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemMessageScreen extends GetView<SystemMessageScreenController> {
  const SystemMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('home.system_prompt'),
        color: BaseColors.white,
      ),
      body: ExtendedNestedScrollView(
        onlyOneScrollInBody: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: ExtendedNestedScrollView.sliverOverlapAbsorberHandleFor(
                  context),
              sliver: SliverToBoxAdapter(
                child: _buildTabBar(context),
              ),
            ),
          ];
        },
        body: _buildTabBarViews(context),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding / 2),
      child: TabBar(
        isScrollable: false,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: BaseColors.white,
        labelStyle: fontHeavy.copyWith(fontSize: 14),
        unselectedLabelColor: BaseColors.weakTextColor,
        unselectedLabelStyle: fontMedium.copyWith(fontSize: 14),
        controller: controller.tabController,
        indicator: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/custom/tab_bar_line.png'),
            fit: BoxFit.contain, // 根据需要调整图片适应方式
            alignment: Alignment.bottomCenter,
          ),
        ),
        tabs: controller.noticeTabs.entries
            .mapIndexed(
              (index, e) => Tab(
                height: 86,
                child: Column(
                  children: [
                    const Spacer(),
                    Image.asset(controller.noticeTabPathList[index], width: 44, height: 44,),
                    const Spacer(),
                    Text(
                      e.value,
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
    return TabBarView(
      controller: controller.tabController,
      children: controller.noticeTabs.entries
          .map(
            (e) {
              int tabIndex = controller.noticeTabs.keys.toList().indexOf(e.key);
              return ExtendedVisibilityDetector(
                uniqueKey: Key(e.key),
                child: BaseAutomaticKeepAlive(
                  child: NoticeTab(
                    key: PageStorageKey<String>(e.key),
                    type: tabIndex,
                    imagePath: controller.noticeTabPathList[tabIndex],
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
