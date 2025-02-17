import 'package:dgpt/screens/ai/ai_screen.dart';
import 'package:dgpt/screens/home/home_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_screen.dart';
import 'package:dgpt/screens/income/income_screen.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/screens/profile/profile_screen.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_auto_keep_alive.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      builder: (_) {
        return BaseScreen(
          safeAreaTop: false,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
              Obx(() => Positioned(
                top: -30,
                left: 0,
                right: 0,
                child: Image.asset('assets/images/tab/bottom_app_bar_bg${controller.selectedTabIndex.value}.png'),
              )),
              Positioned(
                top: -25,
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
                        title: tr('tab.rental'),
                        inactiveImg: 'assets/images/tab/power_inactive.png',
                        activeImg: 'assets/images/tab/power_active.png'),
                    _bottomNavigationBarItem(
                        title: tr('tab.home'),
                        inactiveImg: 'assets/images/tab/home_inactive.png',
                        activeImg: 'assets/images/tab/home_active.png'),
                    _bottomNavigationBarItem(
                        title: tr('tab.statement'),
                        inactiveImg:
                            'assets/images/tab/transaction_inactive.png',
                        activeImg: 'assets/images/tab/transaction_active.png'),
                    _bottomNavigationBarItem(
                        title: tr('tab.profile'),
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
      icon: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 100,
        width: SizeUtil.width() / 5.0,
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
        margin: const EdgeInsets.only(bottom: 46),
        height: 64,
        width: SizeUtil.width() / 5.0,
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
      ..moveTo(2, size.height * 2 / 8) // 左侧起点
      ..arcToPoint(
        Offset(size.width * 0.5, size.height * 0.001 / 8), // 顶点稍微向上
        radius: Radius.elliptical(size.width * 2, size.height * 3), // 增大半径，减少弧度
        clockwise: true,
      )
      ..arcToPoint(
        Offset(size.width - 4, size.height * 2 / 8), // 终点
        radius: Radius.elliptical(size.width * 2, size.height * 3), // 增大半径
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
