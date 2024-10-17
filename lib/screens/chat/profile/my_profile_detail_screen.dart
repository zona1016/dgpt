import 'package:aida/screens/chat/profile/my_profile_detail_screen_controller.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitProfile/widget/tim_uikit_profile_widget.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/avatar.dart';

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
                    // widget.controller?.showTextInputBottomSheet(
                    //     context: context,
                    //     title: TIM_t("修改昵称"),
                    //     tips: TIM_t("仅限汉字、英文、数字和下划线"),
                    //     initOffset: Offset(
                    //         min(details.globalPosition.dx,
                    //             MediaQuery.of(context).size.width - 400),
                    //         min(details.globalPosition.dy,
                    //             MediaQuery.of(context).size.height - 100)),
                    //     onSubmitted: (String nickName) async {
                    //       final res =
                    //       await widget.controller?.updateNickName(nickName);
                    //       if (res?.code == 0) {
                    //         setState(() {
                    //           userProfile?.nickName = nickName;
                    //         });
                    //       }
                    //     },
                    //     theme: const TUITheme());
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
                      // widget.controller?.showTextInputBottomSheet(
                      //     context: context,
                      //     title: TIM_t("修改签名"),
                      //     tips: TIM_t("仅限汉字、英文、数字和下划线"),
                      //     initOffset: Offset(
                      //         min(details.globalPosition.dx,
                      //             MediaQuery.of(context).size.width - 400),
                      //         min(details.globalPosition.dy,
                      //             MediaQuery.of(context).size.height - 100)),
                      //     onSubmitted: (String selfSignature) async {
                      //       final res = await widget.controller
                      //           ?.updateSelfSignature(selfSignature);
                      //       if (res?.code == 0) {
                      //         setState(() {
                      //           userProfile?.selfSignature = selfSignature;
                      //         });
                      //       }
                      //     },
                      //     theme: TUITheme());
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
                      //   showGenderChoseSheet(context, TUITheme());
                      // }
                    },
                    child: TIMUIKitProfileWidget.genderBarWithArrow(
                        controller.userFullInfo.gender ?? 0, false)),
                const SizedBox(height: 16,),
                InkWell(
                    onTapDown: (details) async {
                      // widget.controller?.showTextInputBottomSheet(
                      //     context: context,
                      //     title: TIM_t("修改签名"),
                      //     tips: TIM_t("仅限汉字、英文、数字和下划线"),
                      //     initOffset: Offset(
                      //         min(details.globalPosition.dx,
                      //             MediaQuery.of(context).size.width - 400),
                      //         min(details.globalPosition.dy,
                      //             MediaQuery.of(context).size.height - 100)),
                      //     onSubmitted: (String selfSignature) async {
                      //       final res = await widget.controller
                      //           ?.updateSelfSignature(selfSignature);
                      //       if (res?.code == 0) {
                      //         setState(() {
                      //           userProfile?.selfSignature = selfSignature;
                      //         });
                      //       }
                      //     },
                      //     theme: TUITheme());
                    },
                    child: TIMUIKitOperationItem(
                        isEmpty: !TencentUtils.isTextNotEmpty(
                            controller.userFullInfo.selfSignature),
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
}
