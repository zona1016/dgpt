import 'package:dgpt/screens/income/activated_users_screen_controller.dart';
import 'package:dgpt/screens/income/widgets/activated_member.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivatedUsersScreen extends GetView<ActivatedUsersScreenController> {
  const ActivatedUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: BaseAppBar(
        title: tr('income.activated_members'),
        color: BaseColors.white,
      ),
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(child: ActivatedMember(layerList: controller.layerList)),
      )),
    );
  }
}
