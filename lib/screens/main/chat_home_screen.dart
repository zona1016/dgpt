import 'package:aida/screens/chat/contact/contact_main_screen.dart';
import 'package:aida/screens/chat/conversation_screen.dart';
import 'package:aida/screens/chat/profile/profile_setting_screen.dart';
import 'package:aida/screens/main/chat_home_screen_controller.dart';
import 'package:aida/utils/extensions/context_extension.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_auto_keep_alive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHomeScreen extends GetView<ChatHomeScreenController> {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: context.appTheme.secondaryContainerColor,
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: getScreens()
              .map((e) => BaseAutomaticKeepAlive(child: e))
              .toList(),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          SafeArea(
            child: Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: context.appTheme.containerColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x1A000000),
                        offset: Offset(0, 0),
                        spreadRadius: 2,
                        blurRadius: 4)
                  ]),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: true,
                  selectedItemColor: BaseColors.primaryColor,
                  unselectedItemColor: BaseColors.lightGray,
                  currentIndex: controller.selectedTabIndex.value,
                  onTap: (value) {
                    controller.selectedTabIndex(value);
                    if (controller.pageController.hasClients) {
                      controller.pageController.jumpToPage(value);
                    }
                  },
                  items: [
                    BottomNavigationBarItem(
                        label: '',
                        icon: Image.asset("assets/image/tab/chat.png",
                            width: 23),
                        activeIcon: Image.asset(
                          "assets/image/tab/chat_active.png",
                          width: 23,
                          color: BaseColors.secondPrimaryColor,
                        )),
                    BottomNavigationBarItem(
                        label: '',
                        icon: Image.asset(
                          "assets/image/tab/contacts.png",
                          width: 23,
                        ),
                        activeIcon: Image.asset(
                          "assets/image/tab/contacts_active.png",
                          width: 23,
                          color: BaseColors.secondPrimaryColor,
                        )),
                    BottomNavigationBarItem(
                        label: '',
                        icon: Image.asset(
                          "assets/image/tab/profile.png",
                          width: 23,
                        ),
                        activeIcon: Image.asset(
                          "assets/image/tab/profile_active.png",
                          width: 23,
                          color: BaseColors.secondPrimaryColor,
                        )),
                  ],
                ),
              ))
        ],
      ),
    ));
  }

  List<Widget> getScreens() {
    return [
      const ConversationScreen(),
      const ContactMainScreen(),
      const ProfileSettingScreen(),
    ];
  }
}
