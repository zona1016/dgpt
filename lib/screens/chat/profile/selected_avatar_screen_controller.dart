import 'dart:io';

import 'package:aida/screens/chat/create_group/tool/image_uploader.dart';
import 'package:aida/screens/chat/profile/my_profile_detail_screen_controller.dart';
import 'package:aida/screens/chat/profile/profile_setting_screen_controller.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class SelectedAvatarScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<SelectedAvatarScreenController>(() => SelectedAvatarScreenController(), fenix: false, permanent: false);
  }
}

class SelectedAvatarScreenController extends BaseController {


  @override
  void onInit() {
    super.onInit();
  }

  loadFile(int index) async {
    File file = await _assetToFile(index);
    imageUpload(file: file);
  }

  imageUpload({File? file}) async {
    Get.context!.loaderOverlay.show();
    final result = await ImageUploader().handleImageUpload(file: file);
    Get.context!.loaderOverlay.hide();
    if (result != null) {
      setFaceUrl(result);
    }
  }

  Future<File> _assetToFile(int index) async {
    // 1. 获取图片资源的字节数据
    ByteData byteData = await rootBundle.load('assets/image/profile/profile_user_icon${index + 1}.png');

    // 2. 获取临时目录
    final tempDir = await getTemporaryDirectory();

    // 3. 创建临时文件
    File file = File('${tempDir.path}/profile_user_icon${index + 1}.png');

    // 4. 将字节数据写入临时文件
    return await file.writeAsBytes(byteData.buffer.asUint8List());
  }

  setFaceUrl(String faceUrl) async {
    await TIMUIKitCore.getInstance().setSelfInfo(
        userFullInfo: V2TimUserFullInfo.fromJson({
      "faceUrl": faceUrl,
    }));

    Get.find<MyProfileDetailScreenController>().updateUserInfo(faceUrl: faceUrl);
    Get.find<ProfileSettingScreenController>().updateUserInfo(faceUrl: faceUrl);
    Get.back();
  }
}
