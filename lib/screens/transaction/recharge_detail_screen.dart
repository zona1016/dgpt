import 'dart:ui';

import 'package:dgpt/screens/transaction/recharge_detail_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RechargeDetailScreen extends GetView<RechargeDetailScreenController> {
  const RechargeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.deposit'),
        color: BaseColors.white,
        backgroundColor: Colors.black,
      ),
      body: Obx(() => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: defaultPadding,
                ),
                Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/transaction/code_bg.png'),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: QrImageView(
                        data: controller.url.value, // 要编码的字符串数据
                        version: QrVersions.auto,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/transaction/qblx.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Text(
                        tr('profile.wallet_address'),
                        style: fontDMMedium.copyWith(
                          fontSize: 16,
                          color: BaseColors.white,
                        ),
                      ),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        child: Text(
                          controller.url.value,
                          style: fontDMMedium.copyWith(
                            fontSize: 16,
                            color: BaseColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/transaction/qblx.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Text(
                        tr('profile.wallet_type'),
                        style: fontDMMedium.copyWith(
                          fontSize: 16,
                          color: BaseColors.white,
                        ),
                      ),
                      const SizedBox(
                        width: defaultPadding,
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5),
                  child: BaseButton(
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: controller.url.value));
                      ToastUtils.showToast(title: tr('tip.copy_success'));
                    },
                    text: '${tr('button.copy_address')}  ',
                    icon: Image.asset(
                      'assets/images/home/share_copy.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: CustomPaint(
                    painter: DottedBorderPainter(),
                    child: Container(
                      width: double.infinity,
                      color: const Color(0xFFFF5449).withOpacity(0.2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/transaction/tip.png',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: defaultPadding,
                              ),
                              Expanded(
                                child: Text(
                                  tr('tip.recharge_tip'),
                                  style: fontDMMedium.copyWith(
                                    fontSize: 16,
                                    color: BaseColors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DottedBorderPainter({
    this.color = Colors.red,
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
