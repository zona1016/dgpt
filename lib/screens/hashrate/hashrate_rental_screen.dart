import 'package:dgpt/models/pulse/hashrate_page_info.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_detail_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_screen_controller.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HashrateRentalScreen extends GetView<HashrateRentalScreenController> {
  const HashrateRentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      safeAreaTop: false,
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      body: Obx(() => Column(
            children: [
              _tabBar(context),
              if (controller.powerInfo.value?.name != null) _header(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: BaseSmartRefresher(
                    refreshController: controller.refreshController,
                    enableLoadMore: true,
                    uiState: controller.uiState.value,
                    isEmpty: controller.hasratePageList.isEmpty,
                    onPullToRefresh: (loadingState) {
                      controller.hashratePage(loadingState: loadingState);
                    },
                    onLoadMore: (loadingState) {
                      controller.hashratePage(loadingState: loadingState);
                    },
                    childBuilder: (context, physics) {
                      return CustomScrollView(
                        physics: physics,
                        slivers: [
                          SliverGrid.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: defaultPadding,
                              mainAxisSpacing: defaultPadding,
                              childAspectRatio: 0.4,
                            ),
                            itemCount: controller.hasratePageList.length,
                            // Number of items
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.hashrateRentalDetail,
                                      arguments: HashrateRentalDetailScreenArgs(
                                          hasratePageInfo: controller
                                              .hasratePageList[index]));
                                },
                                child: _rentalItem(index),
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }

  _tabBar(context) {
    return Container(
      height: MediaQuery.of(context).padding.top + 44,
      width: double.infinity,
      decoration: BoxDecoration(gradient: BaseColors.appBarLinearGradient),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: defaultPadding / 2),
          child: Text(
            tr('hashrate.computing_power_rental'),
            style: fontBold.copyWith(fontSize: 20, color: BaseColors.white),
          ),
        ),
      ),
    );
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          _buildHeaderContainer(),
          const SizedBox(height: defaultPadding),
          Text(
            tr('hashrate.product_details'),
            style: fontDMBold.copyWith(
              color: BaseColors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderContainer() {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        gradient: BaseColors.incomeLinearGradient,
        borderRadius: BorderRadius.circular(10), // 圆角
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleRow(),
          const SizedBox(height: defaultPadding),
          _buildPowerLevel(),
          const SizedBox(height: defaultPadding),
          _buildActionRow(),
          const SizedBox(height: defaultPadding / 4),
          _buildProgressBar(),
          const SizedBox(height: defaultPadding),
          _buildConditionalRows(),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      children: [
        Text(
          controller.powerInfo.value?.name ?? '',
          style: fontDMBold.copyWith(
            color: BaseColors.white,
            fontSize: 16,
          ),
        ),
        Expanded(child: Container()),
        if (controller.powerInfo.value?.code != null)
          Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
            border: Border.all(color: BaseColors.secondPrimaryColor, width: 1),
            color: BaseColors.secondPrimaryColor.withOpacity(0.1),
          ),
          child: Text(
            tr('hashrate.in_progress'),
            style: fontDMRegular.copyWith(
              color: BaseColors.secondPrimaryColor,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPowerLevel() {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home/income_power_level.png'),
        ),
      ),
      child: Row(
        children: [
          const Spacer(),
          Text(
            controller.powerInfo.value?.secondLayer.toString() ?? '',
            style: fontDMBold.copyWith(
              color: BaseColors.white,
              fontSize: 20,
            ),
          ),
          Image.asset(
            'assets/images/home/income_power_icon.png',
            width: 13,
            height: 13,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildActionRow() {
    return Row(
      children: [
        Text(
          tr('hashrate.in_progress'),
          style: fontDMMedium.copyWith(
            color: BaseColors.white,
            fontSize: 14,
          ),
        ),
        Expanded(child: Container()),
        GestureDetector(
          onTap: () {
            final MainScreenController mainController = Get.find();
            mainController.selectedTabIndex(3);
            mainController.pageController.jumpToPage(3);
            mainController.update();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPadding),
              color: BaseColors.primaryColor,
            ),
            child: Text(
              tr('hashrate.income_analysis'),
              style: fontDMBold.copyWith(
                color: BaseColors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: double.infinity,
      height: 10,
      decoration: BoxDecoration(
        color: BaseColors.whiteGray3.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          AnimatedContainer(
            width: (Get.size.width - defaultPadding * 4) * controller.getProgress(),
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF05CCFF),
                  Color(0xFF08C8FF),
                  Color(0xFF4F7FFF),
                  Color(0xFF834AFF),
                  Color(0xFFA32AFF),
                  Color(0xFFB01EFF),
                ],
                stops: [0.0, 0.02, 0.37, 0.66, 0.88, 1.0],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConditionalRows() {
    return Column(
      children: [
        if (controller.progressInfo.value?.next?.conditionDto != null)
          ..._buildConditionalRow1(
            tr('hashrate.computing_power_rental'),
            controller.progressInfo.value!.next!.conditionDto!.minPlanAmount,
            controller.progressInfo.value!.planAmount,
          ),
        if (controller.progressInfo.value?.next?.conditionDto != null)
          ..._buildConditionalRow(
            tr('hashrate.direct_referral_count'),
            controller.progressInfo.value!.next!.conditionDto!.directCount,
            controller.progressInfo.value!.directCount,
          ),
        if (controller.progressInfo.value?.next?.conditionDto != null)
          ..._buildConditionalRow(
            tr('hashrate.team_members'),
            controller.progressInfo.value!.next!.conditionDto!.teamCount,
            controller.progressInfo.value!.teamCount,
          ),
      ],
    );
  }

  List<Widget> _buildConditionalRow1(String label, double conditionValue, double count) {
    if (conditionValue > 0) {
      return [
        Row(
          children: [
            Text(
              label,
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 14,
              ),
            ),
            Expanded(child: Container()),
            Text(
              '$count/$conditionValue',
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ];
    }
    return [];
  }

  List<Widget> _buildConditionalRow(String label, int conditionValue, int count) {
    if (conditionValue > 0) {
      return [
        Row(
          children: [
            Text(
              label,
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 14,
              ),
            ),
            Expanded(child: Container()),
            Text(
              '$count/$conditionValue',
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ];
    }
    return [];
  }

  _rentalItem(int index) {
    HasratePageInfo hasratePageInfo = controller.hasratePageList[index];
    // Common text style
    TextStyle whiteText14 = fontDMMedium.copyWith(color: BaseColors.white, fontSize: 14);
    TextStyle whiteText10 = fontDMRegular.copyWith(color: BaseColors.white, fontSize: 10);
    TextStyle whiteText18 = fontDMBold.copyWith(color: BaseColors.white, fontSize: 18);
    TextStyle whiteText20 = fontDMBold.copyWith(color: BaseColors.white, fontSize: 20);

    // Helper method for creating a row with two texts
    Widget _buildRow(String leftText, String rightText, TextStyle leftStyle, TextStyle rightStyle) {
      return Row(
        children: [
          Expanded(
            child: Text(leftText, style: leftStyle),
          ),
          Expanded(
            child: Text(rightText, style: rightStyle),
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          gradient: BaseColors.incomeLinearGradient,
          borderRadius: BorderRadius.circular(defaultPadding / 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hasratePageInfo.name,
            style: whiteText18,
          ),
          Text(
            hasratePageInfo.code,
            style: whiteText14,
          ),
          const SizedBox(height: defaultPadding),
          Center(
            child: Image.asset(
              'assets/images/home/income_icon.png',
              width: 100,
              height: 106,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Text(
            tr('hashrate.rent_to_earn'),
            style: whiteText14,
          ),
          Row(
            children: [
              Text(
                '\$${hasratePageInfo.profitPreHour}',
                style: whiteText20,
              ),
              Text(
                '/Per Hrs',
                style: whiteText10,
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(defaultPadding / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding),
                image: const DecorationImage(
                    image: AssetImage('assets/images/home/income_power_btn_bg.png'))),
            child: Center(
              child: Text(
                tr('hashrate.rental'),
                style: whiteText18,
              ),
            ),
          ),
          _buildRow(tr('hashrate.contract_details'), '${hasratePageInfo.cycle}days', whiteText10, whiteText10),
          _buildRow(tr('hashrate.rental_funds'), '\$${hasratePageInfo.amount}', whiteText10, whiteText10),
          _buildRow(tr('hashrate.rental_income'), '\$${hasratePageInfo.profitTotal}', whiteText10, whiteText10),
          _buildRow(tr('hashrate.daily_income'), '\$${hasratePageInfo.profitPreDay}', whiteText10, whiteText10),
        ],
      ),
    );
  }


}
