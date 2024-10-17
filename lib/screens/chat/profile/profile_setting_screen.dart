import 'package:aida/screens/chat/profile/profile_setting_screen_controller.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/avatar.dart';

class ProfileSettingScreenArgs {
  final String groupID;

  ProfileSettingScreenArgs({required this.groupID});
}

class ProfileSettingScreen extends GetView<ProfileSettingScreenController> {
  const ProfileSettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isDesktopScreen = TUIKitScreenUtils.getFormFactor(context) == DeviceType.Desktop;

    return BaseScreen(
      appBar: BaseAppBar(
        title: '',
        color: BaseColors.primaryColor,
        actions: [
          IconButton(
              padding: const EdgeInsets.only(left: 8, right: 8),
              onPressed: () {
                Get.toNamed(AppRoutes.profileQRCode);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Image.asset(
                'assets/image/base/profile_qr_code.png',
                height: 24,
                width: 24,
              )),
          IconButton(
              padding: const EdgeInsets.only(left: 8, right: 16),
              onPressed: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Image.asset(
                'assets/image/base/profile_qr_code_scan.png',
                height: 24,
                width: 24,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProfileSettingScreenController>(
          builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 17),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 图片部分
                        const SizedBox(width: 20,),
                        Container(
                          padding: const EdgeInsets.only(top: 0, bottom: 2, right: 0),
                          child: SizedBox(
                            width: isDesktopScreen ? 60 : 65,
                            height: isDesktopScreen ? 60 : 65,
                            child: Avatar(
                              borderRadius: BorderRadius.all(Radius.circular(isDesktopScreen ? 30 : 32.5)),
                              faceUrl: controller.userFullInfo.faceUrl ?? '',
                              showName: '',
                              type: 1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4,),
                        GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.profileDetail);
                            },
                            child: Image.asset(
                              'assets/image/base/profile_edit.png',
                              height: 16,
                              width: 16,
                              color: BaseColors.primaryColor,
                            )
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        TIMUIKitCore.getInstance().loginUserInfo?.nickName ?? '',
                        style: fontBold.copyWith(
                            color: BaseColors.primaryColor,
                            fontSize: 14
                        ),
                      ),
                      const SizedBox(width: 4,),
                      if (controller.userFullInfo.gender != null && controller.userFullInfo.gender != 0)
                        Image.asset(
                          controller.userFullInfo.gender == 1
                              ? 'assets/image/base/profile_male.png'
                              : 'assets/image/base/profile_female.png',
                          height: 12,
                          width: 12,
                        )
                    ],
                  ),
                ),
                if (controller.userFullInfo.userID != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'AIDAV2 ID: ',
                            style: fontBold.copyWith(
                                color: BaseColors.primaryColor,
                                fontSize: 14
                            ),
                          ),
                          Text(
                            controller.userFullInfo.userID ?? '',
                            style: fontBold.copyWith(
                                color: BaseColors.primaryColor,
                                fontSize: 14
                            ),
                          ),
                          const SizedBox(width: 4,),
                          Image.asset(
                            'assets/image/base/profile_copy.png',
                            height: 12,
                            width: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                Center(
                  child: Text(
                    controller.userFullInfo.selfSignature ?? '暂无个人简介',
                    style: fontMedium.copyWith(
                        color: controller.userFullInfo.selfSignature != null ? BaseColors.primaryColor : BaseColors.weakTextColor,
                        fontSize: 12
                    ),
                  ),
                ),
                const SizedBox(height: 60,),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: GestureDetector(
                        onTap: () {
                          print('objectdddddd');
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
                              child: Padding(
                                padding: const EdgeInsets.only(left: 38, right: 18),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      controller.cellImageList[index],
                                      height: 15,
                                      width: 15,
                                      color: BaseColors.white,
                                    ),
                                    const SizedBox(width: 16,),
                                    Text(
                                      controller.cellTitleList[index],
                                      style: fontMedium.copyWith(
                                          color: BaseColors.white,
                                          fontSize: 14
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    const Icon(
                                      Icons.chevron_right,
                                      size: 30,
                                      color: BaseColors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Container(
                      height: 30,
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
