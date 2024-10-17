import 'dart:math';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:aida/screens/chat/profile/my_profile_detail_screen_controller.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
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
                        const SizedBox(width: 16,),
                        Text(
                          TIM_t("头像"),
                          style: const TextStyle(fontSize: 14, color: BaseColors.primaryColor),
                        ),
                        Expanded(child: Container()),
                        SizedBox(
                          width: 96,
                          height: 96,
                          child: Avatar(
                              faceUrl: controller.userFullInfo.faceUrl ?? "",
                              showName: controller.userFullInfo.nickName ?? "",
                              borderRadius: BorderRadius.circular(48)
                          ),
                        ),
                        const SizedBox(width: 4,),
                        const Icon(Icons.keyboard_arrow_right, color: Color(0xFF00BBBD),),
                        const SizedBox(width: 16,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
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
                    isEmpty: !TencentUtils.isTextNotEmpty(controller.userFullInfo.nickName),
                    operationName: TIM_t("昵称"),
                    operationRightWidget: Text(
                        TencentUtils.isTextNotEmpty(controller.userFullInfo.nickName)
                            ? controller.userFullInfo.nickName!
                            : isWideScreen
                            ? ""
                            : TIM_t("未填写"),
                        textAlign: isWideScreen ? null : TextAlign.end),
                  ),
                ),
                const SizedBox(height: 16,),
                TIMUIKitOperationItem(
                  isEmpty: !TencentUtils.isTextNotEmpty(controller.userFullInfo.userID),
                  operationName: TIM_t("账号"),
                  operationRightWidget: Text(
                      TencentUtils.isTextNotEmpty(controller.userFullInfo.userID)
                          ? controller.userFullInfo.userID!
                          : isWideScreen
                          ? ""
                          : "",
                      textAlign: isWideScreen ? null : TextAlign.end),
                ),
                const SizedBox(height: 16,),
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
                            TencentUtils.isTextNotEmpty(controller.userFullInfo.selfSignature)
                                ? controller.userFullInfo.selfSignature!
                                : isWideScreen
                                ? ""
                                : TIM_t("未填写"),
                            textAlign: isWideScreen ? null : TextAlign.end))),
                const SizedBox(height: 16,),
                InkWell(
                    onTapDown: (details) {
                      showGenderChoseSheet(context, const TUITheme());
                      // if (isWideScreen) {
                      //   TUIKitWidePopup.showPopupWindow(
                      //       isDarkBackground: false,
                      //       operationKey: TUIKitWideModalOperationKey
                      //           .secondaryClickUserAvatar,
                      //       borderRadius:
                      //       const BorderRadius.all(Radius.circular(4)),
                      //       context: context,
                      //       offset: Offset(details.globalPosition.dx,
                      //           details.globalPosition.dy),
                      //       child: (closeFunc) => TUIKitColumnMenu(
                      //         data: [
                      //           ColumnMenuItem(
                      //               label: TIM_t("男"),
                      //               onClick: () async {
                      //                 final res = await widget.controller
                      //                     ?.updateGender(1);
                      //                 if (res?.code == 0) {
                      //                   setState(() {
                      //                     userProfile?.gender = 1;
                      //                   });
                      //                 }
                      //                 closeFunc();
                      //               }),
                      //           ColumnMenuItem(
                      //               label: TIM_t("女"),
                      //               onClick: () async {
                      //                 final res = await widget.controller
                      //                     ?.updateGender(2);
                      //                 if (res?.code == 0) {
                      //                   setState(() {
                      //                     userProfile?.gender = 2;
                      //                   });
                      //                 }
                      //                 closeFunc();
                      //               }),
                      //         ],
                      //       ));
                      // } else {
                      //
                      // }
                    },
                    child: TIMUIKitProfileWidget.genderBarWithArrow(
                        controller.userFullInfo.gender ?? 0, false)),
                const SizedBox(height: 16,),
                InkWell(
                  onTapDown: (details) async {
                    showDatePicker(context, const TUITheme());
                  },
                  child: TIMUIKitOperationItem(
                      isEmpty: !TencentUtils.isTextNotEmpty(
                          controller.userFullInfo.birthday.toString()),
                      operationName: TIM_t("生日"),
                      operationRightWidget: Text(
                          TencentUtils.isTextNotEmpty(controller.userFullInfo.birthday.toString())
                              ? controller.userFullInfo.birthday.toString()
                              : isWideScreen
                              ? ""
                              : TIM_t("未设置"),
                          textAlign: isWideScreen ? null : TextAlign.end))),
                const SizedBox(height: 16,),
                TIMUIKitOperationItem(
                  isEmpty: !TencentUtils.isTextNotEmpty(controller.mainScreenController.userInfo?.email),
                  operationName: TIM_t("邮箱"),
                  operationRightWidget: Text(
                      TencentUtils.isTextNotEmpty(controller.mainScreenController.userInfo?.email)
                          ? controller.mainScreenController.userInfo?.email ?? ''
                          : isWideScreen
                          ? ""
                          : "",
                      textAlign: isWideScreen ? null : TextAlign.end),
                ),
              ],
            );
          },
        )
    );
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

  showGenderChoseSheet(BuildContext context, TUITheme? theme) {
    showAdaptiveActionSheet(
      context: context,
      title: Text(TIM_t("性别")),
      actions: <BottomSheetAction>[
        BottomSheetAction(
          title: Text(TIM_t("男"), style: TextStyle(color: theme?.primaryColor)),
          onPressed: (_) async { // 1
            controller.updateGender(1);
            Navigator.pop(context);
          },
        ),
        BottomSheetAction(
          title: Text(TIM_t("女"), style: TextStyle(color: theme?.primaryColor)),
          onPressed: (_) async { // 2
            controller.updateGender(2);
            Navigator.pop(context);
          },
        ),
      ],
      cancelAction: CancelAction(
        title: Text(TIM_t("取消")),
      ), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }

  void showDatePicker(BuildContext context, TUITheme? theme) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: 364,
            color: Colors.transparent, // 背景透明
            child: Column(
              children: [
                // 标题
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '选择日期',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                  ),
                ),
                // 日期选择器
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime newDateTime) {
                      String formattedDate = DateFormat('yyyyMMdd').format(newDateTime);
                      controller.birthday = int.parse(formattedDate);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GestureDetector(
                    onTap: () {
                      if (controller.birthday != null) {
                        controller.updateBirthday(controller.birthday!);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF00E0E5).withOpacity(0.5),
                            const Color(0xFF00BFBF).withOpacity(0.5)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF00E0E5), Color(0xFF00BFBF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              TIM_t("确认"),
                              style: fontMedium.copyWith(
                                  color: BaseColors.white,
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
