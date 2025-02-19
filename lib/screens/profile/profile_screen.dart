import 'package:dgpt/screens/profile/profile_screen_controller.dart';
import 'package:dgpt/screens/transaction/my_assets_screen.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: 'assets/images/custom/profile_bg.png',
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultPadding),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF23135C), // 起始颜色
                      Color(0xFF321537), // 结束颜色
                    ],
                  ),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return _listItem(
                        onTap: () {
                          if (index == 0) {
                            Get.toNamed(AppRoutes.order);
                          } else if (index == 1) {
                            // final shareResult = await Share.share('分享的内容');
                            _showShare(context);
                          } else if (index == 2) {
                            Get.toNamed(AppRoutes.kyc);
                          }
                        },
                        gradient: index == 0
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
                        title: controller.profileTitles[index],
                        image: controller.profileImages[index],
                        showRight: true);
                  },
                  separatorBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      height: 1,
                      width: double.infinity,
                      color: BaseColors.white.withOpacity(0.2),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultPadding),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF23135C), // 起始颜色
                      Color(0xFF321537), // 结束颜色
                    ],
                  ),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return _listItem(
                        onTap: () {
                          if (index == 0) {
                            Get.toNamed(AppRoutes.helpCenter);
                          } else if (index == 1) {
                            Get.toNamed(AppRoutes.changeLanguage);
                          } else if (index == 2) {
                            Get.toNamed(AppRoutes.aboutUs);
                          }
                        },
                        title: controller.profileTitles[3 + index],
                        image: controller.profileImages[3 + index],
                        showRight: true);
                  },
                  separatorBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      height: 1,
                      width: double.infinity,
                      color: BaseColors.white.withOpacity(0.2),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              BaseButton(
                onPressed: () => controller.logout(),
                customDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFEA4335).withOpacity(0.5),
                      const Color(0xFF84261E).withOpacity(0.5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                leftIcon: Padding(
                  padding: const EdgeInsets.only(right: defaultPadding / 2),
                  child: Image.asset(
                    'assets/images/home/dcdl.png',
                    height: 20,
                    width: 18,
                  ),
                ),
                text: tr('button.logout'),
              ),
              const SizedBox(
                height: defaultPadding * 2,
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
          onTap: () => Get.toNamed(AppRoutes.myAssets,
              arguments: MyAssetsScreenArgs(
                  userBalanceList: controller.userBalanceList.value)),
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
                    Obx(() => Text(
                          NumberFormat('#,##0.000')
                              .format(controller.totalAmount.value),
                          style: fontDMBold.copyWith(
                            color: BaseColors.white,
                            fontSize: 24,
                          ),
                        )),
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
    return Obx(() => Row(
          children: [
            Expanded(
              child: _cardItem(
                  callBack: () => cardTaps(0),
                  title: controller.profileActionTitles[0],
                  image: controller.profileActionImages[0],
                  amount: controller.zpTotalAmount.value,
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
                  amount: controller.xjTotalAmount.value,
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
        ));
  }

  _cardItem(
      {required String title,
      required String image,
      required double amount,
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
                  NumberFormat('#,##0.000').format(amount),
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
    DialogUtils.showShareDialogDefault(
      globalKey: controller.globalKey,
      inviteCode: '${controller.userController.userInfo.inviteCode}',
      copyTap: () {
        Clipboard.setData(ClipboardData(
            text:
            "https://apiluse-h5.pages.dev/#/register?inviteCode=${controller.userController.userInfo.inviteCode}"));
        ToastUtils.showToast(title: tr('tip.copy_success'));
      },
      download: () {
        controller.loadImage(context);
      },
    );
  }
}
