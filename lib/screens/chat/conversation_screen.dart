import 'package:aida/screens/chat/chat_main_screen.dart';
import 'package:aida/screens/chat/conversation_screen_controller.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitConversation/tim_uikit_conversation.dart';

class ConversationScreen extends GetView<ConversationScreenController> {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        backgroundColor: BaseColors.whiteGray,
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
                  color: Colors.transparent, // 背景颜色为灰色
                  border: Border.all(
                    color: BaseColors.primaryColor, // 设置边框颜色为白色
                    width: 0.5, // 设置边框宽度
                  ),
                  borderRadius: BorderRadius.circular(5), // 设置圆角为5
                ),
                child: GestureDetector(
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
              GestureDetector(
                onTap: (){},
                child: Image.asset(
                  "assets/image/base/add.png",
                  width: 22,
                  height: 22,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
