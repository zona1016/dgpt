import 'package:dgpt/screens/income/invitation_award_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/string_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitationAwardScreen extends GetView<InvitationAwardScreenController> {
  const InvitationAwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: BaseAppBar(
        title: tr('hashrate.invitation_bonus'),
        color: BaseColors.white,
      ),
      body: Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              _card(cardTaps: (index) {
                if (index == 0) {
                } else if (index == 1) {}
              }),
              const SizedBox(
                height: defaultPadding,
              ),
              if (controller.recommendInfoList.isNotEmpty)
                _header(),
              Obx(() => Expanded(
                child: BaseSmartRefresher(
                  refreshController: controller.refreshController,
                  enableLoadMore: true,
                  uiState: controller.uiState.value,
                  isEmpty: controller.recommendInfoList.isEmpty,
                  onPullToRefresh: (loadingState) {
                    controller.aiPulseTotalRecommendAwardTotal(
                        loadingState: loadingState);
                  },
                  onLoadMore: (loadingState) {
                    controller.aiPulseTotalRecommendAwardTotal(
                        loadingState: loadingState);
                  },
                  childBuilder: (context, physics) {
                    return CustomScrollView(
                      physics: physics,
                      slivers: [
                        SliverList.separated(
                          itemCount: controller.recommendInfoList.isNotEmpty
                              ? controller.recommendInfoList.length + 1
                              : 0,
                          itemBuilder: (_, index) {
                            return index ==
                                controller.recommendInfoList.length
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
              )),
            ],
          ))),
    );
  }

  _card({required Function(int index) cardTaps}) {
    return Obx(() => IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: _cardItem(
                callBack: () => cardTaps(0),
                title: controller.actionTitles[0],
                image: controller.actionImages[0],
                amount:
                (controller.recommendAwardTotalInfo.value?.amountTotal ?? 0)
                    .toDouble(),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF17CE92), // 起始颜色
                    Color(0xFF0C684A), // 结束颜色
                  ],
                )),
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          Expanded(
            child: _cardItem(
                callBack: () => cardTaps(1),
                title: controller.actionTitles[1],
                image: controller.actionImages[1],
                amount:
                (controller.recommendAwardTotalInfo.value?.memberCount ?? 0)
                    .toDouble(),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF6F00FF), // 起始颜色
                    Color(0xFF430099), // 结束颜色
                  ],
                )),
          ),
        ],
      ),
    ));
  }

  _cardItem(
      {required String title,
      required String image,
      required double amount,
      required LinearGradient gradient,
      GestureTapCallback? callBack}) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding / 2),
          gradient: gradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              height: defaultPadding / 5,
            ),
            Text(
              title,
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 12,
              ),
            ),
            Text(
              formatNumber(amount),
              style: fontDMBold.copyWith(
                color: BaseColors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
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
              tr('income.account'),
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
            child: Text(tr('income.date'),
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

  _item(index) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(color: BaseColors.black10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              controller.recommendInfoList[index].account ?? '',
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Text(
              '${controller.recommendInfoList[index].planAmount}U',
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${controller.recommendInfoList[index].awardAmount}U',
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
                DateFormat("dd/MM/yyyy HH:mm:ss").format(
                    DateFormat("yyyy-MM-dd HH:mm:ss").parse(
                        controller.recommendInfoList[index].createTime ?? '')),
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
}
