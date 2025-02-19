import 'package:dgpt/models/pulse/layer_info.dart';
import 'package:dgpt/screens/income/active_member_detail_screen.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivatedMember extends StatefulWidget {

  List<LayerInfo> layerList;

  ActivatedMember({super.key, required this.layerList});

  @override
  State<ActivatedMember> createState() => _ActivatedMemberState();
}

class _ActivatedMemberState extends State<ActivatedMember> {

  List <Color> levelColorList = [
    const Color(0xFF17CE92).withOpacity(0.5),
    const Color(0xFF126FA5).withOpacity(0.5),
    const Color(0xFF7912A5).withOpacity(0.5),
  ];

  List <String> levelTitleList = [
    '第一代',
    '第二代',
    '第三代',
  ];

  List<String> teamTitleList = [
    '总人数',
    '有效会员',
    '今日收益',
    '总收益'
  ];

  List<String> teamTitleImageList = [
    'assets/images/income/team_djhy.png',
    'assets/images/income/team_yxhy.png',
    'assets/images/income/team_jrsy.png',
    'assets/images/income/team_zsy.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: levelColorList.length,
      itemBuilder: (_, index) {
        return _cardItem(index);
      },
      separatorBuilder: (_, index) {
        return Container(
          height: defaultPadding,
          color: Colors.transparent,
        );
      },
    );
  }

  _cardItem(int superIndex) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          color: levelColorList[superIndex]),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/income/team_leve_left_iconl.png',
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: defaultPadding / 2,
              ),
              Text(
                levelTitleList[superIndex],
                style:
                fontDMBold.copyWith(color: BaseColors.white, fontSize: 18),
              ),
              Expanded(child: Container()),
              // Text(
              //   '比率：5%',
              //   style: fontDMBold.copyWith(
              //       color: BaseColors.weakTextColor, fontSize: 10),
              // ),
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: defaultPadding / 2,
              mainAxisSpacing: defaultPadding / 2,
              childAspectRatio: 2,
            ),
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  if (index == 0) {
                  } else if (index == 1) {
                    Get.toNamed(AppRoutes.activeMember,
                        arguments: ActiveMemberDetailScreenArgs(
                            layer: widget.layerList[superIndex].layer ?? 0));
                  } else if (index == 2) {
                  } else {}
                },
                child: _buildIncomeCard(superIndex, index),
              );
            },
          ),
        ],
      ),
    );
  }

  _buildIncomeCard(int superIndex, int index) {
    if (widget.layerList.isEmpty) return Container();
    LayerInfo layerInfo = widget.layerList[superIndex];
    bool showIcon = false;
    double? count = 0;
    if (index == 0) {
      count = (layerInfo.userCount ?? 0).toDouble();
    } else if (index == 1) {
      showIcon = true;
      count = (layerInfo.realUserCount ?? 0).toDouble();
    } else if (index == 2) {
      count = layerInfo.todyRoiTotal;
    } else if (index == 3) {
      count = layerInfo.roiTotal;
    }

    return Container(
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding / 2),
          color: const Color(0xFF000000).withOpacity(0.5)),
      child: Row(
        children: [
          Image.asset(
            teamTitleImageList[index],
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
                  teamTitleList[index],
                  style: fontDMMedium.copyWith(
                      color: BaseColors.weakTextColor, fontSize: 10),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: defaultPadding / 5,
                ),
                Text(
                  count.toString(),
                  style: fontDMBold.copyWith(
                      color: BaseColors.primaryColor, fontSize: 16),
                  maxLines: 1,
                ),
                const Spacer(),
              ],
            ),
          ),
          if (showIcon)
            const Icon(
              Icons.chevron_right,
              size: 25,
              color: BaseColors.white,
            ),
        ],
      ),
    );
  }
}
