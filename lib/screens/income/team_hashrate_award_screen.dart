import 'package:dgpt/models/pulse/layer_info.dart';
import 'package:dgpt/screens/hashrate/widgets/hashrate_header.dart';
import 'package:dgpt/screens/income/active_member_detail_screen.dart';
import 'package:dgpt/screens/income/team_hashrate_award_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamHashrateAwardScreen
    extends GetView<TeamHashrateAwardScreenController> {
  const TeamHashrateAwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: '团队算力奖',
        color: BaseColors.white,
      ),
      body: Obx(() => Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (controller.loaded.value)
                    HashrateHeader(
                      powerInfo: controller.powerInfo.value,
                      progressInfo: controller.progressInfo.value,
                      isIncome: true,
                      totalRoi: controller.incomeScreenController
                              .amountTotalInfo.value?.roiAmountTotal ??
                          0,
                    ),
                  if (controller.directTopList.isNotEmpty) _ranking(),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.levelColorList.length,
                    itemBuilder: (_, index) {
                      return _cardItem(index);
                    },
                    separatorBuilder: (_, index) {
                      return Container(
                        height: defaultPadding,
                        color: Colors.transparent,
                      );
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }

  _ranking() {
    return Container(
      padding: const EdgeInsets.all(defaultPadding).copyWith(top: 0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(child: _rankingDetail(isFirst: false, index: 2)),
            Expanded(child: _rankingDetail(isFirst: true, index: 1)),
            Expanded(child: _rankingDetail(isFirst: false, index: 3)),
          ],
        ),
      ),
    );
  }

  _rankingDetail({required bool isFirst, int? index = 1}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: isFirst ? 79 : 60,
                  width: isFirst ? 79 : 60,
                  child: const AspectRatio(
                    aspectRatio: 1,
                    child: BaseNetworkImage(
                      imageURL: '',
                      placeholder: 'assets/images/custom/logo.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: isFirst ? 18 : 8,
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/income/rank_$index.png',
                width: isFirst ? 30 : 21,
                height: isFirst ? 40 : 30,
              ),
            )
          ],
        ),
        const SizedBox(
          height: defaultPadding / 5,
        ),
        Text(
          'Wee',
          style: fontDMBold.copyWith(
              color: BaseColors.white, fontSize: isFirst ? 16 : 14),
        ),
        Text(
          '2级算力',
          style: fontDMBold.copyWith(
              color: BaseColors.weakTextColor, fontSize: 10),
        ),
        Text(
          '人数：25人',
          style: fontDMBold.copyWith(
              color: BaseColors.weakTextColor, fontSize: 10),
        )
      ],
    );
  }

  _cardItem(int superIndex) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          color: controller.levelColorList[superIndex]),
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
                controller.levelTitleList[superIndex],
                style:
                    fontDMBold.copyWith(color: BaseColors.white, fontSize: 18),
              ),
              Expanded(child: Container()),
              Text(
                '比率：5%',
                style: fontDMBold.copyWith(
                    color: BaseColors.weakTextColor, fontSize: 10),
              ),
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
                            layer: controller.layerList.value[superIndex].layer ?? 0));
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
    if (controller.layerList.isEmpty) return Container();
    LayerInfo layerInfo = controller.layerList[superIndex];
    double? count = 0;
    if (index == 0) {
      count = (layerInfo.userCount ?? 0).toDouble();
    } else if (index == 2) {
      count = (layerInfo.realUserCount ?? 0).toDouble();
    } else if (index == 3) {
      count = layerInfo.todyRoiTotal;
    } else if (index == 4) {
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
            controller.teamTitleImageList[index],
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
                  controller.teamTitleList[index],
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
