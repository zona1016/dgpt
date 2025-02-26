import 'package:dgpt/screens/transaction/assets_tab_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetsTab extends StatelessWidget {
  final Key? scrollViewKey;
  final Widget? injector;
  final String type;

  const AssetsTab(
      {super.key, required this.type, this.scrollViewKey, this.injector});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetsTabController>(
      autoRemove: true,
      init: AssetsTabController(type: type),
      tag: shortHash(UniqueKey()),
      builder: (controller) {
        return Obx(() => BaseSmartRefresher(
              isCustomFooterPosition: true,
              isCustomHeaderPosition: true,
              refreshController: controller.refreshController,
              enableLoadMore: true,
              uiState: controller.uiState.value,
              isEmpty: controller.flowList.isEmpty,
              emptyHeaderSlivers: [
                injector ?? const SliverToBoxAdapter(),
                const HeaderLocator.sliver(clearExtent: false),
              ],
              onPullToRefresh: (loadingState) {
                controller.aiPulseFlowUserPage(loadingState: loadingState);
              },
              onLoadMore: (loadingState) {
                controller.aiPulseFlowUserPage(loadingState: loadingState);
              },
              childBuilder: (context, physics) {
                return CustomScrollView(
                  physics: physics,
                  slivers: [
                    injector ?? const SliverToBoxAdapter(),
                    const HeaderLocator.sliver(clearExtent: false),
                    SliverList.separated(
                      itemCount: controller.flowList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding / 2),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 2 * 3),
                            color: const Color(0xFF292250),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/home/recharge_icon.png',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: defaultPadding / 2,
                              ),
                              Text(
                                'USDT-TRC20',
                                style: fontDMRegular.copyWith(
                                    color: BaseColors.white, fontSize: 12),
                              ),
                              Expanded(child: Container()),
                              Text(
                                controller.flowList[index].status == 1
                                    ? tr('member.approved')
                                    : controller.flowList[index].status == 2
                                        ? tr('member.rejected')
                                        : tr('member.pending_review'),
                                style: fontDMRegular.copyWith(
                                    color: controller.flowList[index].status ==
                                            1
                                        ? BaseColors.primaryColor
                                        : controller.flowList[index].status == 2
                                            ? Colors.red
                                            : BaseColors.white,
                                    fontSize: 12),
                              ),
                              Expanded(child: Container()),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${controller.flowList[index].amount} USDT',
                                    style: fontDMMedium.copyWith(
                                        color: (controller.flowList[index]
                                                        .amount ??
                                                    0) >
                                                0
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 8),
                                  ),
                                  Text(
                                    controller.flowList[index].createTime ?? '',
                                    style: fontDMMedium.copyWith(
                                        color: BaseColors.white, fontSize: 8),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 10,
                          color: Colors.transparent,
                        );
                      },
                    ),
                    const FooterLocator.sliver()
                  ],
                );
              },
            ));
      },
    );
  }
}
