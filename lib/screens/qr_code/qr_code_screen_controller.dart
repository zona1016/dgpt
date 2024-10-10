import 'package:aida/models/update/app_update_info.dart';
import 'package:aida/screens/auth/welcome_screen_controller.dart';
import 'package:aida/services/auth_service.dart';
import 'package:aida/utils/constants/app_enums.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/packages/dialog.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:tencent_calls_uikit/tuicall_kit.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => QrCodeScreenController(), permanent: false, fenix: false);
  }
}

class QrCodeScreenController extends BaseController {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

}
