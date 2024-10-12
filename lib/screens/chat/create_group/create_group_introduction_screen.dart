import 'package:aida/screens/chat/create_group/widget/create_group_introduction.dart';
import 'package:aida/screens/chat/group_profile_screen_controller.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitGroupProfile/tim_uikit_group_profile.dart';

class CreateGroupIntroductionScreenArgs {
  final String groupID;

  CreateGroupIntroductionScreenArgs({required this.groupID});
}

class CreateGroupIntroductionScreen extends GetView<GroupProfileScreenController> {
  const CreateGroupIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TUIKitScreenUtils.getDeviceWidget(
        context: context,
        desktopWidget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const CreateGroupIntroduction(),
        ),
        defaultWidget: const BaseScreen(
          appBar: BaseAppBar(
            title: "群聊类型",
            color: BaseColors.primaryColor,
          ),
          body: CreateGroupIntroduction(),
        ));
  }
}
