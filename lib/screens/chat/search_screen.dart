import 'package:aida/screens/chat/search_screen_controller.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class SearchScreen extends GetView<SearchScreenController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        backgroundColor: BaseColors.whiteGray,
        body: TIMUIKitSearch(
          onTapConversation: (conv, message) {
          },
          onEnterConversation: (V2TimConversation conversation, String keyword) {},
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
