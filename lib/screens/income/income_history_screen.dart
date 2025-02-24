import 'package:dgpt/screens/income/income_history_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:dgpt/widget/form/base_dropdown_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeHistoryScreen extends GetView<IncomeHistoryScreenController> {
  const IncomeHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('income.history'),
        color: BaseColors.white,
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: BaseColors.profileLinearGradient,
                      color: BaseColors.white.withOpacity(0.4)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        tr('income.data_overview'),
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
                            items: controller.historyList,
                            name: "all",
                            onChanged: (item) {
                              controller.currentPage = 1;
                              controller.flowList.value = [];
                              controller.selectedType = item?.value;
                              controller.refreshController.callRefresh();
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
                          ),
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
              tr('member.type'),
              style: fontDMBold.copyWith(
                color: BaseColors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Text(
              tr('income.amount'),
              style: fontDMBold.copyWith(
                color: BaseColors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(tr('income.time'),
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
              controller.getNameByType(controller.flowList[index].type),
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
                DateFormat("dd/MM/yyyy HH:mm").format(
                    DateFormat("yyyy-MM-dd HH:mm")
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
