import 'dart:math';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:aida/main.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tencent_cloud_chat_uikit/data_services/core/tim_uikit_wide_modal_operation_key.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';

import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitProfile/widget/tim_uikit_profile_widget.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/avatar.dart';

import 'package:provider/provider.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/wide_popup.dart';

class MyProfileDetail extends StatefulWidget {
  final V2TimUserFullInfo? userProfile;
  final TIMUIKitProfileController? controller;

  const MyProfileDetail({Key? key, this.userProfile, this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MyProfileDetailState();
}

class MyProfileDetailState extends State<MyProfileDetail> {
  final CoreServicesImpl _coreServices = TIMUIKitCore.getInstance();
  late V2TimUserFullInfo? userProfile;

  @override
  void initState() {
    super.initState();
    userProfile = widget.userProfile;
  }

  final List<String> avatarURL = [
    "https://qcloudimg.tencent-cloud.cn/raw/3f574fd5dd7d3d253e23148f6dbb9d6c.png",
    "https://qcloudimg.tencent-cloud.cn/raw/9c6b6806f88ee33b3685f0435fe9a8b3.png",
    "https://qcloudimg.tencent-cloud.cn/raw/2c6e4177fcca03de1447a04d8ff76d9c.png",
    "https://qcloudimg.tencent-cloud.cn/raw/af98ae3d5c4094d2061612bea8fda4da.png",
    "https://qcloudimg.tencent-cloud.cn/raw/bd41d21551407655a01bba48894d33ad.png",
    "https://qcloudimg.tencent-cloud.cn/raw/f9b6638581718fefb101eaabf7f76a2e.png",
  ];

  setRandomAvatar() async {
    String avatar = avatarURL[Random().nextInt(6)];
    await _coreServices.setSelfInfo(
        userFullInfo: V2TimUserFullInfo.fromJson({
          "faceUrl": avatar,
        }));
    setState(() {
      userProfile?.faceUrl = avatar;
    });
  }

  showGenderChoseSheet(BuildContext context, TUITheme? theme) {
    showAdaptiveActionSheet(
      context: context,
      title: Text(TIM_t("性别")),
      actions: <BottomSheetAction>[
        BottomSheetAction(
          title: Text(TIM_t("男"), style: TextStyle(color: theme?.primaryColor)),
          onPressed: (_) async {
            final res = await widget.controller?.updateGender(1);
            if (res?.code == 0) {
              setState(() {
                userProfile?.gender = 1;
              });
            }
            Navigator.pop(context);
          },
        ),
        BottomSheetAction(
          title: Text(TIM_t("女"), style: TextStyle(color: theme?.primaryColor)),
          onPressed: (_) async {
            final res = await widget.controller?.updateGender(2);
            if (res?.code == 0) {
              setState(() {
                userProfile?.gender = 2;
              });
            }
            Navigator.pop(context);
          },
        ),
      ],
      cancelAction: CancelAction(
        title: Text(TIM_t("取消")),
      ), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }

  String handleGender(int gender) {
    switch (gender) {
      case 0:
        return TIM_t("未设置");
      case 1:
        return TIM_t("男");
      case 2:
        return TIM_t("女");
      default:
        return "";
    }
  }

  Future<bool?> showChangeAvatarDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(TIM_t("TUIKIT 为你选择一个头像?")),
          actions: [
            CupertinoDialogAction(
              child: Text(TIM_t("取消")),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text(TIM_t("确定")),
              onPressed: () {
                setRandomAvatar();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen =
        TUIKitScreenUtils.getFormFactor(context) == DeviceType.Desktop;
    return Scaffold(
      appBar: isWideScreen
          ? null
          : const BaseAppBar(
        title: '详细资料',
        color: BaseColors.primaryColor,
      ),
      body: Column(
        children: [
          if (isWideScreen)
            TIMUIKitProfileUserInfoCard(
                onClickAvatar: () => showChangeAvatarDialog(context),
                userInfo: userProfile),
          if (!isWideScreen)
            GestureDetector(
              child: TIMUIKitOperationItem(
                isEmpty: false,
                operationName: TIM_t("头像"),
                operationRightWidget: SizedBox(
                  width: 48,
                  height: 48,
                  child: Avatar(
                      faceUrl: userProfile?.faceUrl ?? "",
                      showName: userProfile?.nickName ?? ""),
                ),
              ),
              onTap: () => showChangeAvatarDialog(context),
            ),
          TIMUIKitProfileWidget.operationDivider(
              color: BaseColors.primaryColor,
              height: 1,
              margin: const EdgeInsets.symmetric(vertical: 20)
          ),
          InkWell(
            onTapDown: (details) async {
              widget.controller?.showTextInputBottomSheet(
                  context: context,
                  title: TIM_t("修改昵称"),
                  tips: TIM_t("仅限汉字、英文、数字和下划线"),
                  initOffset: Offset(
                      min(details.globalPosition.dx,
                          MediaQuery.of(context).size.width - 400),
                      min(details.globalPosition.dy,
                          MediaQuery.of(context).size.height - 100)),
                  onSubmitted: (String nickName) async {
                    final res =
                    await widget.controller?.updateNickName(nickName);
                    if (res?.code == 0) {
                      setState(() {
                        userProfile?.nickName = nickName;
                      });
                    }
                  },
                  theme: const TUITheme());
            },
            child: TIMUIKitOperationItem(
              isEmpty: !TencentUtils.isTextNotEmpty(userProfile?.nickName),
              operationName: TIM_t("昵称"),
              operationRightWidget: Text(
                  TencentUtils.isTextNotEmpty(userProfile?.nickName)
                      ? userProfile!.nickName!
                      : isWideScreen
                      ? ""
                      : TIM_t("未填写"),
                  textAlign: isWideScreen ? null : TextAlign.end),
            ),
          ),
          TIMUIKitProfileWidget.userAccountBar(
            userProfile?.userID ?? "",
            false,
          ),
          TIMUIKitProfileWidget.operationDivider(
              color: BaseColors.primaryColor,
              height: 1,
              margin: const EdgeInsets.symmetric(vertical: 20)),
          InkWell(
              onTapDown: (details) async {
                widget.controller?.showTextInputBottomSheet(
                    context: context,
                    title: TIM_t("修改签名"),
                    tips: TIM_t("仅限汉字、英文、数字和下划线"),
                    initOffset: Offset(
                        min(details.globalPosition.dx,
                            MediaQuery.of(context).size.width - 400),
                        min(details.globalPosition.dy,
                            MediaQuery.of(context).size.height - 100)),
                    onSubmitted: (String selfSignature) async {
                      final res = await widget.controller
                          ?.updateSelfSignature(selfSignature);
                      if (res?.code == 0) {
                        setState(() {
                          userProfile?.selfSignature = selfSignature;
                        });
                      }
                    },
                    theme: TUITheme());
              },
              child: TIMUIKitOperationItem(
                  isEmpty: !TencentUtils.isTextNotEmpty(
                      userProfile?.selfSignature),
                  operationName: TIM_t("个性签名"),
                  operationRightWidget: Text(
                      TencentUtils.isTextNotEmpty(userProfile?.selfSignature)
                          ? userProfile!.selfSignature!
                          : isWideScreen
                          ? ""
                          : TIM_t("未填写"),
                      textAlign: isWideScreen ? null : TextAlign.end))),
          InkWell(
              onTapDown: (details) {
                if (isWideScreen) {
                  TUIKitWidePopup.showPopupWindow(
                      isDarkBackground: false,
                      operationKey: TUIKitWideModalOperationKey
                          .secondaryClickUserAvatar,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4)),
                      context: context,
                      offset: Offset(details.globalPosition.dx,
                          details.globalPosition.dy),
                      child: (closeFunc) => TUIKitColumnMenu(
                        data: [
                          ColumnMenuItem(
                              label: TIM_t("男"),
                              onClick: () async {
                                final res = await widget.controller
                                    ?.updateGender(1);
                                if (res?.code == 0) {
                                  setState(() {
                                    userProfile?.gender = 1;
                                  });
                                }
                                closeFunc();
                              }),
                          ColumnMenuItem(
                              label: TIM_t("女"),
                              onClick: () async {
                                final res = await widget.controller
                                    ?.updateGender(2);
                                if (res?.code == 0) {
                                  setState(() {
                                    userProfile?.gender = 2;
                                  });
                                }
                                closeFunc();
                              }),
                        ],
                      ));
                } else {
                  showGenderChoseSheet(context, TUITheme());
                }
              },
              child: TIMUIKitProfileWidget.genderBarWithArrow(
                  userProfile?.gender ?? 0, false)),
          if (isWideScreen) Expanded(child: Container()),
          if (isWideScreen)
            const SizedBox(
              height: 40,
            ),
        ],
      ),
    );
  }
}
