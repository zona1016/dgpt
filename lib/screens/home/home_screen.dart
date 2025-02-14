import 'package:carousel_slider/carousel_slider.dart';
import 'package:dgpt/screens/home/home_screen_controller.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/default_navigation_header.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultNavigationHeader(
                    defaultLeftTitle: tr('home.welcome_to_AI_PULSE'),
                    rightImages: const [
                      'assets/images/home/flag.png',
                      'assets/images/home/service.png',
                      'assets/images/home/notice.png'
                    ],
                    onRightImageTaps: (index) {
                      if (index == 0) {
                        Get.toNamed(AppRoutes.changeLanguage);
                      } else if (index == 1) {
                        Get.toNamed(AppRoutes.aboutUs);
                      } else {
                        Get.toNamed(AppRoutes.systemMessage);
                      }
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  // _carousel(context),
                  Obx(() => GestureDetector(
                    onTap: () {
                      final MainScreenController mainController = Get.find();
                      mainController.selectedTabIndex(1);
                      mainController.pageController.jumpToPage(1);
                      mainController.update();
                    },
                    child: Stack(
                      // 让所有子组件居中
                      children: [
                        Image.asset(
                          'assets/images/home/header_bg${controller.isActivate.value ? '_activate' : ''}.png',
                          fit: BoxFit.contain, // 图片自适应大小
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: defaultPadding,
                          child: Text(
                            controller.isActivate.value ? tr('home.activated') : tr('home.not_activated'),
                            style: fontDMBold.copyWith(
                              color: BaseColors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  _makeProfitAndNodePartner(context, onTap: (index) {
                    if (index == 0) {
                      // Get.toNamed(AppRoutes.analyze);
                    } else {
                      // Get.toNamed(AppRoutes.nodePartner);
                    }
                  }),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  _collectionOfFeatures(onTap: (index) {
                    switch (index) {
                      case 0:
                        Get.toNamed(AppRoutes.systemMessage);
                        break;
                      case 1:
                        _showShare(context);
                        break;
                      case 2:
                        Get.toNamed(AppRoutes.tutorial);
                        break;
                      case 3:
                        Get.toNamed(AppRoutes.aboutUs);
                        break;
                      default:
                    }
                  }),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _carousel(BuildContext context) {
    final banners = [
      'https://pic.rmb.bdstatic.com/bjh/events/c1e0c639d8e35ee85ec722988ec059e38721.png@h_1280',
      'https://q0.itc.cn/q_70/images01/20240304/0b8e5c32de4d4277a64c9f9e606273e1.jpeg',
      'https://q0.itc.cn/q_70/images01/20240304/0b8e5c32de4d4277a64c9f9e606273e1.jpeg'
    ];
    return banners.isNotEmpty
        ? Column(children: [
            Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                child: CarouselSlider.builder(
                    carouselController: controller.carouselSliderController,
                    itemCount: banners.length,
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          print(index);
                          print(realIndex);
                        },
                        child: BaseNetworkImage(
                          imageURL: banners[index] ?? '',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      aspectRatio: 1,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        controller.selectedBannerIndex.value = index;
                      },
                    ))),
            const SizedBox(height: 5),
            Obx(() => DotsIndicator(
                  dotsCount: banners.length,
                  position: controller.selectedBannerIndex.value,
                  decorator: DotsDecorator(
                    spacing: const EdgeInsets.all(3.0),
                    color: context.appTheme.indicatorColor,
                    activeColor: BaseColors.primaryColor,
                    size: const Size(10, 10),
                    activeSize: const Size(10, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ))
          ])
        : Container();
  }

  _collectionOfFeatures({required Function(int index) onTap}) {
    return Container(
      height: 96,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xFF23306F)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(controller.titles.length, (index) {
          return Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: InkWell(
                onTap: () {
                  onTap(index);
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Column(
                  children: [
                    const Spacer(),
                    Image.asset(
                      controller.images[index],
                      width: 44,
                      height: 44,
                    ),
                    const SizedBox(
                      height: defaultPadding / 4,
                    ),
                    Text(
                      controller.titles[index],
                      style: fontSFProMedium.copyWith(
                        fontSize: 12,
                        color: BaseColors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  _makeProfitAndNodePartner(BuildContext context,
      {required Function(int index) onTap}) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/home/return_bg.png'),
            fit: BoxFit.cover,
          )),
          child: Row(
            children: [
              Expanded(
                  child: _buildInfoCard(
                context: context,
                imagePath: 'assets/images/home/day_return.png',
                title: tr('home.hourly_income'),
                value:
                    '${NumberFormat('#,##0.00').format(controller.incomeTotal.value?.today ?? 0)} USDT',
                onTap: () => onTap(0),
              )),
              Expanded(
                  child: _buildInfoCard(
                context: context,
                imagePath: 'assets/images/home/total_return.png',
                title: tr('home.total_income'),
                value:
                    '${NumberFormat('#,##0.00').format(controller.incomeTotal.value?.total ?? 0)} USDT',
                onTap: () => onTap(1),
              )),
            ],
          ),
        ));
  }

  Widget _buildInfoCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String value,
    required Function() onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 25,
          height: 25,
        ),
        const SizedBox(height: defaultPadding / 2),
        Text(
          title,
          style: fontDMMedium.copyWith(
            fontSize: 14,
            color: BaseColors.weakTextColor,
          ),
        ),
        const SizedBox(height: defaultPadding / 4),
        GestureDetector(
          onTap: onTap,
          child: Text(
            value,
            style: fontDMBold.copyWith(
              fontSize: 18,
              color: BaseColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }

  _showShare(BuildContext context) async {
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
                    data:
                        "https://apiluse-h5.pages.dev/#/register?inviteCode=${controller.userController.userInfo.inviteCode}", // 要编码的字符串数据
                    version: QrVersions.auto,
                  ),
                ),
              ),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              Text(
                '邀请码：${controller.userController.userInfo.inviteCode}',
                style: fontDMMedium.copyWith(
                    color: BaseColors.white, fontSize: 14),
              ),
              const SizedBox(
                height: defaultPadding / 2,
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
                            Clipboard.setData(ClipboardData(
                                text:
                                    "https://apiluse-h5.pages.dev/#/register?inviteCode=${controller.userController.userInfo.inviteCode}"));
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
                        gradient: BaseColors.baseButtonLinearGradient),
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
