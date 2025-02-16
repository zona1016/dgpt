import 'package:dgpt/screens/income/salary_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaryScreen extends GetView<SalaryScreenController> {
  const SalaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: 'assets/images/custom/salary_bg.png',
      body: Obx(() => Column(
            children: [
              _tabBar(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/income/income_salary.png',
                          width: 100,
                          height: 90,
                        ),
                      ),
                      _header(),
                      const SizedBox(
                        height: defaultPadding / 2,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: CustomPaint(
                              painter: GradientBorderPainter(),
                              child: Container(
                                padding: const EdgeInsets.all(defaultPadding)
                                    .copyWith(top: 15),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: defaultPadding,
                                              vertical: defaultPadding / 8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: const Color(0xFF999999)
                                                .withOpacity(0.4),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '日期：${DateFormat("dd/MM/yyyy").format(DateTime.now())}',
                                              style: fontDMBold.copyWith(
                                                color: BaseColors.white,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '公司职位',
                                            style: fontDMBold.copyWith(
                                              color: BaseColors.white,
                                              fontSize: 8,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '公司每个月薪资',
                                            style: fontDMBold.copyWith(
                                              color: BaseColors.white,
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text('职位要求',
                                              style: fontDMBold.copyWith(
                                                color: BaseColors.white,
                                                fontSize: 10,
                                              ),
                                              textAlign: TextAlign.center),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    Container(
                                      height: 1,
                                      color: BaseColors.white.withOpacity(0.8),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: defaultPadding / 2),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              controller.userJobInfo.value
                                                      ?.name ??
                                                  '',
                                              style: fontDMMedium.copyWith(
                                                color: BaseColors.white,
                                                fontSize: 8,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${controller.userJobInfo.value?.salary} U',
                                              style: fontDMMedium.copyWith(
                                                color: BaseColors.white,
                                                fontSize: 8,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text('等级3 + 3000美金月绩',
                                                style: fontDMMedium.copyWith(
                                                  color: BaseColors.white,
                                                  fontSize: 8,
                                                ),
                                                textAlign: TextAlign.center),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter, // 顶部居中
                            child: Transform.translate(
                              offset: const Offset(0, -15), // 上移 15 个单位
                              child: IntrinsicWidth(
                                // 让 Container 宽度自适应
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding),
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient:
                                        BaseColors.baseButtonLinearGradient,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '您的薪资',
                                      style: fontDMBold.copyWith(
                                        color: BaseColors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding * 1.5,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: CustomPaint(
                              painter: GradientBorderPainter(),
                              child: Container(
                                padding: const EdgeInsets.all(defaultPadding)
                                    .copyWith(top: 15),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: defaultPadding,
                                              vertical: defaultPadding / 8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: const Color(0xFF999999)
                                                .withOpacity(0.4),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '日期：${DateFormat("dd/MM/yyyy").format(DateTime.now())}',
                                              style: fontDMBold.copyWith(
                                                color: BaseColors.white,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '公司职位',
                                            style: fontDMBold.copyWith(
                                              color: BaseColors.white,
                                              fontSize: 8,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '公司每个月薪资',
                                            style: fontDMBold.copyWith(
                                              color: BaseColors.white,
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text('职位要求',
                                              style: fontDMBold.copyWith(
                                                color: BaseColors.white,
                                                fontSize: 10,
                                              ),
                                              textAlign: TextAlign.center),
                                        ),
                                        Expanded(
                                          child: Text('月绩保持',
                                              style: fontDMBold.copyWith(
                                                color: BaseColors.white,
                                                fontSize: 10,
                                              ),
                                              textAlign: TextAlign.right),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    Container(
                                      height: 1,
                                      color: BaseColors.white.withOpacity(0.8),
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          controller.enableJobList.length,
                                      itemBuilder: (_, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: defaultPadding / 2),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  controller
                                                          .enableJobList[index]
                                                          .name ??
                                                      '',
                                                  style: fontDMMedium.copyWith(
                                                    color: BaseColors.white,
                                                    fontSize: 8,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${controller.enableJobList[index].salary}U',
                                                  style: fontDMMedium.copyWith(
                                                    color: BaseColors.white,
                                                    fontSize: 8,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${controller.enableJobList[index].conditionInfo?.hashrateCode ?? ''}'
                                                    '\n'
                                                    '${controller.formatAmount((controller.enableJobList[index].conditionInfo?.teamPlanAmountTotal ?? 0))}'
                                                    '美金业绩',
                                                    style:
                                                        fontDMMedium.copyWith(
                                                      color: BaseColors.white,
                                                      fontSize: 8,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                              Expanded(
                                                child: Text(
                                                    '${controller.enableJobList[index].monthPlanAmount}U',
                                                    style:
                                                        fontDMMedium.copyWith(
                                                      color: BaseColors.white,
                                                      fontSize: 8,
                                                    ),
                                                    textAlign: TextAlign.right),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (_, index) {
                                        return Container(
                                          height: 0.5,
                                          color: BaseColors.weakTextColor,
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter, // 顶部居中
                            child: Transform.translate(
                              offset: const Offset(0, -15), // 上移 15 个单位
                              child: IntrinsicWidth(
                                // 让 Container 宽度自适应
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding / 2),
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient:
                                        BaseColors.baseButtonLinearGradient,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '您的权利',
                                      style: fontDMBold.copyWith(
                                        color: BaseColors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding * 1.5,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: CustomPaint(
                              painter: GradientBorderPainter(),
                              child: Container(
                                padding: const EdgeInsets.all(defaultPadding)
                                    .copyWith(top: defaultPadding * 1.5),
                                alignment: Alignment.center,
                                child: _card(cardTaps: (index) {
                                  if (index == 0) {
                                  } else if (index == 1) {}
                                }),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter, // 顶部居中
                            child: Transform.translate(
                              offset: const Offset(0, -15), // 上移 15 个单位
                              child: IntrinsicWidth(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding / 2),
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient:
                                        BaseColors.baseButtonLinearGradient,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '额外好处解析',
                                      style: fontDMBold.copyWith(
                                        color: BaseColors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  _tabBar(context) {
    return SizedBox(
      height: 44,
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerLeft,
        child: BackButton(
          onPressed: () => Get.back(),
          color: BaseColors.white,
          style: const ButtonStyle(
              fixedSize: WidgetStatePropertyAll(Size(45, 45)),
              backgroundColor: WidgetStatePropertyAll(Colors.transparent),
              padding: WidgetStatePropertyAll(EdgeInsets.all(12))),
        ),
      ),
    );
  }

  _header() {
    return Container(
      margin: const EdgeInsets.all(defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          gradient: BaseColors.incomeLinearGradient),
      child: Column(
        children: [
          Text(
            '愿景与使命',
            style: fontDMBold.copyWith(color: BaseColors.white, fontSize: 18),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Text(
            'AI时代的到来将颠覆我们对过往应用的了解。 计算能力和数据训练将成为推动AI领域发展的主要核心。AI Pulse让每个人轻松参与其中并从中获取好处。',
            style:
                fontDMRegular.copyWith(color: BaseColors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }

  _card({required Function(int index) cardTaps}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: _cardItem(
                callBack: () => cardTaps(0),
                title: '任何合作伙伴的利益都将与有效的加速任务相应',
                image: 'assets/images/income/income_js.png',
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFA193B3).withOpacity(0.7), // 起始颜色
                    const Color(0xFF767A80).withOpacity(0.7), // 结束颜色
                  ],
                )),
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          Expanded(
            child: _cardItem(
                callBack: () => cardTaps(1),
                title: '计算能力社区线下协助',
                image: 'assets/images/income/income_xx.png',
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFA193B3).withOpacity(0.7), // 起始颜色
                    const Color(0xFF767A80).withOpacity(0.7), // 结束颜色
                  ],
                )),
          ),
        ],
      ),
    );
  }

  _cardItem(
      {required String title,
      required String image,
      required LinearGradient gradient,
      GestureTapCallback? callBack}) {
    return InkWell(
      onTap: callBack,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding / 2),
          gradient: gradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              height: defaultPadding / 5,
            ),
            Text(
              title,
              style: fontDMRegular.copyWith(
                color: BaseColors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
