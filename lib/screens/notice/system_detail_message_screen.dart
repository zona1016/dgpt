import 'package:dgpt/screens/notice/system_detail_message_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemDetailMessageScreen extends GetView<SystemDetailMessageScreenController> {
  const SystemDetailMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: 'System Message',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: Container(
        color: BaseColors.black,
        padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Successfully purchased the package',
              style: fontSFProMedium.copyWith(
                  color: BaseColors.white,
                  fontSize: 14
              ),
            ),
            const SizedBox(height: defaultPadding / 2,),
            Text(
              '2025-01-19 20:36:49',
              style: fontSFProMedium.copyWith(
                  color: BaseColors.weakTextColor,
                  fontSize: 14
              ),
            ),
            const SizedBox(height: defaultPadding / 2,),
            Text(
              'You have successfully purchased the Accelerator package',
              style: fontSFProMedium.copyWith(
                  color: BaseColors.weakTextColor,
                  fontSize: 14
              ),
            ),
            const SizedBox(height: defaultPadding,),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Telegram',
                    style: fontSFProMedium.copyWith(
                        color: BaseColors.white,
                        fontSize: 14
                    ),
                  ),
                ),
                Text(
                  '- GPT',
                  style: fontSFProMedium.copyWith(
                      color: BaseColors.white,
                      fontSize: 14
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
