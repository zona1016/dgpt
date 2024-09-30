import 'package:aida/screens/chat/add_group_screen_controller.dart';
import 'package:aida/screens/chat/group_profile_screen.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitAddGroup/tim_uikit_add_group.dart';

class AddGroupScreen extends GetView<AddGroupScreenController> {
  const AddGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const BaseAppBar(
        title: '添加群组',
        color: BaseColors.primaryColor,
      ),
      body: TIMUIKitAddGroup(
        onTapExistGroup: (groupID, conversation) {
          Get.toNamed(AppRoutes.groupProfile,
              arguments: GroupProfileScreenArgs(groupID: groupID));
        },
      ),
    );
  }
}
