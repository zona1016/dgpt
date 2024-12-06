import 'package:aida/screens/chat/chat_main_screen.dart';
import 'package:aida/screens/chat/contact/group_list_screen_controller.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitGroup/tim_uikit_group.dart';

class GroupListScreen extends GetView<GroupListScreenController> {
  const GroupListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: BaseAppBar(
        title: TIM_t('我的群聊'),
        color: BaseColors.primaryColor,
      ),
      body: TIMUIKitGroup(
        onTapItem: (V2TimGroupInfo groupInfo, V2TimConversation conversation) {
          Get.toNamed(AppRoutes.chat, arguments: ChatMainScreenArgs(selectedConversation: conversation));
        },
      )
    );
  }

}
