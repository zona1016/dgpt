import 'package:dgpt/screens/income/invitation_award_screen_controller.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitationAwardScreen extends GetView<InvitationAwardScreenController> {
  const InvitationAwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: BaseAppBar(
        title: tr('hashrate.product_details'),
        color: BaseColors.white,
      ),
      body: Container(),
    );
  }

}
