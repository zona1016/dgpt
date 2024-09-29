import 'package:aida/screens/chat/chat_main_screen.dart';
import 'package:aida/screens/chat/search_screen_controller.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitSearch/tim_uikit_search.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitSearch/tim_uikit_search_msg_detail.dart';

class SearchScreen extends GetView<SearchScreenController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: TIMUIKitSearch(
          onTapConversation: (conv, message) {
            Get.toNamed(AppRoutes.chat, arguments: ChatMainScreenArgs(selectedConversation: conv));
          },
          onEnterSearchInConversation: (V2TimConversation conversation, String keyword) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BaseScreen(
                    body: TIMUIKitSearchMsgDetail(
                      currentConversation: conversation,
                      keyword: keyword,
                      onTapConversation: (conv, message) {
                        Get.toNamed(AppRoutes.chat, arguments: ChatMainScreenArgs(selectedConversation: conv));
                      },
                    ),
                  ),
                ));
          },
        )
    );
  }
}
