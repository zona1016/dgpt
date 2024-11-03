import 'package:aida/screens/chat/add_friend_detail_screen_controller.dart';
import 'package:aida/utils/packages/dialog.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/view_models/tui_self_info_view_model.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitAddFriend/tim_uikit_send_application.dart';

class AddFriendDetailScreenArgs {
  final V2TimUserFullInfo? friendInfo;
  final TUISelfInfoViewModel? selfInfoViewModel;

  AddFriendDetailScreenArgs({this.friendInfo, this.selfInfoViewModel});
}

class AddFriendDetailScreen extends GetView<AddFriendDetailScreenController> {
  const AddFriendDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        appBar: BaseAppBar(
          title: TIM_t("添加好友"),
          color: BaseColors.primaryColor,
        ),
        body: SendApplication(
          isShowDefaultGroup: true,
          friendInfo: controller.args!.friendInfo,
          model: controller.args!.selfInfoViewModel,
          addResult: (result) {
            DialogUtils.showBaseDialog(
                title: result,
                confirmText: TIM_t("确定"),
                onConfirmPressed: () {
                  Get.back();
                  Get.back();
                }
            );
          },
        )
    );
  }
}
