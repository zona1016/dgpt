import 'package:aida/screens/chat/contact/new_contact_screen_controller.dart';
import 'package:aida/screens/chat/create_group/widget/create_group.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitNewContact/tim_uikit_new_contact.dart';

class NewContactScreen extends GetView<NewContactScreenController> {
  const NewContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: BaseAppBar(
        title: TIM_t('新的联系人'),
        color: BaseColors.primaryColor,
      ),
      body: TIMUIKitNewContact(
        onAccept: (applicationInfo) {
          /// 接受好友回调
        },
        onRefuse: (applicationInfo) {
          /// 拒绝好友回调
        },
        emptyBuilder: (context) => Center(
          child: Text(TIM_t('无联系人')),
        ),
        // itemBuilder: (content, applicationInfo) {}
      ),
    );
  }

}
