import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GradientCircularProgress extends StatelessWidget {
  final double progress; // 进度值 (0~100)
  final double size; // 进度条大小
  final List<Color> gradientColors;

  const GradientCircularProgress({
    super.key,
    required this.progress,
    this.size = 60,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size + defaultPadding / 2,
      width: size + defaultPadding / 2,
      padding: const EdgeInsets.all(defaultPadding / 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((size + defaultPadding / 2) / 2),
        color: BaseColors.weakTextColor
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _GradientCircularPainter(
            progress: progress,
            gradientColors: gradientColors,
          ),
          child: Center(
            child: Text(
              "${progress.toInt()}%",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientCircularPainter extends CustomPainter {
  final double progress;
  final List<Color> gradientColors;

  _GradientCircularPainter({required this.progress, required this.gradientColors});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 8;
    double radius = (size.width - strokeWidth) / 2;

    Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius);

    // 背景灰色圆环
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade800
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, backgroundPaint);

    // 渐变圆形进度条 (逆时针绘制)
    Paint progressPaint = Paint()
      ..shader = SweepGradient(
        colors: gradientColors,
        stops: [0.0, progress / 100],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    double startAngle = -pi / 2; // 从顶部开始
    double sweepAngle = -2 * pi * (progress / 100); // 逆时针绘制
    canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}