import 'package:aida/screens/chat/black_list_screen_controller.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitBlackList/tim_uikit_black_list.dart';

class BlackListScreen extends GetView<BlackListScreenController> {
  const BlackListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget blockedUsers() {
      return TIMUIKitBlackList(
        emptyBuilder: (_) {
          return Center(
            child: Text(TIM_t("暂无黑名单")),
          );
        },
        onTapItem: (V2TimFriendInfo friendInfo) {
          final isWideScreen =
              TUIKitScreenUtils.getFormFactor(context) == DeviceType.Desktop;
          if (isWideScreen) {
            // TODO
          } else {

          }
        },
      );
    }

    return TUIKitScreenUtils.getDeviceWidget(
        context: context,
        desktopWidget: blockedUsers(),
        defaultWidget: BaseScreen(
          appBar: BaseAppBar(
            title: TIM_t("黑名单"),
            color: BaseColors.primaryColor,
          ),
          body: blockedUsers(),
        ));
  }
}
