import 'package:dgpt/screens/notice/notice_tab_controller.dart';
import 'package:dgpt/screens/notice/system_message_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeUpdateTab extends StatelessWidget {
  final Key? scrollViewKey;
  final Widget? injector;
  final String type;

  const NoticeUpdateTab(
      {super.key, required this.type, this.scrollViewKey, this.injector});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoticeTabController>(
      autoRemove: true,
      init: NoticeTabController(type: type),
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
                SliverPadding(
                  padding: const EdgeInsets.all(gap),
                  sliver: SliverList.separated(
                    itemCount: 10,
                    itemBuilder: (context, index) => _item(context),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
                const FooterLocator.sliver()
              ],
            );
          },
        ));
      },
    );
  }

  _item(context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.systemMessageDetail);
      },
      child: Container(
        color: BaseColors.black,
        padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                "assets/images/tab/profile_active.png",
                width: 60),
            const SizedBox(width: defaultPadding / 2,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Successfully purchased the package',
                    style: fontSFProMedium.copyWith(
                        color: BaseColors.white,
                        fontSize: 14
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2,),
                  Text(
                    '2025-01-19 20:36:49',
                    style: fontSFProMedium.copyWith(
                        color: BaseColors.white,
                        fontSize: 14
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2,),
                  Text(
                    'You have successfully purchased the Accelerator package',
                    style: fontSFProMedium.copyWith(
                        color: BaseColors.white,
                        fontSize: 14
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
