import 'package:aida/models/user/image_uploader_info.dart';
import 'package:aida/screens/chat/create_group/tool/image_uploader.dart';
import 'package:aida/screens/chat/profile/selected_avatar_screen_controller.dart';
import 'package:aida/utils/packages/dialog.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class SelectedAvatarScreen extends GetView<SelectedAvatarScreenController> {
  const SelectedAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        appBar: BaseAppBar(
          title: TIM_t("头像选择"),
          color: BaseColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  if (index == 12)  {
                    Get.context!.loaderOverlay.show();
                    final result = await ImageUploader().handleImageUpload();
                    Get.context!.loaderOverlay.hide();
                    if (result != null) {
                      controller.setFaceUrl(result);
                    }

                  } else {

                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(20))),
                  child: Image.asset(
                    'assets/image/profile/profile_user_icon${index + 1}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: 13,
          ),
        )
    );
  }
}
