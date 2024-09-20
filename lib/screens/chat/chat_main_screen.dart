import 'package:aida/screens/auth/login_screen.dart';
import 'package:aida/screens/auth/welcome_screen.dart';
import 'package:aida/screens/main/main_screen_controller.dart';
import 'package:aida/utils/controllers/user_controller.dart';
import 'package:aida/utils/extensions/context_extension.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_auto_keep_alive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class ChatMainScreen extends GetView<MainScreenController> {
  const ChatMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.appTheme.lightPrimaryColor,
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri("https://master.d2y6t2vezku3nd.amplifyapp.com/#/demo")),
          ),
        )
    );
  }
}
