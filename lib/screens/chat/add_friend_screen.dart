import 'package:aida/screens/chat/add_friend_screen_controller.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitAddFriend/tim_uikit_add_friend.dart';

class AddFriendScreen extends GetView<AddFriendScreenController> {
  const AddFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const BaseAppBar(
        title: '添加好友',
      ),
      body: TIMUIKitAddFriend(onTapAlreadyFriendsItem: (String userID) {

      }),
    );
  }
}
