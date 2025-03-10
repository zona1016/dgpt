import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_active_screen_controller.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_buy_detail_screen.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HashrateRentalActiveScreen
    extends GetView<HashrateRentalActiveScreenController> {
  const HashrateRentalActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      safeAreaTop: false,
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: BaseAppBar(
        title: tr('hashrate.computing_power_rental'),
        color: BaseColors.white,
      ),
      body: Obx(() => GridView.builder(
            padding: const EdgeInsets.all(defaultPadding),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: kIsWeb ? 0.4 : 0.43,
            ),
            itemCount: controller.hasratePageList.length,
            // Number of items
            itemBuilder: (context, index) {
              return _rentalItem(index);
            },
          )),
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
          border:
              Border.all(color: BaseColors.thirdLightPrimaryColor, width: 1),
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
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.hashrateRentalBuyDetail,
                      arguments: HashrateRentalBuyDetailScreenArgs(
                          planDetail: controller.hasratePageList[index]));
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
              child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.hashrateRentalBuyDetail,
                  arguments: HashrateRentalBuyDetailScreenArgs(
                      planDetail: controller.hasratePageList[index]));
            },
            child: BaseNetworkImage(
              imageURL: hasratePageInfo.logoFileIdUrl,
              placeholder:
                  'assets/images/home/income_icon_${hasratePageInfo.name}.png',
              height: 106,
              width: 100,
              fit: BoxFit.fitHeight,
            ),
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
          BaseButton(
            enabled: false,
            disabledDecoration: BoxDecoration(
                gradient: BaseColors.baseButtonLinearGradient,
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15)),
            height: 30,
            onPressed: () {},
            text: tr('hashrate.rented'),
          ),
          const Spacer(),
          _buildRow(tr('hashrate.contract_details'),
              '${hasratePageInfo.cycle}days', whiteText10, whiteText10),
          _buildRow(tr('hashrate.rental_funds'), '${hasratePageInfo.amount} U',
              whiteText10, whiteText10),
          _buildRow(
              tr('hashrate.rental_income'),
              '${hasratePageInfo.profitTotal} U'
              '(${((hasratePageInfo.profitTotal - hasratePageInfo.amount) > 0 ? (hasratePageInfo.profitTotal - hasratePageInfo.amount) : hasratePageInfo.profitTotal) / hasratePageInfo.amount * 100}%)',
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
