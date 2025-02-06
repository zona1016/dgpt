import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
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
    '算力钱包',
    '现金钱包',
    '提款',
  ];

  List<String> profileActionImages = [
    'assets/images/custom/profile_slqb.png',
    'assets/images/custom/profile_xjqb.png',
    'assets/images/custom/profile_tk.png',
  ];

  List<String> profileTitles = [
    '我的订单',
    '分享',
    'KYC',
    '客服',
    '语言选择',
    '关于我们',
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
