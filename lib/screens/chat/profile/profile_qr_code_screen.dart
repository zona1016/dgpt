import 'package:aida/screens/chat/profile/profile_qr_code_screen_controller.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/avatar.dart';

class ProfileQrCodeScreen extends GetView<ProfileQrCodeScreenController> {
  const ProfileQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktopScreen = TUIKitScreenUtils.getFormFactor(context) == DeviceType.Desktop;
    String? faceUrl = TIMUIKitCore.getInstance().loginUserInfo?.faceUrl;
    String? userID = TIMUIKitCore.getInstance().loginUserInfo?.userID;
    return BaseScreen(
      appBar: const BaseAppBar(
        title: '',
        color: BaseColors.primaryColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RepaintBoundary(
              key: controller.globalKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 17),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 0, bottom: 2, right: 0),
                            child: SizedBox(
                              width: isDesktopScreen ? 60 : 65,
                              height: isDesktopScreen ? 60 : 65,
                              child: Avatar(
                                borderRadius: BorderRadius.all(Radius.circular(isDesktopScreen ? 30 : 32.5)),
                                faceUrl: (faceUrl == null)
                                    ? ''
                                    : faceUrl.contains('http')
                                    ? faceUrl
                                    : 'https://$faceUrl',
                                showName: '',
                                type: 1,
                              ),
                            ),
                          ),
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
                      ],
                    ),
                  ),
                  if (userID != null)
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
                                  color: BaseColors.weakTextColor,
                                  fontSize: 14
                              ),
                            ),
                            Text(
                              userID,
                              style: fontBold.copyWith(
                                  color: BaseColors.weakTextColor,
                                  fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: (faceUrl == null)
                                ? ''
                                : faceUrl.contains('http')
                                ? faceUrl
                                : 'https://$faceUrl',
                            placeholder: (context, url) => const CircularProgressIndicator(), // 占位图
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                width: 210,
                                height: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: BaseColors.white,
                                ),
                                child: QrImageView(
                                  data: userID ?? '',
                                  size: 200,
                                  embeddedImage: imageProvider, // 将下载的图片嵌入二维码中
                                  embeddedImageStyle: const QrEmbeddedImageStyle(
                                    size: Size(40, 40), // 设置圆角
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '扫一扫，加我为好友',
                    style: fontBold.copyWith(
                        color: BaseColors.weakTextColor,
                        fontSize: 14
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Expanded(child: Container()),
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: BaseColors.primaryColor.withOpacity(0.5),  // Border color
                          width: 0.5,          // Border width
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/image/base/profile_qr_code_scan.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      '扫一扫',
                      style: fontBold.copyWith(
                          color: BaseColors.primaryColor,
                          fontSize: 14
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    controller.capturePng(context);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/image/base/profile_down_qr_code.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        '下载',
                        style: fontBold.copyWith(
                            color: BaseColors.primaryColor,
                            fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
