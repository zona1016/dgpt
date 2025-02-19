import 'dart:math';

import 'package:dgpt/screens/income/income_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeScreen extends GetView<IncomeScreenController> {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      safeAreaTop: false,
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top + 44,
            width: double.infinity,
            decoration:
                BoxDecoration(gradient: BaseColors.appBarLinearGradient),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                child: Text(
                  tr('hashrate.income_analysis'),
                  style:
                      fontBold.copyWith(fontSize: 20, color: BaseColors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(() => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: defaultPadding),
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            color: BaseColors.primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(defaultPadding),
                          ),
                          child: Center(
                            child: Text(
                              '${tr('home.total_income')} ${controller.totalAmount.value} U',
                              style: fontDMBold.copyWith(
                                  color: BaseColors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        _progress(),
                        Wrap(
                          spacing: defaultPadding, // 设置主轴间距
                          runSpacing: 8.0, // 设置交叉轴间距
                          children: [
                            _circularDetail(
                              title: tr('hashrate.computing_power_rental'),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF6B4EC4), // 0%
                                  Color(0xFF33255E), // 6%
                                ],
                              ),
                            ),
                            _circularDetail(
                              title: tr('hashrate.invitation_bonus'),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFC5679E), // 0%
                                  Color(0xFF5F324C), // 6%
                                ],
                              ),
                            ),
                            _circularDetail(
                              title: tr('hashrate.salary'),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF4BADAF), // 0%
                                  Color(0xFF1F4849), // 6%
                                ],
                              ),
                            ),
                            _circularDetail(
                              title: tr('hashrate.team_computing_power_bonus'),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF4062B2), // 0%
                                  Color(0xFF192A8A), // 6%
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: defaultPadding,
                        ),
                        _makeProfitAndNodePartner(context, onTap: (index) {
                          if (index == 0) {
                            // Get.toNamed(AppRoutes.analyze);
                          } else {
                            Get.toNamed(AppRoutes.activatedUsers);
                          }
                        }),
                        const SizedBox(height: defaultPadding),
                        Row(
                          children: [
                            Text(
                              tr('hashrate.income_details'),
                              style: fontDMBold.copyWith(
                                  color: BaseColors.white, fontSize: 18),
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.incomeHistory);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding / 2,
                                    vertical: defaultPadding / 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: BaseColors.primaryColor,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text(
                                        tr('income.detail'),
                                        style: fontSFProMedium.copyWith(
                                          fontSize: 12,
                                          color: BaseColors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: defaultPadding / 5,
                                      ),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: BaseColors.white,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: defaultPadding,
                          mainAxisSpacing: defaultPadding,
                          childAspectRatio: 1.5,
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _buildIncomeCard(
                                tr('hashrate.computing_power_rental'),
                                controller.amountTotalInfo.value
                                        ?.roiAmountTotal ??
                                    0,
                                'assets/images/income/income_slzj.png',
                                onTap: () {
                              Get.toNamed(AppRoutes.hashrateRentalActive);
                            }),
                            _buildIncomeCard(
                                tr('hashrate.team_computing_power_bonus'),
                                controller.amountTotalInfo.value
                                        ?.teamAwardAmountTotal ??
                                    0,
                                'assets/images/income/income_tdslj.png',
                                onTap: () {
                              Get.toNamed(AppRoutes.teamHashrateAwardn);
                            }),
                            _buildIncomeCard(
                                tr('hashrate.invitation_bonus'),
                                controller.amountTotalInfo.value
                                        ?.directAwardAmountTotal ??
                                    0,
                                'assets/images/income/income_yqj.png',
                                onTap: () {
                              Get.toNamed(AppRoutes.invitationAward);
                            }),
                            _buildIncomeCard(
                                tr('hashrate.salary'),
                                controller.amountTotalInfo.value
                                        ?.salaryAmountTotal ??
                                    0,
                                'assets/images/income/income_xz.png',
                                onTap: () {
                              Get.toNamed(AppRoutes.salary);
                            }),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeCard(String title, double amount, String image,
      {GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
            image: const DecorationImage(
              image: AssetImage('assets/images/home/return_bg.png'),
              fit: BoxFit.cover,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Row(
              children: [
                Image.asset(
                  image,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(
                  width: defaultPadding / 2,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: fontDMMedium.copyWith(
                        color: BaseColors.weakTextColor, fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Text(
              '${NumberFormat('#,##0.00').format(amount)} U',
              style: fontDMBold.copyWith(
                  color: BaseColors.primaryColor, fontSize: 18),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  _progress() {
    return Obx(() => Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/income/progress_bg4.png',
            width: 310,
            height: 310,
          ),
        ),
        Center(
          child: ClipPath(
            clipper: ArcClipper(
                startPoint: 0.7,
                progress: (controller.totalAmount.value > 0
                    ? (controller.amountTotalInfo.value
                    ?.directAwardAmountTotal ??
                    0) /
                    controller.totalAmount.value
                    : 0) *
                    -1),
            child: Image.asset(
              'assets/images/income/progress_sbg4.png',
              width: 310,
              height: 310,
            ),
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/income/progress_bg3.png',
            width: 260,
            height: 260,
          ),
        ),
        Center(
          child: ClipPath(
            clipper: ArcClipper(
                startPoint: -0.55,
                progress: controller.totalAmount.value > 0
                    ? (controller.amountTotalInfo.value?.roiAmountTotal ?? 0) /
                    controller.totalAmount.value
                    : 0),
            child: Image.asset(
              'assets/images/income/progress_sbg3.png',
              width: 260,
              height: 260,
            ),
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/income/progress_bg2.png',
            width: 210,
            height: 210,
          ),
        ),
        Center(
          child: ClipPath(
            clipper: ArcClipper(
                startPoint: -0.45,
                progress: (controller.totalAmount.value > 0
                    ? (controller.amountTotalInfo.value
                    ?.teamAwardAmountTotal ??
                    0) /
                    controller.totalAmount.value
                    : 0) *
                    -1),
            child: Image.asset(
              'assets/images/income/progress_sbg2.png',
              width: 210,
              height: 210,
            ),
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/income/progress_bg1.png',
            width: 160,
            height: 160,
          ),
        ),
        Center(
          child: ClipPath(
            clipper: ArcClipper(
                startPoint: 0.5,
                progress: controller.totalAmount.value > 0
                    ? (controller.amountTotalInfo.value?.salaryAmountTotal ??
                    0) /
                    controller.totalAmount.value
                    : 0),
            child: Image.asset(
              'assets/images/income/progress_sbg1.png',
              width: 160,
              height: 160,
            ),
          ),
        ),
        Positioned(
          bottom: defaultPadding * 3,
          left: defaultPadding,
          child: Text(
            '${controller.totalAmount.value > 0 ? NumberFormat('#,##0.00').format((controller.amountTotalInfo.value?.salaryAmountTotal ?? 0) / controller.totalAmount.value * 100) : 0}%',
            style: fontDMBold.copyWith(color: BaseColors.white, fontSize: 20),
          ),
        ),
        _positioned(
            bottom: defaultPadding * 3,
            left: defaultPadding,
            size: const Size(150, 1)),
        _positioned(
            bottom: defaultPadding * 3,
            left: 150 + defaultPadding,
            size: const Size(1, 45)),
        Positioned(
          top: defaultPadding,
          left: defaultPadding,
          child: Text(
            '${controller.totalAmount.value > 0 ? NumberFormat('#,##0.00').format((controller.amountTotalInfo.value?.teamAwardAmountTotal ?? 0) / controller.totalAmount.value * 100) : 0}%',
            style: fontDMBold.copyWith(color: BaseColors.white, fontSize: 20),
          ),
        ),
        _positioned(
            top: defaultPadding + controller.textHeight,
            left: defaultPadding,
            size: Size(controller.circleHeight / 2, 1)),
        _positioned(
            top: defaultPadding + controller.textHeight,
            left: controller.circleHeight / 2 + defaultPadding,
            size: const Size(1, 50)),
        Positioned(
          top: 0,
          right: defaultPadding,
          child: Text(
            '${controller.totalAmount.value > 0 ? NumberFormat('#,##0.00').format((controller.amountTotalInfo.value?.roiAmountTotal ?? 0) / controller.totalAmount.value * 100) : 0}%',
            style: fontDMBold.copyWith(color: BaseColors.white, fontSize: 20),
          ),
        ),
        _positioned(
            top: controller.textHeight,
            right: defaultPadding,
            size: Size(controller.circleHeight / 2, 1)),
        _positioned(
            top: controller.textHeight,
            right: controller.circleHeight / 2 + defaultPadding,
            size: const Size(1, 35)),
        Positioned(
          bottom: defaultPadding,
          right: defaultPadding,
          child: Text(
            '${controller.totalAmount.value > 0 ? NumberFormat('#,##0.00').format((controller.amountTotalInfo.value?.directAwardAmountTotal ?? 0) / controller.totalAmount.value * 100) : 0}%',
            style: fontDMBold.copyWith(color: BaseColors.white, fontSize: 20),
          ),
        ),
        _positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            size: const Size(105, 1)),
        _positioned(
            bottom: defaultPadding,
            right: 105 + defaultPadding,
            size: const Size(1, 25)),
      ],
    ));
  }

  _positioned({
    double? top,
    double? left,
    double? right,
    double? bottom,
    required Size size,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: CustomPaint(
        size: size,
        painter: DashedLinePainter(
          color: Colors.white,
          strokeWidth: 1,
          dashWidth: 5, // 虚线段的长度
          dashSpace: 2, // 虚线之间的间距
        ),
      ),
    );
  }

  _circularDetail({required String title, required Gradient gradient}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), gradient: gradient),
        ),
        const SizedBox(
          width: defaultPadding / 2,
        ),
        Text(
          title,
          style: fontDMMedium.copyWith(color: BaseColors.white, fontSize: 10),
        )
      ],
    );
  }

  _makeProfitAndNodePartner(BuildContext context,
      {required Function(int index) onTap}) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tr('hashrate.team_data'),
              style: fontDMBold.copyWith(color: BaseColors.white, fontSize: 18),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultPadding),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/home/return_bg.png'),
                          fit: BoxFit.cover,
                        )),
                    child: _buildInfoCard(
                      context: context,
                      imagePath: 'assets/images/income/zrs.png',
                      title: tr('income.total_members'),
                      hideRight: true,
                      value:
                          (controller.userTeamTotalInfo.value?.memberCount ?? 0)
                              .toString(),
                      onTap: () => onTap(0),
                    ),
                  ),
                ),
                const SizedBox(
                  width: defaultPadding,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/home/return_bg.png'),
                      fit: BoxFit.cover,
                    )),
                    child: _buildInfoCard(
                      context: context,
                      imagePath: 'assets/images/income/jhrs.png',
                      title: tr('income.activated_members'),
                      value: (controller
                                  .userTeamTotalInfo.value?.realMemberCount ??
                              0)
                          .toString(),
                      onTap: () => onTap(1),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Widget _buildInfoCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String value,
    required Function() onTap,
    bool hideRight = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      imagePath,
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Expanded(
                      child: Text(
                        title,
                        style: fontDMMedium.copyWith(
                          fontSize: 14,
                          color: BaseColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  value,
                  style: fontDMBold.copyWith(
                    fontSize: 18,
                    color: BaseColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
          if (!hideRight)
            const Icon(
              Icons.chevron_right,
              size: 25,
              color: BaseColors.white,
            ),
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  double progress;
  double startPoint;

  ArcClipper({required this.progress, required this.startPoint});

  @override
  Path getClip(Size size) {
    Path path = Path();

    // 定义裁剪的起始点
    path.moveTo(size.width / 2, size.height / 2);

    // 画弧
    path.arcTo(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2),
      pi * startPoint, // 起始角度
      pi * 2 * progress, // 角度范围 (这里是 90 度)
      false,
    );

    // 闭合路径
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant ArcClipper oldClipper) {
    // 这里返回 true，确保 progress 变化时 ClipPath 重新渲染
    return oldClipper.progress != progress || oldClipper.startPoint != startPoint;
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final isHorizontal = size.width > size.height;
    final totalLength = isHorizontal ? size.width : size.height;

    double start = 0;
    while (start < totalLength) {
      final end = (start + dashWidth).clamp(0.0, totalLength);
      if (isHorizontal) {
        canvas.drawLine(Offset(start, 0), Offset(end, 0), paint);
      } else {
        canvas.drawLine(Offset(0, start), Offset(0, end), paint);
      }
      start += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
