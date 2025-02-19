import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_buy_detail_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_detail_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_screen_controller.dart';
import 'package:dgpt/screens/hashrate/widgets/hashrate_header.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
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
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                if (controller.loaded.value)
                                  HashrateHeader(
                                    powerInfo: controller.powerInfo.value,
                                    progressInfo: controller.progressInfo.value,
                                  ),
                                Text(
                                  tr('hashrate.product_details'),
                                  style: fontDMBold.copyWith(
                                    color: BaseColors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                              ],
                            ),
                          ),
                          SliverGrid.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: defaultPadding,
                              mainAxisSpacing: defaultPadding,
                              childAspectRatio: kIsWeb ? 0.4 : 0.43,
                            ),
                            itemCount: controller.hasratePageList.length,
                            // Number of items
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  _rentalItem(index),
                                  if (controller.hasratePageList[index].code == 'B0001')
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/hashrate/ty_bg.png'),
                                        )),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: defaultPadding / 4,
                                              horizontal: defaultPadding / 2),
                                          child: Transform.rotate(
                                            angle: 0.785, // -45° 角度
                                            child: const Text(
                                              "体验",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
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

  _rentalItem(int index) {
    PlanDetail hasratePageInfo = controller.hasratePageList[index];
    // Common text style
    TextStyle whiteText14 =
        fontDMMedium.copyWith(color: BaseColors.white, fontSize: 14);
    TextStyle whiteText10 =
        fontDMRegular.copyWith(color: BaseColors.white, fontSize: 10);
    TextStyle whiteText18 =
        fontDMBold.copyWith(color: BaseColors.white, fontSize: 16);
    TextStyle whiteText20 =
        fontDMBold.copyWith(color: BaseColors.white, fontSize: 20);

    // Helper method for creating a row with two texts
    Widget _buildRow(String leftText, String rightText, TextStyle leftStyle,
        TextStyle rightStyle) {
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(leftText, style: leftStyle, textAlign: TextAlign.left),
          ),
          Expanded(
            flex: 1,
            child: Text(
              rightText,
              style: rightStyle,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      decoration: BoxDecoration(
          gradient: BaseColors.incomeLinearGradient,
          border: Border.all(color: BaseColors.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(defaultPadding / 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Expanded(
                child: Text(
                  hasratePageInfo.name,
                  style: whiteText18,
                ),
              ),
              if (controller.hasratePageList[index].isBuy &&
                  controller.hasratePageList[index].buyStatus == 1 &&
                  index != 0)
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.hashrateRentalActive);
                  },
                  child: Container(
                    width: 38,
                    height: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: BaseColors.primaryColor),
                    child: Center(
                      child: Text(
                        tr('hashrate.details'),
                        style: fontDMBold.copyWith(
                            color: BaseColors.white, fontSize: 7),
                      ),
                    ),
                  ),
                )
            ],
          ),
          Text(
            hasratePageInfo.code,
            style: whiteText14,
          ),
          const SizedBox(height: defaultPadding),
          Center(
              child: BaseNetworkImage(
            imageURL: hasratePageInfo.logoFileIdUrl,
            placeholder:
                'assets/images/home/income_icon${index == 0 ? 1 : ''}.png',
            height: 106,
            width: 100,
            fit: BoxFit.cover,
          )),
          const SizedBox(height: defaultPadding),
          Text(
            tr('hashrate.rent_to_earn'),
            style: whiteText14,
          ),
          Row(
            children: [
              Text(
                '${hasratePageInfo.profitPreHour} U',
                style: whiteText20,
              ),
              Text(
                '/Per Hrs',
                style: whiteText10,
              ),
            ],
          ),
          if (!controller.hasratePageList[index].isBuy ||
              controller.hasratePageList[index].buyStatus == 0)
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.hashrateRentalDetail,
                    arguments: HashrateRentalDetailScreenArgs(
                        hasratePageInfo: controller.hasratePageList[index]));
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(defaultPadding / 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultPadding),
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/home/income_power_btn_bg.png'))),
                child: Center(
                  child: Text(
                    tr('hashrate.rental'),
                    style: whiteText18,
                  ),
                ),
              ),
            ),
          if (controller.hasratePageList[index].isBuy &&
              controller.hasratePageList[index].buyStatus == 1)
            BaseButton(
              enabled: false,
              disabledDecoration: BoxDecoration(
                  gradient: BaseColors.baseButtonLinearGradient,
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15)),
              height: 30,
              onPressed: () {},
              text: tr('hashrate.rental'),
            ),
          const Spacer(),
          _buildRow(tr('hashrate.contract_details'),
              '${hasratePageInfo.cycle}days', whiteText10, whiteText10),
          _buildRow(tr('hashrate.rental_funds'), '${hasratePageInfo.amount} U',
              whiteText10, whiteText10),
          _buildRow(
              tr('hashrate.rental_income'),
              '${NumberFormat('#0').format(hasratePageInfo.profitTotal)} U'
              '(${NumberFormat('#0').format(((hasratePageInfo.profitTotal - hasratePageInfo.amount) > 0 ? (hasratePageInfo.profitTotal - hasratePageInfo.amount) : hasratePageInfo.profitTotal) / hasratePageInfo.amount * 100)}%)',
              whiteText10,
              whiteText10),
          _buildRow(tr('hashrate.daily_income'),
              '${hasratePageInfo.profitPreDay} U', whiteText10, whiteText10),
          const Spacer(),
        ],
      ),
    );
  }
}
