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
                            gradient: const LinearGradient(
                              colors: [Colors.greenAccent, Colors.green],
                            ),
                            borderRadius: BorderRadius.circular(defaultPadding),
                          ),
                          child: Center(
                            child: Text(
                              '${tr('home.total_income')} \$${controller.incomeTotal.value?.total ?? ''}',
                              style: fontDMBold.copyWith(
                                  color: BaseColors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        _circular(),
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
                        Text(
                          tr('hashrate.income_details'),
                          style: fontDMBold.copyWith(
                              color: BaseColors.white, fontSize: 18),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: defaultPadding,
                          mainAxisSpacing: defaultPadding,
                          childAspectRatio: 1.7,
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _buildIncomeCard(
                                tr('hashrate.computing_power_rental'),
                                controller.amountTotalInfo.value
                                        ?.directAwardAmountTotal ??
                                    0,
                                'assets/images/income/income_slzj.png',
                                onTap: () {
                              Get.toNamed(AppRoutes.hashrateLeasing);
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
                                        ?.planAmountTotal ??
                                    0,
                                'assets/images/income/income_yqj.png',
                                onTap: () {
                              Get.toNamed(AppRoutes.invitationAward);
                            }),
                            _buildIncomeCard(
                                tr('hashrate.salary'),
                                controller.amountTotalInfo.value
                                        ?.roiAmountTotal ??
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
              '\$${NumberFormat('#,##0.00').format(amount)}',
              style: fontDMBold.copyWith(
                  color: BaseColors.primaryColor, fontSize: 18),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  _circular() {
    return Column(
      children: [
        SizedBox(
          height: controller.circleHeight,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: defaultPadding * 3,
                left: defaultPadding,
                child: Text(
                  '0%',
                  style: fontDMBold.copyWith(
                      color: BaseColors.white, fontSize: 20),
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
              CustomPaint(
                size: const Size(50, 50),
                painter: CustomCircularPainter(0.00, 1.5, Colors.cyan),
              ),
              Positioned(
                top: defaultPadding,
                left: defaultPadding,
                child: Text(
                  '0%',
                  style: fontDMBold.copyWith(
                      color: BaseColors.white, fontSize: 20),
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
              CustomPaint(
                size: const Size(100, 100),
                // You can adjust the size of the circle
                painter: CustomCircularPainter(0.00, 3, Colors.yellow),
              ),
              Positioned(
                top: 0,
                right: defaultPadding,
                child: Text(
                  '0%',
                  style: fontDMBold.copyWith(
                      color: BaseColors.white, fontSize: 20),
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
              CustomPaint(
                size: const Size(150, 150),
                // You can adjust the size of the circle
                painter: CustomCircularPainter(0.00, 2.5, Colors.red),
              ),
              Positioned(
                bottom: defaultPadding,
                right: defaultPadding,
                child: Text(
                  '0%',
                  style: fontDMBold.copyWith(
                      color: BaseColors.white, fontSize: 20),
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
              CustomPaint(
                size: const Size(200, 200),
                // You can adjust the size of the circle
                painter: CustomCircularPainter(0.00, 4, Colors.purple),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(child: _circularDetail(title: '算力租借', color: Colors.blue)),
            Expanded(
                child: _circularDetail(title: '邀请奖', color: Colors.yellow)),
            Expanded(child: _circularDetail(title: '薪资', color: Colors.red)),
            Expanded(
                child: _circularDetail(title: '团队算力奖', color: Colors.purple)),
          ],
        )
      ],
    );
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

  _circularDetail({required String title, required Color color}) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
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
    return Column(
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
                  title: '总人数',
                  value: '100',
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
                  title: '激活人数',
                  value: '80',
                  onTap: () => onTap(1),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildInfoCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String value,
    required Function() onTap,
  }) {
    return GestureDetector(
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
                    Text(
                      title,
                      style: fontDMMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
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

class CustomCircularPainter extends CustomPainter {
  final double progress;
  final double degrees;
  final Color color;

  CustomCircularPainter(this.progress, this.degrees, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBackground = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Paint paintProgress = Paint()
      ..color = color
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw the background circle
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        paintBackground);

    // Draw the progress circle (adjust the start angle here)
    double startAngle = -3.14 * degrees; // -90 degrees (top)
    double sweepAngle = 2 * 3.14 * progress; // The progress (0.0 to 1.0)

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2),
      startAngle, // Set the start angle to control where the progress starts
      sweepAngle, // Control how much of the circle to draw
      false,
      paintProgress,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
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
