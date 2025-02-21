import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_buy_detail_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HashrateRentalBuyDetailScreenArgs {
  final PlanDetail? planDetail;

  HashrateRentalBuyDetailScreenArgs({required this.planDetail});
}

class HashrateRentalBuyDetailScreen
    extends GetView<HashrateRentalBuyDetailScreenController> {
  const HashrateRentalBuyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.white.withOpacity(0.1),
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: BaseAppBar(
        title: tr('hashrate.computing_power_rental'),
        color: BaseColors.white,
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: SingleChildScrollView(
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
            ),
          )),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Image.asset(
          'assets/images/home/income_icon.png',
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
                  Expanded(
                    child: Text(
                      controller.planDetail.value?.name ?? '',
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 15,
                      ),
                    ),
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
                      'HIGH SPEED',
                      style: fontDMBold.copyWith(
                        color: BaseColors.secondPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: defaultPadding / 5,
              ),
              Text(
                controller.planDetail.value?.pcieName ?? '',
                style: fontDMMedium.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/hashrate/upload.png',
                    height: 10,
                    width: 10,
                  ),
                  const SizedBox(
                    width: defaultPadding / 5,
                  ),
                  Text(
                    '${controller.planDetail.value?.upSpeed ?? ''} Mbps',
                    style: fontDMRegular.copyWith(
                      color: BaseColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/hashrate/download.png',
                    height: 10,
                    width: 10,
                  ),
                  Text(
                    '${controller.planDetail.value?.downSpeed ?? ''} Mbps ${controller.planDetail.value?.ports ?? ''} ports',
                    style: fontDMRegular.copyWith(
                      color: BaseColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
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
    TextStyle whiteText10 =
        fontDMRegular.copyWith(color: BaseColors.white, fontSize: 12);
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
                    width: (SizeUtil.width() - defaultPadding * 2) *
                        (controller.continueDay.value /
                            (controller.planDetail.value?.cycle ?? 1)),
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
                    imageURL:
                    controller.planDetail.value?.graphicsIconFileIdUrl ??
                        '',
                    placeholder: controller.planDetail.value?.code == 'B0001'
                        ? 'assets/images/home/income_detail_icon.png'
                        : 'assets/images/home/income_detail_icon1.png',
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
              width: double.infinity,
              decoration: BoxDecoration(
                  color: BaseColors.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: BaseColors.primaryColor, width: 1)),
              child: Column(
                children: [
                  Text(
                    tr('home.total_income'),
                    style: fontDMRegular.copyWith(
                        color: BaseColors.white, fontSize: 12),
                  ),
                  const SizedBox(
                    height: defaultPadding / 4,
                  ),
                  Text(
                    '${controller.planDetail.value?.roiTotal ?? 0} U',
                    style: fontDMBold.copyWith(
                        color: BaseColors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            _buildRow(
                tr('hashrate.contract_details'),
                '${controller.continueDay.value}days'
                '/${controller.planDetail.value?.cycle}days',
                whiteText10,
                whiteText10),
            _buildRow(
                tr('hashrate.rental_funds'),
                '${controller.planDetail.value?.amount} U',
                whiteText10,
                whiteText10),
            _buildRow(
                tr('hashrate.rental_income'),
                '${controller.planDetail.value?.roiTotal} U'
                '/U${controller.planDetail.value?.amount}',
                whiteText10,
                whiteText10),
            const SizedBox(height: defaultPadding / 2),
          ],
        ));
  }

  Widget _buildRow(String leftText, String rightText, TextStyle leftStyle,
      TextStyle rightStyle) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(leftText, style: leftStyle, textAlign: TextAlign.left),
        ),
        Expanded(
          flex: 1,
          child: Text(
            rightText,
            style: rightStyle,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
