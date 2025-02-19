import 'package:dgpt/models/pulse/layer_info.dart';
import 'package:dgpt/screens/hashrate/widgets/hashrate_header.dart';
import 'package:dgpt/screens/income/active_member_detail_screen.dart';
import 'package:dgpt/screens/income/team_hashrate_award_screen_controller.dart';
import 'package:dgpt/screens/income/widgets/activated_member.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
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
                  _ranking(),
                  ActivatedMember(layerList: controller.layerList)
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
              Expanded(child: _rankingDetail(isFirst: false, index: 1)),
              Expanded(child: _rankingDetail(isFirst: true, index: 0)),
              Expanded(child: _rankingDetail(isFirst: false, index: 2)),
          ],
        ),
      ),
    );
  }

  _rankingDetail({required bool isFirst, required int index}) {

    if (controller.directTopList.length <= index) return Container();

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
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: BaseNetworkImage(
                      imageURL: controller.directTopList.value[index].user?.avatar ?? '',
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
                'assets/images/income/rank_${index + 1}.png',
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
          controller.directTopList.value[index].user?.nickName ?? '',
          style: fontDMBold.copyWith(
              color: BaseColors.white, fontSize: isFirst ? 16 : 14),
        ),
        Text(
          controller.getLevelName(controller.directTopList.value[index].hashrate?.code) ?? '',
          style: fontDMBold.copyWith(
              color: BaseColors.weakTextColor, fontSize: 10),
        ),
        Text(
          '人数：${controller.directTopList.value[index].teamCount}人',
          style: fontDMBold.copyWith(
              color: BaseColors.weakTextColor, fontSize: 10),
        )
      ],
    );
  }
}
