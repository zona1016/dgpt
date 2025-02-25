import 'dart:ui';

import 'package:dgpt/screens/profile/profile_screen_controller.dart';
import 'package:dgpt/screens/transaction/withdraw_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/string_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WithdrawScreen extends GetView<WithdrawScreenController> {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.withdraw_assets'),
        color: BaseColors.white,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              Text(
                tr('profile.wallet_address'),
                style: fontDMMedium.copyWith(
                  fontSize: 16,
                  color: BaseColors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xFF282F54).withOpacity(0.6)),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: TextField(
                          style: fontDMMedium.copyWith(
                              color: BaseColors.white, fontSize: 14),
                          onChanged: (value) {
                            controller.address.value = value ?? '';
                          },
                          controller:
                          controller.addressEditingController,
                          decoration: InputDecoration(
                              hintText: tr('placeholder.enter_wallet_address'),
                              hintStyle: fontDMMedium.copyWith(
                                  color: BaseColors.white,
                                  fontSize: 14),
                              contentPadding:
                              const EdgeInsets.only(bottom: 10),
                              border: InputBorder.none),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: defaultPadding / 5,
                    ),
                    Image.asset(
                      'assets/images/income/withdraw.png',
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xFF282F54).withOpacity(0.6)),
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
                    Expanded(
                      child: Text(
                        'USDT-TRC20',
                        style: fontDMMedium.copyWith(
                          fontSize: 16,
                          color: BaseColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: defaultPadding / 5,
                    ),
                    const Icon(
                      Icons.chevron_right,
                      size: 25,
                      color: BaseColors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              Text(
                tr('profile.amount'),
                style: fontDMMedium.copyWith(
                  fontSize: 16,
                  color: BaseColors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xFF282F54).withOpacity(0.6)),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: TextField(
                          controller: controller.textEditingController,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.amount.value =
                                  double.parse(value);
                            }
                          },
                          style: fontDMMedium.copyWith(
                              color: BaseColors.white, fontSize: 14),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d*$')),
                            // 仅允许输入数字和一个小数点
                          ],
                          decoration: InputDecoration(
                              hintText: tr('placeholder.please_enter_the_amount'),
                              hintStyle: fontDMMedium.copyWith(
                                  color: BaseColors.white,
                                  fontSize: 14),
                              contentPadding:
                              const EdgeInsets.only(bottom: 10),
                              border: InputBorder.none),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: defaultPadding / 2,
                    ),
                    InkWell(
                      onTap: () {
                        ProfileScreenController profileController = Get.find();
                        controller.amount = profileController.xjTotalAmount;
                        controller.textEditingController.text = profileController.xjTotalAmount.toString();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1,
                                color: BaseColors.primaryColor
                            ),
                            color: BaseColors.primaryColor.withOpacity(0.2)
                        ),
                        child: Text(
                          tr('income.max'),
                          style: fontDMMedium.copyWith(
                            fontSize: 12,
                            color: BaseColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: BaseColors.white,
                    ),
                    const SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Text(
                      'USDT',
                      style: fontDMMedium.copyWith(
                        fontSize: 16,
                        color: BaseColors.white,
                      ),
                    ),
                    const SizedBox(
                      width: defaultPadding / 5,
                    ),
                    const Icon(
                      Icons.chevron_right,
                      size: 25,
                      color: BaseColors.white,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    tr('income.available'),
                    style: fontDMMedium.copyWith(
                      fontSize: 16,
                      color: BaseColors.white,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '${formatNumber(controller.profileScreenController.xjTotalAmount.value)}USDT',
                    style: fontDMMedium.copyWith(
                      fontSize: 16,
                      color: BaseColors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
              if (controller.showGoogleAuth.value)
                GetBuilder<WithdrawScreenController>(
                  builder: (_) {
                    return BaseTextFormField(
                      controller: controller.googleEditingController,
                      contentPadding: EdgeInsets.zero,
                      radius: 10,
                      title: tr('profile.google_authenticator'),
                      name: 'auth',
                      style: fontDMMedium.copyWith(
                          color: BaseColors.white, fontSize: 14),
                      fillColor: const Color(0xFF282F54).withOpacity(0.6),
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: BaseColors.white.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(30)),
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          try {
                            ClipboardData? data =
                            await Clipboard.getData('text/plain');
                            controller.googleEditingController.text =
                                data?.text ?? '';
                            controller.googleAuth.value = data?.text ?? '';
                          } catch (e) {
                            controller.googleEditingController.text = '';
                            controller.googleAuth.value = '';
                          }
                          controller.update();
                        },
                        child: Container(
                          height: 26,
                          width: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFEFEFEF), // 起始颜色
                                Color(0xFFB8CDDB), // 结束颜色
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              tr('profile.paste'),
                              style: fontDMMedium.copyWith(
                                fontSize: 14,
                                color: BaseColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        controller.googleEditingController.text =
                            value ?? '';
                        controller.googleAuth.value = value ?? '';
                        controller.update();
                      },
                    );
                  },
                ),
              if (controller.showGoogleAuth.value)
                const SizedBox(height: defaultPadding),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: BaseButton(
                      type: BaseButtonType.secondary,
                      onPressed: () => Get.back(),
                      text: tr('button.cancel'),
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: Obx(() => BaseButton(
                        enabled: controller.address.isNotEmpty &&
                            controller.amount.value > 10 &&
                            (controller.showGoogleAuth.value
                                ? controller.googleAuth.isNotEmpty
                                : true),
                        onPressed: () => controller.withdraw(),
                        text: '${tr('button.confirm')} ${tr('profile.withdraw_assets')}',
                      )),
                    ),
                  )
                ],
              ),
              const SizedBox(height: defaultPadding),
              CustomPaint(
                painter: DottedBorderPainter(),
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFF315A5F),
                  padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        tr('tip.withdrawTip'),
                        style: fontDMMedium.copyWith(
                          fontSize: 16,
                          color: BaseColors.white,
                        ),
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DottedBorderPainter({
    this.color = BaseColors.primaryColor,
    this.strokeWidth = 2.0,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    Path dashPath = Path();
    double distance = 0.0;
    PathMetrics pathMetrics = path.computeMetrics();

    for (PathMetric pathMetric in pathMetrics) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

