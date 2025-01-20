import 'package:dgpt/screens/ai/ai_screen.dart';
import 'package:dgpt/screens/home/home_screen.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/screens/power/power_screen.dart';
import 'package:dgpt/screens/profile/profile_screen.dart';
import 'package:dgpt/screens/task/task_screen.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_auto_keep_alive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      builder: (_) {
        return Scaffold(
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
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.cyan,
                          offset: Offset(0, 0),
                          spreadRadius: 2,
                          blurRadius: 4)
                    ]),
              ),
              Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: BottomNavigationBar(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    selectedFontSize: 0,
                    unselectedFontSize: 0,
                    type: BottomNavigationBarType.fixed,
                    showUnselectedLabels: true,
                    selectedItemColor: BaseColors.primaryColor,
                    unselectedItemColor: BaseColors.lightGray,
                    selectedLabelStyle:
                        fontMSYaHei.copyWith(fontSize: 12, height: 2),
                    unselectedLabelStyle:
                        fontMSYaHei.copyWith(fontSize: 12, height: 2),
                    currentIndex: controller.selectedTabIndex.value,
                    onTap: (value) {
                      controller.selectedTabIndex(value);
                      controller.pageController.jumpToPage(value);
                      controller.update();
                    },
                    items: [
                      BottomNavigationBarItem(
                          label: 'Task',
                          icon: Image.asset(
                            "assets/images/tab/home_inactive.png",
                            width: 20,
                          ),
                          activeIcon: Image.asset(
                              "assets/images/tab/home_active.png",
                              width: 20)),
                      BottomNavigationBarItem(
                          label: 'Power',
                          icon: Image.asset(
                              "assets/images/tab/tutorial_inactive.png",
                              width: 20),
                          activeIcon: Image.asset(
                              "assets/images/tab/tutorial_active.png",
                              width: 20)),
                      BottomNavigationBarItem(
                          label: "Home",
                          icon: Image.asset(
                            "assets/images/tab/event_inactive.png",
                            width: 20,
                          ),
                          activeIcon: Image.asset(
                            "assets/images/tab/event_active.png",
                            width: 20,
                          )),
                      BottomNavigationBarItem(
                          label: 'AI',
                          icon: Image.asset(
                              "assets/images/tab/data_inactive.png",
                              width: 20),
                          activeIcon: Image.asset(
                              "assets/images/tab/data_active.png",
                              width: 20)),
                      BottomNavigationBarItem(
                          label: 'Profile',
                          icon: Image.asset(
                              "assets/images/tab/profile_inactive.png",
                              width: 20),
                          activeIcon: Image.asset(
                              "assets/images/tab/profile_active.png",
                              width: 20)),
                    ],
                  )),
              Positioned(
                top: 0,
                // Position the arc above the BottomNavigationBar
                left: controller.selectedTabIndex.value * 80.0,
                // Calculate position based on selected tab index
                child: CustomPaint(
                  size: Size(80, 25), // Adjust the size of the arc
                  painter: ArcPainter(),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<Widget> getScreens() {
    return [
      const TaskScreen(),
      const PowerScreen(),
      const HomeScreen(),
      const AiScreen(),
      const ProfileScreen(),
    ];
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.cyan // Set the color of the arc
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width / 2, -20, size.width,
          0); // Create the arc with quadraticBezierTo

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
