import 'package:dgpt/models/pulse/layer_info.dart';
import 'package:dgpt/screens/income/activated_users_screen_controller.dart';
import 'package:dgpt/screens/income/active_member_detail_screen.dart';
import 'package:dgpt/screens/income/widgets/activated_member.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
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
        title: '激活人数',
        color: BaseColors.white,
      ),
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(child: ActivatedMember(layerList: controller.layerList)),
      )),
    );
  }
}
