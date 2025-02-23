import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/screens/income/hashrate_leasing_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HashrateLeasingScreenArgs {
  final PlanDetail? hasratePageInfo;

  HashrateLeasingScreenArgs({required this.hasratePageInfo});
}

class HashrateLeasingScreen
    extends GetView<HashrateLeasingScreenController> {
  const HashrateLeasingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: BaseAppBar(
        title: tr('hashrate.product_details'),
        color: BaseColors.white,
      ),
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultPadding),
                    border: Border.all(color: BaseColors.primaryColor, width: 1),
                    color: Colors.transparent
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    _buildHardwareInfo(),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Image.asset(
          'assets/images/home/income_icon_${controller.planDetail.value?.name}.png',
          width: 120,
          height: 128,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: defaultPadding / 2,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    controller.planDetail.value?.name ?? '',
                    style: fontDMBold.copyWith(
                      color: BaseColors.white,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: defaultPadding / 4,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultPadding),
                        border: Border.all(
                            color: BaseColors.secondPrimaryColor, width: 1),
                        color: BaseColors.secondPrimaryColor.withOpacity(0.1)),
                    child: Text(
                      controller.planDetail.value?.pcieName ?? '',
                      style: fontDMBold.copyWith(
                        color: BaseColors.secondPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                controller.planDetail.value?.name ?? '',
                style: fontDMMedium.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                '${controller.planDetail.value?.upSpeed ?? ''} Mbps',
                style: fontDMRegular.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                '${controller.planDetail.value?.downSpeed ?? ''} Mbps ${controller.planDetail.value?.ports ?? ''} ports',
                style: fontDMRegular.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
              ),
              Container(
                height: 1,
                color: BaseColors.weakTextColor,
              ),
              Row(
                children: [
                  Text(
                    '${controller.planDetail.value?.ops ?? ''} FLOPS\n${controller.planDetail.value?.ram ?? ''} GB',
                    style: fontDMRegular.copyWith(
                      color: BaseColors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: defaultPadding / 5,
                  ),
                  Text(
                    'Max CUDA : ${controller.planDetail.value?.maxCuda ?? ''}\n${controller.planDetail.value?.speed ?? ''} GB/s',
                    style: fontDMRegular.copyWith(
                      color: BaseColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildHardwareInfo() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('hashrate.in_progress'),
          style: fontDMMedium.copyWith(
            color: BaseColors.white,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: defaultPadding / 4,
        ),
        Container(
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: BaseColors.whiteGray3.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                width: (SizeUtil.width() - defaultPadding * 4) * .2,
                duration: const Duration(milliseconds: 300),
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
                    stops: [0.0, 0.02, 0.37, 0.66, 0.88, 1.0], // 颜色停止点
                    begin: Alignment.centerLeft, // 渐变起点
                    end: Alignment.centerRight, // 渐变终点
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFFFFFFF).withOpacity(0.4), // 0% 的颜色
                const Color(0xFFD8E4F1).withOpacity(0.4), // 6% 的颜色
                const Color(0xFFB6CEE5).withOpacity(0.4), // 13% 的颜色
                const Color(0xFF9DBDDC).withOpacity(0.4), // 19% 的颜色
                const Color(0xFF8FB3D7).withOpacity(0.4), // 25% 的颜色
                const Color(0xFF8AB0D6).withOpacity(0.4), // 29% 的颜色
                const Color(0xFF5E6EA9).withOpacity(0.4), // 65% 的颜色
                const Color(0xFF8E6CA3).withOpacity(0.4), // 80% 的颜色
                const Color(0xFFD16B9B).withOpacity(0.4), // 99% 的颜色
              ],
              stops: const [
                0.0,
                0.06,
                0.13,
                0.19,
                0.25,
                0.29,
                0.65,
                0.80,
                0.99
              ],
              // 颜色停止点
              begin: Alignment.centerLeft,
              // 渐变起点
              end: Alignment.centerRight, // 渐变终点
            ),
            borderRadius: BorderRadius.circular(10), // 圆角
          ),
          child: Row(
            children: [
              BaseNetworkImage(
                imageURL: controller.planDetail.value?.graphicsIconFileIdUrl ?? '',
                placeholder: 'assets/images/home/income_detail_icon.png',
                height: 46,
                width: 100,
              ),
              const SizedBox(
                width: defaultPadding / 2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.planDetail.value?.graphicsName ?? '',
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${controller.planDetail.value?.graphicsCpu ?? ''}cpu    ${controller.planDetail.value?.graphicsRam ?? ''} GB',
                      style: fontDMRegular.copyWith(
                        color: BaseColors.white,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFFFFFFF).withOpacity(0.4), // 0% 的颜色
                const Color(0xFFD8E4F1).withOpacity(0.4), // 6% 的颜色
                const Color(0xFFB6CEE5).withOpacity(0.4), // 13% 的颜色
                const Color(0xFF9DBDDC).withOpacity(0.4), // 19% 的颜色
                const Color(0xFF8FB3D7).withOpacity(0.4), // 25% 的颜色
                const Color(0xFF8AB0D6).withOpacity(0.4), // 29% 的颜色
                const Color(0xFF5E6EA9).withOpacity(0.4), // 65% 的颜色
                const Color(0xFF8E6CA3).withOpacity(0.4), // 80% 的颜色
                const Color(0xFFD16B9B).withOpacity(0.4), // 99% 的颜色
              ],
              stops: const [
                0.0,
                0.06,
                0.13,
                0.19,
                0.25,
                0.29,
                0.65,
                0.80,
                0.99
              ],
              // 颜色停止点
              begin: Alignment.centerLeft,
              // 渐变起点
              end: Alignment.centerRight, // 渐变终点
            ),
            borderRadius: BorderRadius.circular(10), // 圆角
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.planDetail.value?.virtualName ?? '',
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      controller.planDetail.value?.virtualDesc ?? '',
                      style: fontDMRegular.copyWith(
                        color: BaseColors.white,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 46,
                color: BaseColors.white,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.planDetail.value?.servicesName ?? '',
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      controller.planDetail.value?.servicesDesc ?? '',
                      style: fontDMRegular.copyWith(
                        color: BaseColors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF05CCFF), // 0%
                Color(0xFF04A2FF), // 43%
                Color(0xFF0486FF), // 79%
                Color(0xFF047CFF), // 100%
              ],
              stops: [0.0, 0.43, 0.79, 1.0], // 对应的百分比
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                tr('hashrate.price_per_unit'),
                style: fontDMRegular.copyWith(
                    color: BaseColors.white, fontSize: 12),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/images/home/income_qb.png',
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(
                    width: defaultPadding / 2,
                  ),
                  Text(
                    '${controller.args!.hasratePageInfo?.amount ?? 0} U',
                    style: fontDMBold.copyWith(
                        color: BaseColors.white, fontSize: 20),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            Expanded(
              child: Text(
                'Quantity',
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 12),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (controller.total.value > 0) {
                  controller.total.value = controller.total.value - 1;
                }
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/home/income_add_bg.png'))),
                child: Center(
                  child: Image.asset(
                    'assets/images/home/income_minus.png',
                    width: 12,
                    height: 2,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2),
              child: Text(
                controller.total.toString(),
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 14),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (controller.total.value <
                    (controller
                        .args!.hasratePageInfo?.purchaseLimitQuantity ??
                        0)) {
                  controller.total.value = controller.total.value + 1;
                }
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/home/income_add_bg.png'))),
                child: Center(
                  child: Image.asset(
                    'assets/images/home/income_add.png',
                    width: 12,
                    height: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding / 2),
        Row(
          children: [
            Expanded(
              child: Text(
                'Total : U ${(controller.args!.hasratePageInfo?.amount ?? 0) * controller.total.value}',
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 12),
              ),
            ),
            SizedBox(
              width: 100,
              height: 35,
              child: BaseButton(
                enabled: controller.total.value > 0,
                onPressed: () {
                  controller.userHasTradingPwd();
                },
                text: tr('hashrate.rental'),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
