import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_buy_detail_screen.dart';
import 'package:dgpt/screens/home/home_screen_controller.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: 'assets/images/custom/home_bg.png',
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                    child: Center(
                      child: Image.asset(
                        'assets/images/custom/logo.png',
                        width: 65,
                        height: 68,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      tr('home.welcome_to_AI_PULSE'),
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Obx(() => Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 250, // 确保整个 Swiper 居中
                            child: controller.planList.isEmpty
                                ? GestureDetector(
                                    onTap: () {
                                      final MainScreenController
                                          mainController = Get.find();
                                      mainController.selectedTabIndex(1);
                                      mainController.pageController
                                          .jumpToPage(1);
                                      mainController.update();
                                    },
                                    child: _status(),
                                  ) // 等待数据加载
                                : Swiper(
                                    controller: controller.swiperController,
                                    itemCount: controller.planList.length,
                                    loop: false,
                                    onIndexChanged: (index) {
                                      controller.selectedPlanIndex.value =
                                          index;
                                    },
                                    onTap: (index) {
                                      Get.toNamed(
                                          AppRoutes.hashrateRentalBuyDetail,
                                          arguments:
                                              HashrateRentalBuyDetailScreenArgs(
                                                  planDetail: controller
                                                      .planList[index]));
                                    },
                                    itemBuilder: (context, index) => Stack(
                                      children: [
                                        _status(showBorder: true),
                                      ],
                                    ),
                                  ),
                          ),
                          if (controller.selectedPlanIndex.value > 0)
                            Positioned(
                              top: 0,
                              left: 0,
                              bottom: 0, // 控制左侧箭头的位置
                              child: IconButton(
                                icon: Icon(Icons.arrow_back_ios,
                                    color: Colors.green),
                                onPressed: () {
                                  controller.swiperController
                                      .previous(); // 切换到上一页
                                },
                              ),
                            ),
                          if (controller.planList.length >
                              controller.selectedPlanIndex.value + 1)
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: -5, // 控制右侧箭头的位置
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward_ios,
                                    color: Colors.green),
                                onPressed: () {
                                  controller.swiperController.next(); // 切换到下一页
                                },
                              ),
                            ),
                        ],
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
          onTap: () => Get.toNamed(AppRoutes.changeLanguage),
          child: Image.asset(
            'assets/images/home/flag.png',
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.helpCenter),
          child: Image.asset(
            'assets/images/home/service.png',
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.systemMessage),
          child: Image.asset(
            'assets/images/home/notice.png',
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

  _status({bool showBorder = false}) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.only(bottom: 21),
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: showBorder
                    ? Border.all(color: BaseColors.secondPrimaryColor, width: 1)
                    : null),
            child: Image.asset(
              'assets/images/home/header_bg${controller.isActivate.value ? '_activate' : ''}.png',
              fit: BoxFit.fill, // 图片自适应大小
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: Container(
              height: 42,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(
                      width: 1,
                      color: controller.isActivate.value
                          ? BaseColors.primaryColor
                          : BaseColors.white)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: controller.isActivate.value
                        ? BaseColors.primaryColor
                        : BaseColors.darkGray10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.5),
                          color: controller.isActivate.value
                              ? BaseColors.secondPrimaryColor
                              : BaseColors.gray85),
                    ),
                    const SizedBox(
                      width: defaultPadding,
                    ),
                    Text(
                      controller.isActivate.value
                          ? tr('home.activated')
                          : tr('home.not_activated'),
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: defaultPadding,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
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
    return Obx(() => SizedBox(
      height: (SizeUtil.width() - 3 * defaultPadding) / 2.0,
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: () => onTap(1), child: _buildDayIncome())),
          const SizedBox(
            width: defaultPadding,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(2),
              child: _buildTotalIncome(),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildDayIncome() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: BaseColors.dayIncomeGradient,
          color: Colors.white.withOpacity(0.8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: defaultPadding / 2 * 1.5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Text(
              tr('home.hourly_income'),
              style: fontDMMedium.copyWith(
                fontSize: 14,
                color: BaseColors.white,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 4),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Text(
              '${NumberFormat('#,##0.00').format(controller.incomeTotal.value?.today ?? 0)} USDT',
              style: fontDMBold.copyWith(
                fontSize: 18,
                color: BaseColors.primaryColor,
              ),
            ),
          ),
          Image.asset(
            'assets/images/income/income_line.png',
          )
        ],
      ),
    );
  }

  Widget _buildTotalIncome() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF04133D)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container()),
          Container(
            width: 94,
            height: 94,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/income/total_progress.png'))),
            child: Center(
              child: Text(
                tr('home.total_income'),
                style: fontDMMedium.copyWith(
                  fontSize: 14,
                  color: BaseColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(child: Container()),
          Text(
            '${NumberFormat('#,##0.00').format(controller.incomeTotal.value?.total ?? 0)} USDT',
            style: fontDMBold.copyWith(
              fontSize: 18,
              color: BaseColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(child: Container()),
        ],
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
      shareTap: () async {
        await Share.share('${controller.userController.userInfo.inviteCode}');
      }
    );
  }
}
