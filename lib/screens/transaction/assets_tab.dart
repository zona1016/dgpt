import 'package:dgpt/screens/transaction/assets_tab_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetsTab extends StatelessWidget {
  final Key? scrollViewKey;
  final Widget? injector;
  final String type;

  const AssetsTab(
      {super.key,
        required this.type,
        this.scrollViewKey,
        this.injector});

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
          isEmpty: true,
          emptyHeaderSlivers: [
            injector ?? const SliverToBoxAdapter(),
            const HeaderLocator.sliver(clearExtent: false),
          ],
          onPullToRefresh: (loadingState) {
            controller.getTutorials(loadingState: loadingState);
          },
          onLoadMore: (loadingState) {
            controller.getTutorials(loadingState: loadingState);
          },
          childBuilder: (context, physics) {
            return CustomScrollView(
              physics: physics,
              slivers: [
                injector ?? const SliverToBoxAdapter(),
                const HeaderLocator.sliver(clearExtent: false),
                SliverList.separated(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultPadding / 2 * 3),
                        color: const Color(0xFF292250),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
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
                                color: BaseColors.white,
                                fontSize: 12),
                          ),
                          Expanded(child: Container()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '+0.010',
                                style: fontDMMedium.copyWith(
                                    color: BaseColors.white,
                                    fontSize: 8),
                              ),
                              Text(
                                '2024-01-31 19:07:51',
                                style: fontDMMedium.copyWith(
                                    color: BaseColors.white,
                                    fontSize: 8),
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
