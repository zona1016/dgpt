
import 'package:aida/screens/chat/contact/new_chat_screen_controller.dart';
import 'package:aida/screens/chat/create_group/widget/create_group.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewChatScreen extends GetView<NewChatScreenController> {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
        body: CreateGroup(
          convType: GroupTypeForUIKit.single,

        )
    );
  }

}
