import 'package:dgpt/models/pulse/layer_hashrate_info.dart';
import 'package:dgpt/screens/income/active_member_detail_screen.dart';
import 'package:dgpt/screens/income/active_member_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_dropdown_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveMemberScreenArgs {
  final int layer;

  ActiveMemberScreenArgs({required this.layer});
}

class ActiveMemberScreen extends GetView<ActiveMemberScreenController> {
  const ActiveMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('hashrate.team_computing_power_bonus'),
        color: BaseColors.white,
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: BaseColors.profileLinearGradient,
                        color: BaseColors.white.withOpacity(0.4)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${tr('income.total_amount')}：${controller.memberList.length}',
                          style: fontDMBold.copyWith(
                            fontSize: 18,
                            color: BaseColors.white,
                          ),
                        ),
                        Expanded(child: Container()),
                        IntrinsicWidth(
                          child: SizedBox(
                            width: 100,
                            height: 25,
                            child: BaseDropDownFormField(
                              isExpanded: true,
                              menuMaxHeight: 250,
                              width: 170,
                              fillColor: BaseColors.primaryColor,
                              hintText: tr('income.all'),
                              items: controller.layerList,
                              name: "all",
                              onChanged: (item) {
                                controller.loadLayerItem(item?.value);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // Prevent scrolling inside GridView
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: defaultPadding,
                      mainAxisSpacing: defaultPadding,
                      childAspectRatio: 1,
                    ),
                    itemCount: controller.layerHashrateList.length,
                    // Number of items
                    itemBuilder: (context, index) {
                      return _level(index);
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.memberList.isNotEmpty
                        ? controller.memberList.length + 1
                        : 0,
                    itemBuilder: (_, index) {
                      return index == controller.memberList.length
                          ? _footer()
                          : _item(index);
                    },
                    separatorBuilder: (_, index) {
                      return index == controller.memberList.length - 1
                          ? Container()
                          : Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              height: 0.5,
                              color: BaseColors.weakTextColor,
                            );
                    },
                  )
                  // Expanded(
                  //   child: BaseSmartRefresher(
                  //     refreshController: controller.refreshController,
                  //     enableLoadMore: true,
                  //     uiState: controller.uiState.value,
                  //     isEmpty: controller.layerHashrateList.isEmpty,
                  //     onPullToRefresh: (loadingState) {
                  //       // controller.aiPulseFlowUserPage(
                  //       //     loadingState: loadingState);
                  //     },
                  //     onLoadMore: (loadingState) {
                  //       // controller.aiPulseFlowUserPage(
                  //       //     loadingState: loadingState);
                  //     },
                  //     childBuilder: (context, physics) {
                  //       return CustomScrollView(
                  //         physics: physics,
                  //         slivers: [
                  //           SliverList.separated(
                  //             itemCount: controller.layerHashrateList.isNotEmpty
                  //                 ? controller.layerHashrateList.length + 1
                  //                 : 0,
                  //             itemBuilder: (_, index) {
                  //               return index == controller.layerHashrateList.length
                  //                   ? _footer()
                  //                   : _item(index);
                  //             },
                  //             separatorBuilder: (_, index) {
                  //               return index == controller.layerHashrateList.length - 1
                  //                   ? Container()
                  //                   : Container(
                  //                 margin: const EdgeInsets.symmetric(
                  //                     horizontal: defaultPadding),
                  //                 height: 0.5,
                  //                 color: BaseColors.weakTextColor,
                  //               );
                  //             },
                  //           )
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          )),
    );
  }

  _level(index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: controller.memberColorList[index], width: 1)),
      child: Column(
        children: [
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                color: controller.memberColorList[index]),
            child: Center(
              child: Text(
                controller.layerHashrateList[index].hashrate?.name ?? '',
                style: fontDMBold.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.transparent),
              child: Center(
                child: Text(
                  (controller.layerHashrateList[index].count ?? 0).toString(),
                  style: fontDMBold.copyWith(
                    color: BaseColors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _item(index) {
    MemberList? member = controller.memberList[index];
    return Column(
      children: [
        if (index == 0)
          Container(
            height: 20,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: BaseColors.black10),
          ),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.activeMemberDetail,
                arguments: ActiveMemberDetailScreenArgs(memberList: member));
          },
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(color: BaseColors.black10),
            child: Row(
              children: [
                SizedBox(
                  height: 33,
                  width: 33,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: BaseNetworkImage(
                      imageURL: member.user?.avatar ?? '',
                      placeholder: 'assets/images/custom/logo.png',
                    ),
                  ),
                ),
                const SizedBox(
                  width: defaultPadding / 2,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: SizeUtil.width() / 4,
                            child: Text(
                                  member.user?.account ??
                                  member.user?.email ??
                                  '',
                              style: fontDMMedium.copyWith(
                                color: BaseColors.white,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding / 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: controller.memberColorList[
                                        ((member.powerInfo?.orderNo ?? 0) > 5
                                                ? 4
                                                : (member.powerInfo?.orderNo ??
                                                    0)) %
                                            5],
                                    width: 1)),
                            child: Text(
                              member.powerInfo?.name ?? '',
                              style: fontDMMedium.copyWith(
                                color: controller.memberColorList[
                                    ((member.powerInfo?.orderNo ?? 0) > 5
                                            ? 4
                                            : (member.powerInfo?.orderNo ??
                                                0)) %
                                        5],
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          if (member.planValid == true)
                            Text(
                              tr('income.valid'),
                              style: fontDMRegular.copyWith(
                                color: BaseColors.secondPrimaryColor,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.right,
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding / 2,
                      ),
                      Row(
                        children: [
                          Text(
                            '${tr('income.join_time')}： ${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(member.user?.createTime ?? ''))}',
                            style: fontDMMedium.copyWith(
                              color: BaseColors.weakTextColor,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Expanded(child: Container()),
                          Text(
                            '${tr('income.member')}：${member.teamUserCount ?? 0}',
                            style: fontDMMedium.copyWith(
                              color: BaseColors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _footer() {
    return Container(
      height: 20,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: BaseColors.black10),
    );
  }
}
