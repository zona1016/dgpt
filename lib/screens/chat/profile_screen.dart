import 'package:aida/screens/chat/profile_screen_controller.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitProfile/tim_uikit_profile.dart';

class ProfileScreenArgs {
  final String userID;
  final String? title;
  ProfileScreenArgs({required this.userID, this.title});
}

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: BaseAppBar(
        title: controller.args!.title ?? TIM_t("详细资料"),
        color: BaseColors.primaryColor,
      ),
      body: TIMUIKitProfile(
        userID: controller.args!.userID,
      ),
    );
  }
}
