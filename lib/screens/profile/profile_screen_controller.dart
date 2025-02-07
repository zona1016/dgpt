import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ProfileScreenController(), permanent: false, fenix: false);
  }
}

class ProfileScreenController extends BaseController {

  final AuthService authService = Get.find();
  GlobalKey globalKey = GlobalKey();

  List<String> profileActionTitles = [
    tr('profile.computing_power_wallet'),
    tr('profile.cash_wallet'),
    tr('profile.withdraw'),
  ];

  List<String> profileActionImages = [
    'assets/images/custom/profile_slqb.png',
    'assets/images/custom/profile_xjqb.png',
    'assets/images/custom/profile_tk.png',
  ];

  List<String> profileTitles = [
    tr('profile.my_orders'),
    tr('profile.share'),
    'KYC',
    tr('profile.customer_service'),
    tr('profile.language_selection'),
    tr('profile.about_us'),
  ];

  List<String> profileImages = [
    'assets/images/custom/profile_wddd.png',
    'assets/images/custom/profile_fx.png',
    'assets/images/custom/profile_kyc.png',
    'assets/images/custom/profile_kf.png',
    'assets/images/custom/profile_yyxz.png',
    'assets/images/custom/profile_gywm.png',
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

}
