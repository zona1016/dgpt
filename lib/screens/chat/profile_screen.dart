import 'package:aida/screens/chat/profile_screen_controller.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitProfile/tim_uikit_profile.dart';

class ProfileScreenArgs {
  final String userID;

  ProfileScreenArgs({required this.userID});
}

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: BaseAppBar(
        title: '个人中心',
      ),
      body: TIMUIKitProfile(
        userID: controller.args!.userID,
      ),
    );
  }
}
