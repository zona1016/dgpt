
import 'package:aida/screens/chat/profile/profile_setting_detail_screen_controller.dart';
import 'package:aida/screens/chat/profile/widget/application_type_widget.dart';
import 'package:aida/utils/bottom_sheet.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';

class ProfileSettingDetailScreenArgs {
  final V2TimUserFullInfo userFullInfo;

  ProfileSettingDetailScreenArgs({required this.userFullInfo});
}


class ProfileSettingDetailScreen extends GetView<ProfileSettingDetailScreenController> {
  const ProfileSettingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktopScreen =
        TUIKitScreenUtils.getFormFactor(context) == DeviceType.Desktop;

    return BaseScreen(
      appBar: BaseAppBar(
        title: TIM_t('设置'),
        color: BaseColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProfileSettingDetailScreenController>(
          builder: (_) {
            return Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    showApplicationTypeSheet(context);
                  },
                  child: TIMUIKitOperationItem(
                    isEmpty: false,
                    operationName: TIM_t("加我为好友的方式"),
                    operationRightWidget: Text(
                      controller
                          .getAllowText(controller.userFullInfo.allowType),
                      textAlign: isDesktopScreen ? null : TextAlign.end,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.blackList);
                  },
                  child: TIMUIKitOperationItem(
                    isEmpty: false,
                    operationName: TIM_t("黑名单"),
                    operationRightWidget: Text(
                      '',
                      textAlign: isDesktopScreen ? null : TextAlign.end,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  showApplicationTypeSheet(BuildContext context) {
    BottomSheetUtils.showBaseBottomSheet(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      title: tr('chat.permission_management'),
      isDynamicHeight: true,
      context: context,
      showCancel: false,
      child: ApplicationTypeWidget(
        callback: (type) {
          controller.updateAllowType(type);
        },
      ),
    );
  }
}
