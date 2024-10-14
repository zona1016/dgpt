import 'package:aida/screens/chat/chat_main_screen.dart';
import 'package:aida/screens/chat/conversation_screen_controller.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitConversation/tim_uikit_conversation.dart';

class ConversationScreen extends GetView<ConversationScreenController> {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        appBar: BaseAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: '',
          flexibleSpace: _topBar(context),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: BaseColors.primaryColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  onTap: (){
                    Get.toNamed(AppRoutes.search);
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 8),
                        child: Image.asset(
                          "assets/image/base/search.png",
                          width: 17,
                          height: 17,
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Text(
                        '搜索',
                        style: fontSFProMedium.copyWith(
                            fontSize: 14,
                            color: BaseColors.weakTextColor
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12,),
            Expanded(
              child: TIMUIKitConversation(
                controller: controller.conversationController,
                onTapItem: (value) {
                  Get.toNamed(AppRoutes.chat, arguments: ChatMainScreenArgs(selectedConversation: value));
                },
              ),
            ),
          ],
        )
    );
  }

  Widget _topBar(BuildContext context) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15)
              .copyWith(top: MediaQuery.of(context).padding.top),
          child: Row(
            children: [
              Text(
                '消息',
                style: fontSFProBold.copyWith(
                  fontSize: 20,
                  color: BaseColors.primaryColor
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(child: Container()),
              PopupMenuButton<int>(
                icon: Image.asset(
                  "assets/image/base/add.png",
                  width: 22,
                  height: 22,
                ),
                offset: const Offset(0, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(
                    color: BaseColors.primaryColor,
                    width: 0.5,
                  )
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/image/base/chat_addF.png",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '添加好友',
                          style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.weakTextColor
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/image/base/chat_addG.png",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '添加群聊',
                          style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.weakTextColor
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/image/base/chat_creatG.png",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '创建群聊',
                          style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.weakTextColor
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 4,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          color: BaseColors.primaryColor,
                          size: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '设置',
                          style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.weakTextColor
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  // 点击菜单项的处理逻辑
                  if (value == 1) {
                    Get.toNamed(AppRoutes.addFriend);
                  } else if (value == 2) {
                    Get.toNamed(AppRoutes.addGroup);
                  } else if (value == 3) {
                    Get.toNamed(AppRoutes.createGroupIntroduction);
                  } else if (value == 4) {
                    Get.toNamed(AppRoutes.profileSetting);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
