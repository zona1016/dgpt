import 'package:dgpt/screens/profile/profile_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.baseBackgroundImage,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              const SizedBox(
                height: defaultPadding,
              ),
              _card(cardTaps: (index) {
                if (index == 0) {
                } else if (index == 1) {
                } else {}
              }),
              const SizedBox(
                height: defaultPadding,
              ),
              _list(
                  showTop: true,
                  startIndex: 0,
                  itemTap: (index) async {
                    if (index == 0) {
                      Get.toNamed(AppRoutes.order);
                    } else if (index == 1) {
                      // final shareResult = await Share.share('分享的内容');
                      _showShare(context);
                    } else if (index == 2) {
                      Get.toNamed(AppRoutes.kyc);
                    }
                  }),
              const SizedBox(
                height: defaultPadding,
              ),
              _list(
                  showTop: false,
                  startIndex: 3,
                  itemTap: (index) {
                    if (index == 3) {
                      Get.toNamed(AppRoutes.helpCenter);
                    } else if (index == 4) {
                      Get.toNamed(AppRoutes.changeLanguage);
                    } else if (index == 5) {
                      Get.toNamed(AppRoutes.aboutUs);
                    }
                  }),
              const SizedBox(
                height: defaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _appBar() {
    return BaseAppBar(
      color: BaseColors.white,
      backgroundColor: Colors.transparent,
      title: '',
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.transparent,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.systemMessage);
          },
          child: Image.asset(
            'assets/images/home/notice.png',
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.setting),
          child: Image.asset(
            'assets/images/home/more.png',
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(
          width: defaultPadding,
        ),
      ],
    );
  }

  _header() {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.myAssets),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 90),
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            decoration: BoxDecoration(
                color: BaseColors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(defaultPadding)),
            child: Column(
              children: [
                const SizedBox(
                  height: defaultPadding * 3,
                ),
                Text(
                  tr('profile.total_assets_usdt'),
                  style: fontDMMedium.copyWith(
                    color: BaseColors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      NumberFormat('#,##0.00').format(0.00),
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      width: defaultPadding / 4,
                    ),
                    Text(
                      'USDT',
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 140,
              width: 140,
              padding: const EdgeInsets.all(defaultPadding),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/custom/profile_icon_bg.png'),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: ClipOval(
                  // 裁剪成圆形
                  child: BaseNetworkImage(
                    imageURL: controller.userController.userInfo.avatar ?? '',
                    placeholder:
                        "assets/images/placeholder/profile_placeholder.png",
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _card({required Function(int index) cardTaps}) {
    return Row(
      children: [
        Expanded(
          child: _cardItem(
              callBack: () => cardTaps(0),
              title: controller.profileActionTitles[0],
              image: controller.profileActionImages[0],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF892EFF), // 起始颜色
                  Color(0xFF1C4C99), // 结束颜色
                ],
              )),
        ),
        const SizedBox(
          width: defaultPadding / 2,
        ),
        Expanded(
          child: _cardItem(
              callBack: () => cardTaps(1),
              title: controller.profileActionTitles[1],
              image: controller.profileActionImages[1],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFA193B3), // 起始颜色
                  Color(0xFF767A80), // 结束颜色
                ],
              )),
        ),
        const SizedBox(
          width: defaultPadding / 2,
        ),
        Expanded(
          child: _cardItem(
              callBack: () => cardTaps(2),
              title: controller.profileActionTitles[2],
              image: controller.profileActionImages[2],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFA193B3), // 起始颜色
                  Color(0xFF767A80), // 结束颜色
                ],
              )),
        ),
      ],
    );
  }

  _cardItem(
      {required String title,
      required String image,
      required LinearGradient gradient,
      GestureTapCallback? callBack}) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        height: 110,
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding / 2, vertical: defaultPadding / 4 * 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          gradient: gradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 25,
              height: 23,
            ),
            const Spacer(),
            Text(
              title,
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 11,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Image.asset(
                  'assets/images/home/recharge_icon.png',
                  width: 15,
                  height: 15,
                ),
                const SizedBox(
                  width: defaultPadding / 4,
                ),
                Text(
                  NumberFormat('#,##0.00').format(0.00),
                  style: fontDMMedium.copyWith(
                    color: BaseColors.white,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _list(
      {required bool showTop,
      required int startIndex,
      required Function(int index) itemTap}) {
    return Container(
      height: 152,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: showTop
            ? BorderRadius.circular(defaultPadding).copyWith(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
              )
            : BorderRadius.circular(defaultPadding),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF23135C), // 起始颜色
            Color(0xFF321537), // 结束颜色
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listItem(
              onTap: () => itemTap(startIndex),
              gradient: showTop
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                          Color(0xFF05CCFF),
                          Color(0xFF04A2FF),
                          Color(0xFF0486FF),
                          Color(0xFF047CFF),
                        ],
                      stops: [
                          0.0,
                          0.43,
                          0.79,
                          1.0
                        ])
                  : null,
              title: controller.profileTitles[startIndex],
              image: controller.profileImages[startIndex],
              showRight: !showTop),
          if (!showTop)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              height: 1,
              width: double.infinity,
              color: BaseColors.white.withOpacity(0.2),
            ),
          _listItem(
              onTap: () => itemTap(startIndex + 1),
              title: controller.profileTitles[startIndex + 1],
              image: controller.profileImages[startIndex + 1],
              showRight: true),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
            height: 1,
            width: double.infinity,
            color: BaseColors.white.withOpacity(0.2),
          ),
          _listItem(
              onTap: () => itemTap(startIndex + 2),
              title: controller.profileTitles[startIndex + 2],
              image: controller.profileImages[startIndex + 2],
              showRight: true),
        ],
      ),
    );
  }

  _listItem(
      {LinearGradient? gradient,
      required String image,
      required String title,
      bool showRight = false,
      GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: gradient,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: defaultPadding,
            ),
            Image.asset(
              image,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: defaultPadding / 2,
            ),
            Expanded(
              child: Text(
                title,
                style: fontDMMedium.copyWith(
                  color: BaseColors.white,
                  fontSize: 11,
                ),
              ),
            ),
            if (showRight)
              const Icon(
                Icons.chevron_right,
                size: 25,
                color: BaseColors.white,
              ),
            const SizedBox(
              width: defaultPadding,
            ),
          ],
        ),
      ),
    );
  }

  _showShare(BuildContext context) {
    DialogUtils.showShareDialog(
        key: controller.globalKey,
        barrierDismissible: false,
        title: '推荐好友',
        desc: '解锁无限奖励',
        image: 'assets/images/home/share_header.png',
        bgImage: 'assets/images/home/share_bg.png',
        showBottomClose: true,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding / 2),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/home/share_qr_code.png'),
                  fit: BoxFit.cover,
                )),
                child: SizedBox(
                  height: 157,
                  width: 157,
                  child: QrImageView(
                    data: "https://apiluse-h5.pages.dev/#/register?inviteCode=${controller.userController.userInfo.inviteCode}", // 要编码的字符串数据
                    version: QrVersions.auto,
                  ),
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 44,
                    width: double.infinity,
                    margin:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultPadding * 2),
                        color: BaseColors.whiteGray3),
                    child: Row(
                      children: [
                        Text(
                          '复制邀请链接',
                          style: fontDMMedium.copyWith(
                              color: BaseColors.white, fontSize: 16),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(const ClipboardData(
                                text: 'https://aipluse.com'));
                            ToastUtils.showToast(title: tr('tip.copy_success'));
                          },
                          child: Image.asset(
                            'assets/images/home/share_copy.png',
                            height: 20,
                            width: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Container(
                    height: 44,
                    margin:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultPadding * 2),
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/home/share_button.png'),
                            fit: BoxFit.fitHeight)),
                    child: Row(
                      children: [
                        Text(
                          '下载保存图片',
                          style: fontDMMedium.copyWith(
                              color: BaseColors.white, fontSize: 16),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () async {
                            controller.capturePng(context);
                          },
                          child: Image.asset(
                            'assets/images/home/share_download.png',
                            width: 20,
                            height: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ],
          ),
        ));
  }
}
