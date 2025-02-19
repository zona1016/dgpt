import 'package:dgpt/models/pulse/layer_info.dart';
import 'package:dgpt/screens/income/activated_users_screen_controller.dart';
import 'package:dgpt/screens/income/active_member_detail_screen.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivatedUsersScreen extends GetView<ActivatedUsersScreenController> {
  const ActivatedUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: BaseAppBar(
        title: '激活人数',
        color: BaseColors.white,
      ),
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: ListView.separated(
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
        ),
      )),
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
