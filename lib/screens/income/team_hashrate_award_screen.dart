import 'package:dgpt/screens/hashrate/widgets/hashrate_header.dart';
import 'package:dgpt/screens/income/team_hashrate_award_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamHashrateAwardScreen extends GetView<TeamHashrateAwardScreenController> {
  const TeamHashrateAwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: BaseAppBar(
        title: '团队算力奖',
        color: BaseColors.white,
      ),
      body: Obx(() => SingleChildScrollView(
        child: Column(
          children: [
            if (controller.loaded.value)
              HashrateHeader(
                powerInfo: controller.powerInfo.value,
                progressInfo: controller.progressInfo.value,
              ),
            _cardItem()
          ],
        ),
      )),
    );
  }

  _cardItem() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultPadding),
        color: const Color(0xFF17CE92).withOpacity(0.5)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '等级A',
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 18),
              ),
              Expanded(child: Container()),
              Text(
                '比率：5%',
                style: fontDMBold.copyWith(
                    color: BaseColors.weakTextColor, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding,),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: defaultPadding / 2,
            mainAxisSpacing: defaultPadding / 2,
            childAspectRatio: 2,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildIncomeCard(
                  tr('hashrate.computing_power_rental'),
                  0, onTap: () {
              }),
              _buildIncomeCard(
                  tr('hashrate.team_computing_power_bonus'),
                  0, onTap: () {
              }),
              _buildIncomeCard(
                  tr('hashrate.invitation_bonus'),
                  0, onTap: () {
              }),
              _buildIncomeCard(
                  tr('hashrate.salary'),
                  0,
                  onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeCard(String title, double amount,
      {GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding / 2),
          color: const Color(0xFF000000).withOpacity(0.5)
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/home/day_return.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: defaultPadding / 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    title,
                    style: fontDMMedium.copyWith(
                        color: BaseColors.weakTextColor, fontSize: 10),
                  ),
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Text(
                    amount.toString(),
                    style: fontDMBold.copyWith(
                        color: BaseColors.primaryColor, fontSize: 16),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 25,
              color: BaseColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
