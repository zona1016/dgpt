import 'package:aida/screens/chat/group_profile_screen_controller.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitGroupProfile/tim_uikit_group_profile.dart';

class GroupProfileScreenArgs {
  final String groupID;

  GroupProfileScreenArgs({required this.groupID});
}

class GroupProfileScreen extends GetView<GroupProfileScreenController> {
  const GroupProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const BaseAppBar(
        title: '群组资料',
      ),
      body: TIMUIKitGroupProfile(
        groupID: controller.args!.groupID,
      ),
    );
  }
}
