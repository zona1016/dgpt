import 'package:dgpt/screens/notice/notice_tab_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:dgpt/widget/default_empty_view.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeTab extends StatelessWidget {
  final Key? scrollViewKey;
  final Widget? injector;
  final int type;
  final String imagePath;

  const NoticeTab(
      {super.key,
      required this.type,
      this.scrollViewKey,
      this.injector,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoticeTabController>(
      autoRemove: true,
      init: NoticeTabController(type: type),
      tag: shortHash(UniqueKey()),
      builder: (controller) {
        return controller.noticeInfoList.isNotEmpty
            ? Obx(() => ListView.separated(
                  itemCount: controller.noticeInfoList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2),
                      decoration: const BoxDecoration(
                        color: BaseColors.black,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            imagePath,
                            width: 44,
                            height: 44,
                          ),
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        controller
                                                .noticeInfoList[index].title ??
                                            '',
                                        style: fontSFProMedium.copyWith(
                                            color: BaseColors.white,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      '5小时',
                                      style: fontSFProMedium.copyWith(
                                          color: BaseColors.white,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Expanded(
                                  child: Text(
                                      controller.noticeInfoList[index].title ??
                                          '',
                                      style: fontSFProMedium.copyWith(
                                          color: BaseColors.white,
                                          fontSize: 14),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      color: BaseColors.weakTextColor,
                    );
                  },
                ))
            : const DefaultEmptyView();
      },
    );
  }

  _baseSmartRefresher(controller) {
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
          onPullToRefresh: (loadingState) {},
          onLoadMore: (loadingState) {},
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
                      height: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2),
                      decoration: const BoxDecoration(
                        color: BaseColors.black,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            imagePath,
                            width: 44,
                            height: 44,
                          ),
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Successfully purchased the package',
                                      style: fontSFProMedium.copyWith(
                                          color: BaseColors.white,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      '5小时',
                                      style: fontSFProMedium.copyWith(
                                          color: BaseColors.white,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Expanded(
                                  child: Text('这是一个内容' * 1,
                                      style: fontSFProMedium.copyWith(
                                          color: BaseColors.white,
                                          fontSize: 14),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      color: BaseColors.weakTextColor,
                    );
                  },
                ),
                const FooterLocator.sliver()
              ],
            );
          },
        ));
  }
}
