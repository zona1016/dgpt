import 'package:dgpt/screens/income/income_history_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeHistoryScreen extends GetView<IncomeHistoryScreenController> {
  const IncomeHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: const BaseAppBar(
        title: '历史',
        color: BaseColors.white,
      ),
      body: Obx(() => Padding(
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
                        '数据预览',
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
                if (controller.flowList.isNotEmpty)
                  _header(),
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
                            itemCount: controller.flowList.isNotEmpty ? controller.flowList.length + 1 : 0,
                            itemBuilder: (_, index) {
                              return index == controller.flowList.length
                                      ? _footer()
                                      : _item(index);
                            },
                            separatorBuilder: (_, index) {
                              return index == 0
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

  _header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 44,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: BaseColors.black10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '类型',
              style: fontDMBold.copyWith(
                color: BaseColors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Text(
              '数据',
              style: fontDMBold.copyWith(
                color: BaseColors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text('时间',
                style: fontDMBold.copyWith(
                  color: BaseColors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.right),
          ),
        ],
      ),
    );
  }

  _item(index) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(color: BaseColors.black10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              controller.flowList[index].type.toString() ?? '',
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Text(
              '${controller.flowList[index].amount}USDT',
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
                DateFormat("dd/MM/yyyy").format(
                    DateFormat("yyyy-MM-dd HH:mm:ss")
                        .parse(controller.flowList[index].createTime ?? '')),
                style: fontDMMedium.copyWith(
                  color: BaseColors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.right),
          ),
        ],
      ),
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
