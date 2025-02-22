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

  HashrateHeader(
      {super.key,
      this.powerInfo,
      this.progressInfo,
      this.isIncome = false,
      this.totalRoi = 0});

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
          const SizedBox(height: defaultPadding / 2),
          _buildPowerLevel(),
          const SizedBox(height: defaultPadding / 2),
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
          tr('hashrate.computing_power_level'),
          style: fontDMBold.copyWith(
            color: BaseColors.white,
            fontSize: 16,
          ),
        ),
        Expanded(child: Container()),
        if (powerInfo?.orderNo != 0 && !isIncome)
          Container(
            height: 18,
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
              if (powerInfo?.orderNo != 0  && powerInfo?.orderNo != 1 && powerInfo?.orderNo != 6)
                Text(
                  ((powerInfo?.orderNo ?? 0) - 1).toString(),
                  style: fontDMBold.copyWith(
                    color: BaseColors.white,
                    fontSize: 20,
                  ),
                ),
              if (powerInfo?.orderNo != 0)
                Image.asset(
                  'assets/images/home/income_power_icon.png',
                  width: (powerInfo?.orderNo ?? 0) == 6
                      ? 15
                      : (powerInfo?.orderNo ?? 0) < 2
                          ? 11
                          : 13,
                  height: (powerInfo?.orderNo ?? 0) == 6
                      ? 15
                      : (powerInfo?.orderNo ?? 0) < 2
                          ? 11
                          : 13,
                ),
              const Spacer(),
            ],
          ),
        ),
        Expanded(child: Container()),
        if (isIncome)
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding / 2),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF892EFF).withOpacity(0.8),
                    const Color(0xFF1C4C99).withOpacity(0.8),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/income/sy.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: defaultPadding / 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('home.total_income'),
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
        if (powerInfo?.orderNo != 0)
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

  /*
  * 无算力
  基础算力 存款 100U
  1级算力 1st：邀请5人
  2级算力 直推3位成为1级算力（团队总人数20人）
  3级算力 直推3位成为2级算力（团队总人数65人）
  4级算力 直推3位成为3级算力（团队总人数200人）
  高级算力 直推3位成为4级算力（团队总人数605人）
  * */
  Widget _buildConditionalRows() {
    String detail = '';
    switch (powerInfo?.orderNo ?? 0) {
      case 0:
        detail = tr('profile.deposit');
        break;
      case 1:
        detail = '${tr('home.invite')} 5';
        break;
      case 2:
        detail = tr('hashrate.directly_refer_become_level', args: ['1']);
        break;
      case 3:
        detail = tr('hashrate.directly_refer_become_level', args: ['2']);
        break;
      case 4:
        detail = tr('hashrate.directly_refer_become_level', args: ['3']);
        break;
      case 5:
        detail = tr('hashrate.directly_refer_become_level', args: ['4']);
        break;
    }
    return Column(
      children: [
        if (progressInfo?.next?.conditionDto != null &&
            (powerInfo?.orderNo ?? 0) == 0)
          ..._buildConditionalRow1(
            tr('hashrate.computing_power_rental'),
            progressInfo!.next!.conditionDto!.minPlanAmount,
            progressInfo!.planAmount,
          ),
        if (progressInfo?.next?.conditionDto != null &&
            (powerInfo?.orderNo ?? 0) != 0)
          ..._buildConditionalRow(
            detail,
            progressInfo!.next!.conditionDto!.directCount,
            progressInfo!.directCount,
          ),
        if (progressInfo?.next?.conditionDto != null &&
            (powerInfo?.orderNo ?? 0) > 1)
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
            Expanded(
              child: Text(
                label,
                style: fontDMMedium.copyWith(
                  color: BaseColors.white,
                  fontSize: 14,
                ),
              ),
            ),
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
      if (powerInfo!.orderNo == 0 &&
          progressInfo!.next!.conditionDto!.minPlanAmount > 0) {
        if (progressInfo!.planAmount /
            progressInfo!.next!.conditionDto!.minPlanAmount > 1) {
          progress += 1;
        } else {
          progress += progressInfo!.planAmount /
              progressInfo!.next!.conditionDto!.minPlanAmount;
        }
        count += 1;
      }

      if ((powerInfo?.orderNo ?? 0) > 1 &&
          progressInfo!.next!.conditionDto!.teamCount > 0) {
        if (progressInfo!.teamCount /
            progressInfo!.next!.conditionDto!.teamCount > 1) {
          progress += 1;
        } else {
          progress += progressInfo!.teamCount /
              progressInfo!.next!.conditionDto!.teamCount;
        }
        count += 1;
      }

      if ((powerInfo?.orderNo ?? 0) != 0 &&
          progressInfo!.next!.conditionDto!.directCount > 0) {

        if (progressInfo!.directCount /
            progressInfo!.next!.conditionDto!.directCount > 1) {
          progress += 1;
        } else {
          progress += progressInfo!.directCount /
              progressInfo!.next!.conditionDto!.directCount;
        }
        count += 1;
      }
    }

    print('-----------');
    print(count);
    print(progress);
    String formattedResult = '0';
    if (count > 0) {
      formattedResult = (progress / (count * 1.0)).toStringAsFixed(4);
    }
    return double.parse(formattedResult);
  }
}
