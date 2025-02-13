import 'package:flutter/material.dart';

class BaseColors {
  static const primaryColor = Color(0xFF17CE92);
  static const secondPrimaryColor = Color(0xFF00FFA3);
  static const thirdPrimaryColor = Color(0xFF20AFFF);
  static const black = Color(0xFF1A1A1A);
  static const black15 = Color(0x261A1A1A);
  static const black40 = Color(0x661A1A1A);
  static const gray = Color(0xFF999999);
  static const gray20 = Color(0xFF333333);
  static const gray85 = Color(0xFFD9D9D9);
  static const gray94 = Color(0xFFF0F0F0);
  static const lightGray = Color(0xFFCCCCCC);
  static const extraLightGray = Color(0xFFE6E6E6);
  static const darkGray = Color(0xFF666666);
  static const white = Colors.white;
  static const whiteGray = Color(0xFFF5F5F5);
  static const whiteGray1 = Color(0xFFE9EDED);
  static const whiteGray2 = Color(0xFFC4C4C4);
  static const whiteGray3 = Color(0xFF918F8F);

  static const textColor = black;
  static const inputTextColor = Color(0xFF000000);
  static const weakTextColor = gray;
  static const inputFillColor = Colors.white;
  static const secondaryInputFillColor = Colors.white54;
  static const darkInputFillColor = gray20;
  static const secondaryDarkInputFillColor = Color(0x80333333);

  static const primaryGradientStartColor = Color(0xE6EBC22A);
  static const primaryGradientEndColor = Color(0xFFFF4104);
  static const secondaryGradientStartColor = whiteGray;
  static const secondaryGradientEndColor = Colors.white;
  static const secondaryDarkGradientStartColor = black;
  static const secondaryDarkGradientEndColor = gray20;

  static const pendingStatus = Color(0xE6EBC22A);
  static const rejectedStatus = Color(0xFFFF4104);
  static const purpleGlowColor = Color(0xFFC5679E);
  static const approvedStatus = Color.fromARGB(255, 0, 255, 110);

  static const baseBackgroundImage = 'assets/images/custom/base_bg.png';
  static const customBackgroundImage = 'assets/images/custom/custom_bg.png';
  static const incomeBackgroundImage = 'assets/images/custom/income_bg.png';
  static const incomeTabBackgroundImage =
      'assets/images/custom/income_bg_tab.png';

  static const baseButtonLinearGradient = LinearGradient(
    colors: [
      Color(0xFF66BFD6), // 0% 的颜色
      Color(0xFF7C8ABA), // 20% 的颜色
      Color(0xFF7F679F), // 43% 的颜色
      Color(0xFF98599D), // 63% 的颜色
      Color(0xFFB46897), // 82% 的颜色
      Color(0xFFDD737C), // 100% 的颜色
    ],
    stops: [0.0, 0.2, 0.43, 0.63, 0.82, 1.0], // 颜色停止点
    begin: Alignment.centerLeft, // 渐变起点
    end: Alignment.centerRight, // 渐变终点
  );

  static LinearGradient aiMyLinearGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF05CCFF),
      Color(0xFF04A2FF),
      Color(0xFF0486FF),
      Color(0xFF047CFF),
    ],
    stops: [0.0, 0.43, 0.79, 1.0],
  );

  static LinearGradient diaYebz = const LinearGradient(
    colors: [
      Color(0xFF5C09C2),
      Color(0xFF4A045C),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient diaCzsb = const LinearGradient(
    colors: [
      Color(0xFFEA4335),
      Color(0xFF84261E),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient diaCzcg = const LinearGradient(
    colors: [
      Color(0xFF12A575),
      Color(0xFF073F2D),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient appBarLinearGradient = const LinearGradient(
    colors: [
      Color(0xFF5009C2),
      Color(0xFF4A045C),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient baseLinearGradient = const LinearGradient(
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
  );

  static LinearGradient baseLinearGradientF = const LinearGradient(
    colors: [
      Color(0xFF05CCFF), // 0% 的颜色
      Color(0xFF08C8FF), // 2% 的颜色
      Color(0xFF4F7FFF), // 37% 的颜色
      Color(0xFF834AFF), // 66% 的颜色
      Color(0xFFA32AFF), // 88% 的颜色
      Color(0xFFB01EFF), // 100% 的颜色
    ],
    stops: [0.0, 0.02, 0.37, 0.66, 0.88, 1.0], // 颜色停止点
    begin: Alignment.centerRight, // 渐变起点
    end: Alignment.centerLeft, // 渐变终点
  );

  static LinearGradient incomeLinearGradient = LinearGradient(
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
    stops: const [0.0, 0.06, 0.13, 0.19, 0.25, 0.29, 0.65, 0.80, 0.99], // 颜色停止点
    begin: Alignment.centerLeft, // 渐变起点
    end: Alignment.centerRight, // 渐变终点
  );

  static LinearGradient profileLinearGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF), // 0%
      Color(0xFFD8E4F1), // 6%
      Color(0xFFB6CEE5), // 13%
      Color(0xFF9DBDDC), // 19%
      Color(0xFF8FB3D7), // 25%
      Color(0xFF8AB0D6), // 29%
      Color(0xFF5E6EA9), // 52%
      Color(0xFF8E6CA3), // 80%
      Color(0xFFD16B9B), // 99%
    ],
    stops: [0.0, 0.06, 0.13, 0.19, 0.25, 0.29, 0.52, 0.80, 0.99],
  );
}


class GradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = BaseColors.baseButtonLinearGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(20),
    );

    // 绘制渐变边框
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
