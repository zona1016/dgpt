import 'dart:math';

import 'package:aida/screens/chat/profile/my_profile_detail_screen_controller.dart';
import 'package:aida/screens/chat/profile/widget/application_type_widget.dart';
import 'package:aida/screens/chat/profile/widget/gender_chose_widget.dart';
import 'package:aida/utils/bottom_sheet.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:aida/widget/base/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitProfile/widget/tim_uikit_profile_widget.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/avatar.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/text_input_bottom_sheet.dart';

class MyProfileDetailScreen extends GetView<MyProfileDetailScreenController> {
  const MyProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWideScreen =
        TUIKitScreenUtils.getFormFactor(context) == DeviceType.Desktop;
    return BaseScreen(
        appBar: BaseAppBar(
          title: TIM_t("详细资料"),
          color: BaseColors.primaryColor,
        ),
        body: GetBuilder<MyProfileDetailScreenController>(
          builder: (_) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.selectedAvatar);
                  },
                  child: Container(
                    color: BaseColors.white,
                    height: 120,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          TIM_t("头像"),
                          style: const TextStyle(
                              fontSize: 14, color: BaseColors.primaryColor),
                        ),
                        Expanded(child: Container()),
                        SizedBox(
                          width: 96,
                          height: 96,
                          child: Avatar(
                              faceUrl: controller.userFullInfo.faceUrl ?? "",
                              showName: controller.userFullInfo.nickName ?? "",
                              borderRadius: BorderRadius.circular(48)),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xFF00BBBD),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTapDown: (details) async {
                    showTextInputBottomSheet(
                        context: context,
                        title: TIM_t("修改昵称"),
                        tips: TIM_t("仅限汉字、英文、数字和下划线"),
                        initOffset: Offset(
                            min(details.globalPosition.dx,
                                MediaQuery.of(context).size.width - 400),
                            min(details.globalPosition.dy,
                                MediaQuery.of(context).size.height - 100)),
                        onSubmitted: (String nickName) async {
                          controller.updateNickName(nickName);
                        },
                        theme: const TUITheme());
                  },
                  child: TIMUIKitOperationItem(
                    isEmpty: !TencentUtils.isTextNotEmpty(
                        controller.userFullInfo.nickName),
                    operationName: TIM_t("昵称"),
                    operationRightWidget: Text(
                        TencentUtils.isTextNotEmpty(
                                controller.userFullInfo.nickName)
                            ? controller.userFullInfo.nickName!
                            : isWideScreen
                                ? ""
                                : TIM_t("未填写"),
                        textAlign: isWideScreen ? null : TextAlign.end),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TIMUIKitOperationItem(
                  isEmpty: !TencentUtils.isTextNotEmpty(
                      controller.userFullInfo.userID),
                  operationName: TIM_t("账号"),
                  operationRightWidget: Text(
                      TencentUtils.isTextNotEmpty(
                              controller.userFullInfo.userID)
                          ? controller.userFullInfo.userID!
                          : isWideScreen
                              ? ""
                              : "",
                      textAlign: isWideScreen ? null : TextAlign.end),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                    onTapDown: (details) async {
                      showTextInputBottomSheet(
                          context: context,
                          title: TIM_t("修改签名"),
                          tips: TIM_t("仅限汉字、英文、数字和下划线"),
                          initOffset: Offset(
                              min(details.globalPosition.dx,
                                  MediaQuery.of(context).size.width - 400),
                              min(details.globalPosition.dy,
                                  MediaQuery.of(context).size.height - 100)),
                          onSubmitted: (String selfSignature) async {
                            controller.updateSelfSignature(selfSignature);
                          },
                          theme: const TUITheme());
                    },
                    child: TIMUIKitOperationItem(
                        isEmpty: !TencentUtils.isTextNotEmpty(
                            controller.userFullInfo.selfSignature),
                        operationName: TIM_t("个性签名"),
                        operationRightWidget: Text(
                            TencentUtils.isTextNotEmpty(
                                    controller.userFullInfo.selfSignature)
                                ? controller.userFullInfo.selfSignature!
                                : isWideScreen
                                    ? ""
                                    : TIM_t("未填写"),
                            textAlign: isWideScreen ? null : TextAlign.end))),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTapDown: (details) {
                    showGenderChoseSheet(context);
                  },
                  child: TIMUIKitProfileWidget.genderBarWithArrow(
                      controller.userFullInfo.gender ?? 0, false)),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                    onTapDown: (details) async {
                      showDatePicker(context, const TUITheme());
                    },
                    child: TIMUIKitOperationItem(
                        isEmpty: !TencentUtils.isTextNotEmpty(
                            controller.userFullInfo.birthday.toString()),
                        operationName: TIM_t("生日"),
                        operationRightWidget: Text(
                            TencentUtils.isTextNotEmpty(
                                    controller.userFullInfo.birthday.toString())
                                ? controller.userFullInfo.birthday.toString()
                                : isWideScreen
                                    ? ""
                                    : TIM_t("未设置"),
                            textAlign: isWideScreen ? null : TextAlign.end))),
                const SizedBox(
                  height: 16,
                ),
                TIMUIKitOperationItem(
                  isEmpty: !TencentUtils.isTextNotEmpty(
                      controller.mainScreenController.userInfo?.email),
                  operationName: tr('chat.email'),
                  operationRightWidget: Text(
                      TencentUtils.isTextNotEmpty(
                              controller.mainScreenController.userInfo?.email)
                          ? controller.mainScreenController.userInfo?.email ??
                              ''
                          : isWideScreen
                              ? ""
                              : "",
                      textAlign: isWideScreen ? null : TextAlign.end),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          },
        ));
  }

  showTextInputBottomSheet({
    required BuildContext context,
    required String title,
    required String tips,
    required Function(String text) onSubmitted,
    required TUITheme theme,
    Offset? initOffset,
    String? initText,
  }) {
    TextInputBottomSheet.showTextInputBottomSheet(
        context: context,
        title: title,
        tips: tips,
        onSubmitted: onSubmitted,
        theme: theme,
        initOffset: initOffset,
        initText: initText);
  }

  showGenderChoseSheet(BuildContext context) {
    BottomSheetUtils.showBaseBottomSheet(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      title: TIM_t("性别"),
      isDynamicHeight: true,
      context: context,
      showCancel: false,
      child: GenderChoseWidget(
        callback: (gender) {
          controller.updateGender(gender);
        },
      ),
    );
  }

  showDatePicker(BuildContext context, TUITheme? theme) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(0.0))),
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: 364,
            color: Colors.transparent, // 背景透明
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    tr('chat.select_date'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                // 日期选择器
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime newDateTime) {
                      String formattedDate =
                          DateFormat('yyyyMMdd').format(newDateTime);
                      controller.birthday = int.parse(formattedDate);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomButton(
                    text: TIM_t("确认"),
                    callback: () {
                      if (controller.birthday != null) {
                        controller.updateBirthday(controller.birthday!);
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
