import 'package:dgpt/screens/income/hashrate_rental_detail_screen.dart';
import 'package:dgpt/screens/income/hashrate_rental_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HashrateRentalScreen extends GetView<HashrateRentalScreenController> {
  const HashrateRentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: const BaseAppBar(
        title: '算力租借',
        color: BaseColors.white,
      ),
      body: Obx(() => Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: BaseSmartRefresher(
              refreshController: controller.refreshController,
              enableLoadMore: true,
              uiState: controller.uiState.value,
              isEmpty: controller.hasratePageList.isEmpty,
              onPullToRefresh: (loadingState) {
                controller.hashratePage(loadingState: loadingState);
              },
              onLoadMore: (loadingState) {
                controller.hashratePage(loadingState: loadingState);
              },
              childBuilder: (context, physics) {
                return CustomScrollView(
                  physics: physics,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                              gradient: BaseColors.incomeLinearGradient,
                              borderRadius: BorderRadius.circular(10), // 圆角
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '算力等级',
                                      style: fontDMBold.copyWith(
                                        color: BaseColors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: defaultPadding / 5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              defaultPadding),
                                          border: Border.all(
                                              color:
                                                  BaseColors.secondPrimaryColor,
                                              width: 1),
                                          color: BaseColors.secondPrimaryColor
                                              .withOpacity(0.1)),
                                      child: Text(
                                        '进行中',
                                        style: fontDMRegular.copyWith(
                                          color: BaseColors.secondPrimaryColor,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/home/income_power_level.png'))),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      Text(
                                        '3',
                                        style: fontDMBold.copyWith(
                                          color: BaseColors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/home/income_power_icon.png',
                                        width: 13,
                                        height: 13,
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '进行中',
                                      style: fontDMMedium.copyWith(
                                        color: BaseColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.income);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: defaultPadding / 2),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                defaultPadding),
                                            color:
                                                BaseColors.secondPrimaryColor),
                                        child: Text(
                                          '分析',
                                          style: fontDMBold.copyWith(
                                            color: BaseColors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: defaultPadding / 4,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color:
                                        BaseColors.whiteGray3.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Stack(
                                    children: [
                                      AnimatedContainer(
                                        width: (Get.size.width -
                                                defaultPadding * 4) *
                                            .2,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF05CCFF), // 0% 的颜色
                                              Color(0xFF08C8FF), // 2% 的颜色
                                              Color(0xFF4F7FFF), // 37% 的颜色
                                              Color(0xFF834AFF), // 66% 的颜色
                                              Color(0xFFA32AFF), // 88% 的颜色
                                              Color(0xFFB01EFF), // 100% 的颜色
                                            ],
                                            stops: [
                                              0.0,
                                              0.02,
                                              0.37,
                                              0.66,
                                              0.88,
                                              1.0
                                            ], // 颜色停止点
                                            begin: Alignment.centerLeft, // 渐变起点
                                            end: Alignment.centerRight, // 渐变终点
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '帮助3位好友成为等级3',
                                      style: fontDMMedium.copyWith(
                                        color: BaseColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Text(
                                      '0/3',
                                      style: fontDMMedium.copyWith(
                                        color: BaseColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '团队人数',
                                      style: fontDMMedium.copyWith(
                                        color: BaseColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Text(
                                      '0/65',
                                      style: fontDMMedium.copyWith(
                                        color: BaseColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          Text(
                            '产品详情',
                            style: fontDMBold.copyWith(
                              color: BaseColors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                        ],
                      ),
                    ),
                    SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: defaultPadding,
                        mainAxisSpacing: defaultPadding,
                        childAspectRatio: 0.45,
                      ),
                      itemCount: controller.hasratePageList.length,
                      // Number of items
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.hashrateRentalDetail,
                                arguments: HashrateRentalDetailScreenArgs(
                                    hasratePageInfo: controller.hasratePageList[index]));
                          },
                          child: _rentalItem(),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          )),
    );
  }

  _rentalItem() {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          gradient: BaseColors.incomeLinearGradient,
          borderRadius: BorderRadius.circular(defaultPadding / 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'GDEPIN30',
            style: fontDMBold.copyWith(
              color: BaseColors.white,
              fontSize: 18,
            ),
          ),
          Text(
            'RTX4090',
            style: fontDMMedium.copyWith(
              color: BaseColors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Center(
            child: Image.asset(
              'assets/images/home/income_icon.png',
              width: 100,
              height: 106,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Text(
            '租借以获得',
            style: fontDMMedium.copyWith(
              color: BaseColors.white,
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              Text(
                '\$0.43',
                style: fontDMBold.copyWith(
                  color: BaseColors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                '/Per Hrs',
                style: fontDMRegular.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(defaultPadding / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding),
                image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/home/income_power_btn_bg.png'))),
            child: Center(
              child: Text(
                '租借',
                style: fontDMBold.copyWith(
                  color: BaseColors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '合约详情',
                  style: fontDMRegular.copyWith(
                    color: BaseColors.white,
                    fontSize: 10,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '60days',
                  style: fontDMRegular.copyWith(
                    color: BaseColors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '租借资金',
                  style: fontDMRegular.copyWith(
                    color: BaseColors.white,
                    fontSize: 10,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '\$300',
                  style: fontDMRegular.copyWith(
                    color: BaseColors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '租借收益',
                  style: fontDMRegular.copyWith(
                    color: BaseColors.white,
                    fontSize: 10,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '\$630(110%)',
                  style: fontDMRegular.copyWith(
                    color: BaseColors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '日收益',
                  style: fontDMRegular.copyWith(
                    color: BaseColors.white,
                    fontSize: 10,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '\$10.50',
                  style: fontDMRegular.copyWith(
                    color: BaseColors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
