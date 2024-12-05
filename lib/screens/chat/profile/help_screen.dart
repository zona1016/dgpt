import 'package:aida/screens/chat/profile/help_screen_controller.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class HelpScreen extends GetView<HelpScreenController> {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: BaseAppBar(
        title: tr('chat.help_center'),
        color: BaseColors.primaryColor,
      ),
      body: const PDFView(
        filePath: '',
      ),
    );
  }

}
