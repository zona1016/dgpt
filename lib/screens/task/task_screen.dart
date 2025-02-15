import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/screens/task/task_history_screen.dart';
import 'package:dgpt/screens/task/widgets/task_item_widget.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/widget/default_navigation_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dgpt/screens/task/task_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/default_empty_view.dart';

class TaskScreen extends GetView<TaskScreenController> {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.baseBackgroundImage,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              DefaultNavigationHeader(
                defaultLeftTitle: 'My Power',
                rightImages: const ['assets/images/tab/home_inactive.png'],
                onRightImageTaps: (index) {
                  Get.toNamed(AppRoutes.taskHistory, arguments: TaskHistoryScreenArgs(
                      historyType: TaskHistoryType.task
                  ));
                },
              ),
              _buildSummaryCard(),
              _buildTabBar(context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: _buildTabBarViews(context),
              ),
              _buildTrainingTask(context),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: _buildTrainingTaskListView(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            _buildItemWidget(
              imagePath: "assets/images/tab/home_inactive.png",
              title: 'Daily Yield',
              desc: '0.011USDT',
            ),
            const Spacer(),
            _buildItemWidget(
              imagePath: "assets/images/tab/home_inactive.png",
              title: 'Total Yield',
              desc: '22.222USDT',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildItemWidget({
    required String imagePath,
    required String title,
    required String desc,
  }) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 20,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: BaseColors.white,
              ),
            ),
            Text(
              desc,
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: BaseColors.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
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
    );
  }

  Widget _buildTabBarViews(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TabBarView(
        controller: controller.tabController,
        children: [
          _buildTabBarView(context: context),
          _buildTabBarView(context: context, showEmpty: true),
        ],
      ),
    );
  }

  Widget _buildTabBarView({
    required BuildContext context,
    bool showEmpty = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: BaseColors.black,
      ),
      child: showEmpty
          ? const DefaultEmptyView()
          : Column(
              children: [
                const Spacer(),
                _buildTabBarViewItem(
                  title: 'Model',
                  desc: 'Window NT 10.0',
                ),
                const Spacer(),
                _buildTabBarViewItem(
                  title: 'Daily Profit',
                  desc: '+0.01USDT',
                ),
                const Spacer(),
                _buildTabBarViewItem(
                  title: 'Training Task Profit',
                  desc: '36.6USDT',
                ),
                const Spacer(),
              ],
            ),
    );
  }

  Widget _buildTabBarViewItem({
    required String title,
    required String desc,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: fontSFProMedium.copyWith(
            fontSize: 14,
            color: BaseColors.white,
          ),
        ),
        const Spacer(),
        Text(
          desc,
          style: fontSFProMedium.copyWith(
            fontSize: 14,
            color: BaseColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTrainingTask(BuildContext context) {
    return Row(
      children: [
        Text(
          'Training tasks',
          style: fontSFProMedium.copyWith(
            fontSize: 14,
            color: BaseColors.white,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            final MainScreenController main = Get.find();
            main.selectedTabIndex(1);
            main.pageController.jumpToPage(1);
            main.update();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 0.5, color: BaseColors.primaryColor)),
            child: Text(
              'Training tasks >> ',
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: BaseColors.primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTrainingTaskListView(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (_, index) {
        return const TaskItemWidget();
      },
      separatorBuilder: (_, index) {
        return Container(
          height: defaultPadding / 2,
        );
      },
    );
  }

}
