import 'package:dgpt/screens/hashrate/widgets/hashrate_header.dart';
import 'package:dgpt/screens/income/team_hashrate_award_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamHashrateAwardScreen extends GetView<TeamHashrateAwardScreenController> {
  const TeamHashrateAwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: BaseAppBar(
        title: tr('hashrate.product_details'),
        color: BaseColors.white,
      ),
      body: Obx(() => SingleChildScrollView(
        child: Column(
          children: [
            if (controller.loaded.value)
              HashrateHeader(
                powerInfo: controller.powerInfo.value,
                progressInfo: controller.progressInfo.value,
              ),
          ],
        ),
      )),
    );
  }

}
