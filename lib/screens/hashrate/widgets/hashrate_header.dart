import 'package:dgpt/models/pulse/hasrate_progress_info.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HashrateHeader extends StatelessWidget {

  PowerInfo? powerInfo;
  HasrateProgressInfo? progressInfo;
  bool isIncome;
  double totalRoi;

  HashrateHeader({super.key, this.powerInfo, this.progressInfo, this.isIncome = false, this.totalRoi = 0});

  @override
  Widget build(BuildContext context) {
    return _header();
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        children: [
          _buildHeaderContainer(),
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
          powerInfo?.name ?? '无算力',
          style: fontDMBold.copyWith(
            color: BaseColors.white,
            fontSize: 16,
          ),
        ),
        Expanded(child: Container()),
        if (powerInfo?.code != null && !isIncome)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPadding),
              border:
              Border.all(color: BaseColors.secondPrimaryColor, width: 1),
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
    return Row(
      children: [
        Container(
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
                powerInfo?.orderNo.toString() ?? '',
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
        ),
        Expanded(child: Container()),
        if (isIncome)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF892EFF).withOpacity(0.8),
                  const Color(0xFF1C4C99).withOpacity(0.8),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/income/sy.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: defaultPadding / 2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '总收益',
                      style: fontDMRegular.copyWith(
                        color: BaseColors.weakTextColor,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '$totalRoi U',
                      style: fontDMBold.copyWith(
                        color: BaseColors.secondPrimaryColor,
                        fontSize: 18,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      ],
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
            width: (SizeUtil.width() - defaultPadding * 4) * getProgress(),
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
        if (progressInfo?.next?.conditionDto != null)
          ..._buildConditionalRow1(
            tr('hashrate.computing_power_rental'),
            progressInfo!.next!.conditionDto!.minPlanAmount,
            progressInfo!.planAmount,
          ),
        if (progressInfo?.next?.conditionDto != null)
          ..._buildConditionalRow(
            tr('hashrate.direct_referral_count'),
            progressInfo!.next!.conditionDto!.directCount,
            progressInfo!.directCount,
          ),
        if (progressInfo?.next?.conditionDto != null)
          ..._buildConditionalRow(
            tr('hashrate.team_members'),
            progressInfo!.next!.conditionDto!.teamCount,
            progressInfo!.teamCount,
          ),
      ],
    );
  }

  List<Widget> _buildConditionalRow1(
      String label, double conditionValue, double count) {
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

  List<Widget> _buildConditionalRow(
      String label, int conditionValue, int count) {
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

  double getProgress() {

    if (powerInfo == null) {
      return 0;
    }

    double progress = 0;
    double count = 0;
    if (progressInfo?.next?.conditionDto != null) {

      if (progressInfo!.next!.conditionDto!.minPlanAmount > 0) {
        progress += progressInfo!.planAmount / progressInfo!.next!.conditionDto!.minPlanAmount;
        if (progress > 1) {
          progress = 1;
        }
        count += 1;
      }

      if (progressInfo!.next!.conditionDto!.teamCount > 0) {
        progress += progressInfo!.teamCount / progressInfo!.next!.conditionDto!.teamCount;
        if (progress > 1) {
          progress = 1;
        }
        count += 1;
      }

      if (progressInfo!.next!.conditionDto!.directCount > 0) {
        progress += progressInfo!.directCount / progressInfo!.next!.conditionDto!.directCount;
        if (progress > 1) {
          progress = 1;
        }
        count += 1;
      }
    }

    String formattedResult = '0';
    if (count > 0) {
      formattedResult = (progress / (count * 1.0)).toStringAsFixed(4);
    }
    return double.parse(formattedResult);
  }
}
