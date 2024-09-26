import 'package:aida/screens/chat/chat_main_screen_controller.dart';
import 'package:aida/screens/chat/group_profile_screen.dart';
import 'package:aida/screens/chat/profile_screen.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitChat/tim_uikit_chat.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitChat/tim_uikit_chat_config.dart';

class ChatMainScreenArgs {
  final V2TimConversation? selectedConversation;

  ChatMainScreenArgs({this.selectedConversation});
}

class ChatMainScreen extends GetView<ChatMainScreenController> {
  const ChatMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: 'assets/image/base/background.png',
      body: TIMUIKitChat(
        conversation: controller.selectedConversation ??
            V2TimConversation(
                conversationID: "c2c_10040818",
                userID: "10040818",
                showName: "Chat",
                type: 1),
        customStickerPanel: controller.renderCustomStickerPanel,
        config: const TIMUIKitChatConfig(
          // 仅供演示，非全部配置项，实际使用中，可只传和默认项不同的参数，无需传入所有开关
          isAllowClickAvatar: true,
          isUseDefaultEmoji: true,
          isAllowLongPressMessage: true,
          isShowReadingStatus: true,
          isShowGroupReadingStatus: true,
          notificationTitle: "",
          isUseMessageReaction: true,
          groupReadReceiptPermissionList: [
            GroupReceiptAllowType.work,
            GroupReceiptAllowType.meeting,
            GroupReceiptAllowType.public
          ],
        ),
        customAppBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: BaseColors.primaryColor,), // 自定义返回图标
            onPressed: () {
              Get.back(); // 返回上一页
            },
          ),
          elevation: 0,
          title: Text(controller.selectedConversation?.showName ?? '',
              style: fontBold.copyWith(
                  color: BaseColors.primaryColor, fontSize: 20)),
          actions: [
            IconButton(
                padding: const EdgeInsets.only(left: 8, right: 16),
                onPressed: () async {
                  final conversationType =
                      controller.selectedConversation?.type ?? 1;
                  if (conversationType == 1) {
                    final String userID =
                    controller.selectedConversation!.userID!;
                    Get.toNamed(AppRoutes.profile,
                        arguments: ProfileScreenArgs(userID: userID));
                  } else {
                    final String? groupID =
                        controller.selectedConversation?.groupID;
                    if (groupID != null) {
                      Get.toNamed(AppRoutes.groupProfile,
                          arguments: GroupProfileScreenArgs(groupID: groupID));
                    }
                  }
                },
                icon: Image.asset(
                  'assets/image/base/more.png',
                  height: 34,
                  width: 34,
                ))
          ],
        ),
      ),
    );
  }
}
