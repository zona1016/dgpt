import 'package:dgpt/screens/income/income_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeScreen extends GetView<IncomeScreenController> {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Text(
                  '收益分析',
                  style: fontBold.copyWith(
                      fontSize: 20, color: BaseColors.white),
                ),
              ),
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
                    '总收益 \$XXX,XXX',
                    style: fontDMBold.copyWith(
                        color: BaseColors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding,),
              _circular(),
              const SizedBox(height: defaultPadding,),
              _makeProfitAndNodePartner(context, onTap: (index) {
                if (index == 0) {
                  Get.toNamed(AppRoutes.analyze);
                } else {
                  Get.toNamed(AppRoutes.nodePartner);
                }
              }),
              const SizedBox(height: defaultPadding),
              Text(
                '收益明细',
                style: fontDMBold.copyWith(
                    color: BaseColors.white,
                    fontSize: 18
                ),
              ),
              const SizedBox(height: defaultPadding,),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildIncomeCard('算力租借', 100),
                  _buildIncomeCard('团队算力奖', 200),
                  _buildIncomeCard('邀请奖', 300),
                  _buildIncomeCard('薪资', 400),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncomeCard(String title, double amount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(defaultPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Row(
            children: [
              Image.asset(
                'assets/images/home/day_return.png',
                width: 25,
                height: 25,
              ),
              const SizedBox(width: defaultPadding / 2,),
              Text(
                title,
                style: fontDMMedium.copyWith(
                    color: BaseColors.weakTextColor,
                    fontSize: 15
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2,),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: fontDMBold.copyWith(
                color: BaseColors.primaryColor,
                fontSize: 18
            ),
          ),
          const Spacer(),
        ],
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
                  '2%',
                  style: fontDMBold.copyWith(
                      color: BaseColors.white, fontSize: 20),
                ),
              ),
              _positioned(
                  bottom: defaultPadding * 3,
                  left: defaultPadding,
                  size: const Size(150, 1)
              ),
              _positioned(
                  bottom: defaultPadding * 3,
                  left: 150 + defaultPadding,
                  size: const Size(1, 50)
              ),
              CustomPaint(
                size: const Size(50, 50),
                painter: CustomCircularPainter(0.02, 1.5, Colors.cyan),
              ),
              Positioned(
                top: defaultPadding,
                left: defaultPadding,
                child: Text(
                  '5%',
                  style: fontDMBold.copyWith(
                      color: BaseColors.white, fontSize: 20),
                ),
              ),
              _positioned(
                  top: defaultPadding + controller.textHeight,
                  left: defaultPadding,
                  size: Size(controller.circleHeight / 2, 1)
              ),
              _positioned(
                  top: defaultPadding + controller.textHeight,
                  left: controller.circleHeight / 2 + defaultPadding,
                  size: const Size(1, 50)
              ),
              CustomPaint(
                size: const Size(100, 100),
                // You can adjust the size of the circle
                painter: CustomCircularPainter(0.35, 3, Colors.yellow),
              ),
              Positioned(
                top: 0,
                right: defaultPadding,
                child: Text(
                  '5%',
                  style: fontDMBold.copyWith(
                      color: BaseColors.white, fontSize: 20),
                ),
              ),
              _positioned(
                  top: controller.textHeight,
                  right: defaultPadding,
                  size: Size(controller.circleHeight / 2, 1)
              ),
              _positioned(
                  top: controller.textHeight,
                  right: controller.circleHeight / 2 + defaultPadding,
                  size: const Size(1, 35)
              ),
              CustomPaint(
                size: const Size(150, 150),
                // You can adjust the size of the circle
                painter: CustomCircularPainter(0.35, 2.5, Colors.red),
              ),
              Positioned(
                bottom: defaultPadding,
                right: defaultPadding,
                child: Text(
                  '25%',
                  style: fontDMBold.copyWith(
                      color: BaseColors.white, fontSize: 20),
                ),
              ),
              _positioned(
                  bottom: defaultPadding,
                  right: defaultPadding,
                  size: const Size(105, 1)
              ),
              _positioned(
                  bottom: defaultPadding,
                  right: 105 + defaultPadding,
                  size: const Size(1, 30)
              ),
              CustomPaint(
                size: const Size(200, 200),
                // You can adjust the size of the circle
                painter: CustomCircularPainter(0.03, 4, Colors.purple),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(child: _circularDetail(title: '算力租借', color: Colors.blue)),
            Expanded(child: _circularDetail(title: '邀请奖', color: Colors.yellow)),
            Expanded(child: _circularDetail(title: '薪资', color: Colors.red)),
            Expanded(child: _circularDetail(title: '团队算力奖', color: Colors.purple)),
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

  _circularDetail({
    required String title,
    required Color color
}) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color
          ),
        ),
        const SizedBox(width: defaultPadding / 2,),
        Text(
          title,
          style: fontDMMedium.copyWith(
            color: BaseColors.white,
            fontSize: 10
          ),
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
          '团队数据',
          style: fontDMBold.copyWith(
              color: BaseColors.white,
              fontSize: 18
          ),
        ),
        const SizedBox(height: defaultPadding,),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home/return_bg.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Row(
            children: [
              Expanded(child: _buildInfoCard(
                context: context,
                imagePath: 'assets/images/home/day_return.png',
                title: '每小时收益',
                value: '2.28 USDT',
                onTap: () => onTap(0),
              )),
              Expanded(child: _buildInfoCard(
                context: context,
                imagePath: 'assets/images/home/total_return.png',
                title: '总收益',
                value: '8,182.28 USDT',
                onTap: () => onTap(1),
              )),
            ],
          ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 25,
          height: 25,
        ),
        const SizedBox(height: defaultPadding / 2),
        Text(
          title,
          style: fontDMMedium.copyWith(
            fontSize: 14,
            color: BaseColors.weakTextColor,
          ),
        ),
        const SizedBox(height: defaultPadding / 4),
        GestureDetector(
          onTap: onTap,
          child: Text(
            value,
            style: fontDMBold.copyWith(
              fontSize: 18,
              color: BaseColors.primaryColor,
            ),
          ),
        )
      ],
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
