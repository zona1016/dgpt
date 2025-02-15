import 'package:dgpt/screens/income/active_member_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveMemberScreen extends GetView<ActiveMemberScreenController> {
  const ActiveMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: const BaseAppBar(
        title: '团队算力奖',
        color: BaseColors.white,
      ),
      body: Obx(() =>
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: BaseColors.profileLinearGradient,
                      color: BaseColors.white.withOpacity(0.4)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '总数额',
                        style: fontDMBold.copyWith(
                          fontSize: 18,
                          color: BaseColors.white,
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2,
                              vertical: defaultPadding / 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: BaseColors.primaryColor,
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  '全部',
                                  style: fontDMBold.copyWith(
                                    fontSize: 12,
                                    color: BaseColors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: defaultPadding / 5,
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: BaseColors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Row(
                  children: [
                    Expanded(child: _level(0)),
                    const SizedBox(width: defaultPadding,),
                    Expanded(child: _level(1)),
                    const SizedBox(width: defaultPadding,),
                    Expanded(child: _level(2)),
                  ],
                ),
                const SizedBox(height: defaultPadding,),
                Row(
                  children: [
                    Expanded(child: _level(3)),
                    const SizedBox(width: defaultPadding,),
                    Expanded(child: _level(4)),
                    const SizedBox(width: defaultPadding,),
                    Expanded(child: _level(5)),
                  ],
                ),
                const SizedBox(height: defaultPadding,),
                Expanded(
                  child: BaseSmartRefresher(
                    refreshController: controller.refreshController,
                    enableLoadMore: true,
                    uiState: controller.uiState.value,
                    isEmpty: controller.flowList.isEmpty,
                    onPullToRefresh: (loadingState) {
                      controller.aiPulseFlowUserPage(
                          loadingState: loadingState);
                    },
                    onLoadMore: (loadingState) {
                      controller.aiPulseFlowUserPage(
                          loadingState: loadingState);
                    },
                    childBuilder: (context, physics) {
                      return CustomScrollView(
                        physics: physics,
                        slivers: [
                          SliverList.separated(
                            itemCount: controller.flowList.isNotEmpty
                                ? controller.flowList.length + 1
                                : 0,
                            itemBuilder: (_, index) {
                              return index == controller.flowList.length
                                  ? _footer()
                                  : _item(index);
                            },
                            separatorBuilder: (_, index) {
                              return index == controller.flowList.length - 1
                                  ? Container()
                                  : Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding),
                                height: 0.5,
                                color: BaseColors.weakTextColor,
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }

  _level(index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: controller.memberColorList[index],
          width: 1
        )
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              color: controller.memberColorList[index]
            ),
            child: Center(
              child: Text(
                controller.memberList[index],
                style: fontDMBold.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                color: Colors.transparent
            ),
            child: Center(
              child: Text(
                '0',
                style: fontDMBold.copyWith(
                  color: BaseColors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  _item(index) {
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
              color: BaseColors.black10
            ),
          ),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.activeMemberDetail);
          },
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(color: BaseColors.black10),
            child: Row(
              children: [
                const SizedBox(
                  height: 33,
                  width: 33,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: BaseNetworkImage(
                      imageURL: '',
                      placeholder: 'assets/images/custom/logo.png',
                    ),
                  ),
                ),
                const SizedBox(width: defaultPadding / 2,),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sam',
                            style: fontDMMedium.copyWith(
                              color: BaseColors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: controller.memberColorList[index % 5],
                                    width: 1
                                )
                            ),
                            child: Text(
                              '基础算力',
                              style: fontDMMedium.copyWith(
                                color: controller.memberColorList[index % 5],
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Valid',
                            style: fontDMRegular.copyWith(
                              color: BaseColors.secondPrimaryColor,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding / 2,),
                      Row(
                        children: [
                          Text(
                            '加入： ${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())}',
                            style: fontDMMedium.copyWith(
                              color: BaseColors.weakTextColor,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Expanded(child: Container()),
                          Text(
                            'Member：12',
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
