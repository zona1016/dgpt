import 'package:dgpt/screens/profile/profile_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                print(index);
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
                  itemTap: (index) {
                    print(index);
                    if (index == 0) {
                    } else if (index == 1) {
                    } else {}
                  }),
              const SizedBox(
                height: defaultPadding,
              ),
              _list(
                  showTop: false,
                  startIndex: 3,
                  itemTap: (index) {
                    print(index);
                    if (index == 3) {
                    } else if (index == 4) {
                    } else {
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
          onTap: () {},
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
        Container(
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
                '我的总资产(USDT)',
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
                    '5,971.39',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/images/home/recharge_icon.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(
                    width: defaultPadding / 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'USDT',
                        style: fontDMMedium.copyWith(
                          color: BaseColors.white,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '13045.62',
                        style: fontDMBold.copyWith(
                          color: BaseColors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/home/recharge_icon.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(
                    width: defaultPadding / 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AIP',
                        style: fontDMMedium.copyWith(
                          color: BaseColors.white,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '250',
                        style: fontDMBold.copyWith(
                          color: BaseColors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ],
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
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/custom/profile_icon_bg.png'),
                    fit: BoxFit.cover),
              ),
              child: Image.asset(
                'assets/images/custom/logo.png',
                height: 120,
                width: 120,
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
        height: 100,
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
                  '17502.010',
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
}
