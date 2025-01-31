import 'package:dgpt/screens/ai/ai_screen.dart';
import 'package:dgpt/screens/home/home_screen.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/screens/power/power_screen.dart';
import 'package:dgpt/screens/profile/profile_screen.dart';
import 'package:dgpt/screens/task/task_screen.dart';
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
              Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: BaseColors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x1A000000),
                          offset: Offset(0, 0),
                          spreadRadius: 2,
                          blurRadius: 4)
                    ]),
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
              // Positioned(
              //   top: -30,
              //   left: controller.selectedTabIndex.value * ((MediaQuery.of(context).size.width) / 5.0),
              //   child: CustomPaint(
              //     size: Size(((MediaQuery.of(context).size.width) / 5.0), ((MediaQuery.of(context).size.width) / 5.0)), // 弧形大小
              //     painter: DiamondPainter(),
              //   ),
              // ),
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
              style: fontDMMedium.copyWith(color: BaseColors.weakTextColor, fontSize: 12),
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
      const PowerScreen(),
      const HomeScreen(),
      const TaskScreen(),
      const ProfileScreen(),
    ];
  }
}

class DiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.purple // 菱形颜色
      ..style = PaintingStyle.fill;

    final Path path = Path()
      // 定义菱形的四个角的坐标
      ..moveTo(size.width / 2, 0) // 顶点
      ..lineTo(size.width, size.height / 2) // 右侧点
      ..lineTo(0, size.height / 2) // 左侧点
      ..close(); // 连接回起点，完成菱形

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.3, 0)
      ..quadraticBezierTo(size.width * 0.5, -30, size.width * 0.7, 0) // 顶部弧形
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple.shade700
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [Colors.purple, Colors.blueAccent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    // Start at bottom left corner
    path.moveTo(0, size.height);

    // Left edge
    path.lineTo(0, size.height * 0.4);

    // Curve upward
    path.quadraticBezierTo(size.width * 0.3, -10, size.width * 0.5, size.height * 0.2);

    // Curve downward back to normal
    path.quadraticBezierTo(size.width * 0.7, -10, size.width, size.height * 0.4);

    // Right edge
    path.lineTo(size.width, size.height);

    // Close the path
    path.close();

    canvas.drawShadow(path, Colors.black, 10.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
