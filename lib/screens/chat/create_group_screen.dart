import 'package:aida/screens/chat/create_group_screen_controller.dart';
import 'package:aida/screens/chat/widget/create_group.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateGroupScreenArgs {
  final GroupTypeForUIKit convType;

  CreateGroupScreenArgs({required this.convType});
}

class CreateGroupScreen extends GetView<CreateGroupScreenController> {
  const CreateGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: CreateGroup(
        convType: controller.args!.convType,
      ),
    );
  }
}
