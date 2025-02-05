import 'package:dgpt/screens/ai/ai_screen.dart';
import 'package:dgpt/screens/home/home_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_screen.dart';
import 'package:dgpt/screens/income/income_screen.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/screens/profile/profile_screen.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_auto_keep_alive.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      builder: (_) {
        return BaseScreen(
          safeAreaTop: controller.selectedTabIndex.value == 2,
          backgroundColor: Colors.transparent,
          backgroundImage: BaseColors.baseBackgroundImage,
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: getScreens()
                .map((e) => BaseAutomaticKeepAlive(child: e))
                .toList(),
          ),
          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            children: [
              Obx(() => Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: controller.selectedTabIndex.value == 4
                        ? const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))
                        : BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF332D43),
                        Color(0xFF0B0C0D),
                      ],
                    ),
                  ))),
              Positioned(
                top: -20,
                left: controller.selectedTabIndex.value *
                    ((MediaQuery.of(context).size.width) / 5.0),
                child: CustomPaint(
                  size: Size(((MediaQuery.of(context).size.width) / 5.0),
                      ((MediaQuery.of(context).size.width) / 5.0)), // 弧形大小
                  painter: GradientBorderWithBlackFillPainter(),
                ),
              ),
              Positioned(
                top: -20,
                left: 0,
                right: 0,
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedFontSize: 12,
                  unselectedFontSize: 12,
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: true,
                  selectedItemColor: BaseColors.primaryColor,
                  // 选中项颜色
                  unselectedItemColor: BaseColors.lightGray,
                  // 未选中项颜色
                  selectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.normal),
                  currentIndex: controller.selectedTabIndex.value,
                  onTap: (value) {
                    if (value == 0) {
                      Get.toNamed(AppRoutes.aiGuidance);
                      return;
                    }
                    controller.selectedTabIndex(value);
                    controller.pageController.jumpToPage(value);
                    controller.update();
                  },
                  items: [
                    _bottomNavigationBarItem(
                        title: 'AI',
                        inactiveImg: 'assets/images/tab/ai_inactive.png',
                        activeImg: 'assets/images/tab/ai_active.png'),
                    _bottomNavigationBarItem(
                        title: '算力租借',
                        inactiveImg: 'assets/images/tab/power_inactive.png',
                        activeImg: 'assets/images/tab/power_active.png'),
                    _bottomNavigationBarItem(
                        title: '首页',
                        inactiveImg: 'assets/images/tab/home_inactive.png',
                        activeImg: 'assets/images/tab/home_active.png'),
                    _bottomNavigationBarItem(
                        title: '交易明细',
                        inactiveImg:
                        'assets/images/tab/transaction_inactive.png',
                        activeImg: 'assets/images/tab/transaction_active.png'),
                    _bottomNavigationBarItem(
                        title: '个人资料',
                        inactiveImg: 'assets/images/tab/profile_inactive.png',
                        activeImg: 'assets/images/tab/profile_active.png'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem(
      {required String title,
      required String inactiveImg,
      required String activeImg}) {
    return BottomNavigationBarItem(
      label: '',
      icon: SizedBox(
        height: 100,
        width: Get.width / 5.0,
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              inactiveImg,
              width: 24,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: fontDMMedium.copyWith(
                  color: BaseColors.weakTextColor, fontSize: 12),
            ),
            const Spacer(),
          ],
        ),
      ),
      activeIcon: Container(
        margin: const EdgeInsets.only(bottom: 36),
        height: 64,
        width: Get.width / 5.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/tab/tab_seleted_bg.png')),
        ),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              activeImg,
              width: 30,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: fontDMBold.copyWith(color: BaseColors.white, fontSize: 12),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return [
      const AiScreen(),
      const HashrateRentalScreen(),
      const HomeScreen(),
      const IncomeScreen(),
      const ProfileScreen(),
    ];
  }
}

class GradientBorderWithBlackFillPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 定义渐变边框颜色
    final borderPaint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.blueAccent, Colors.purple.shade700],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke // 设置为边框
      ..strokeWidth = 2; // 设置边框宽度

    // 定义填充颜色
    final fillPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF332D43),
          Color(0xFF0B0C0D),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill; // 设置为填充

    // 绘制弧形路径（反转到顶部）
    Path path = Path()
      ..moveTo(0, size.height * 2 / 8) // 左侧起点
      ..arcToPoint(
        Offset(size.width, size.height * 2 / 8), // 终点
        radius: Radius.elliptical(size.width * 1.2, size.width * 3), // 将纵向半径设置为0，趋近直线
        clockwise: true,
      );

    // 填充
    canvas.drawPath(path, fillPaint);

    // 边框
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
