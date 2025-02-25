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
                                              '${tr('income.date')}：${DateFormat("dd/MM/yyyy").format(DateTime.now())}',
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
                                            tr('income.company_position'),
                                            style: fontDMBold.copyWith(
                                              color: BaseColors.white,
                                              fontSize: 8,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            tr('income.company_monthly_salary'),
                                            style: fontDMBold.copyWith(
                                              color: BaseColors.white,
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              tr('income.position_requirements'),
                                              style: fontDMBold.copyWith(
                                                color: BaseColors.white,
                                                fontSize: 10,
                                              ),
                                              textAlign: TextAlign.center),
                                        ),
                                        Expanded(
                                          child: Text(
                                              tr('income.monthly_achievement'),
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
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 15,
                                                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(defaultPadding),
                                                    border: Border.all(
                                                      color: BaseColors.primaryColor,
                                                      width: 1
                                                    ),
                                                    color: Colors.transparent,
                                                  ),
                                                  child: IntrinsicWidth(
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/income/income_up.png',
                                                            width: 8,
                                                            height: 8,
                                                          ),
                                                          const SizedBox(width: defaultPadding / 8,),
                                                          Text(
                                                            controller.userNextJobInfo.value
                                                                ?.name ??
                                                                '',
                                                            style: fontDMMedium.copyWith(
                                                              color: BaseColors.primaryColor,
                                                              fontSize: 8,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                    '${controller.getConditionDes(index: 0, conditionInfo: controller.userJobInfo.value?.conditionInfo)}'
                                                    '/'
                                                    '${controller.getConditionDes(index: 0, conditionInfo: controller.userNextJobInfo.value?.conditionInfo)}',
                                                    style:
                                                        fontDMMedium.copyWith(
                                                      color: BaseColors.white,
                                                      fontSize: 8,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                                Text(
                                                    '${controller.formatAmount((controller.userJobInfo.value?.conditionInfo?.teamPlanAmountTotal ?? 0))}'
                                                    '${tr('income.usd_performance')}'
                                                    '/'
                                                    '${controller.formatAmount((controller.userNextJobInfo.value?.conditionInfo?.teamPlanAmountTotal ?? 0))}'
                                                    '${tr('income.usd_performance')}',
                                                    style:
                                                        fontDMMedium.copyWith(
                                                      color: BaseColors.white,
                                                      fontSize: 8,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                                '${controller.userJobInfo.value?.nowMonthPlanAmountTotal} U',
                                                style: fontDMMedium.copyWith(
                                                  color: BaseColors.white,
                                                  fontSize: 8,
                                                ),
                                                textAlign: TextAlign.right),
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
                                      tr('income.your_salary'),
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
                                              '${tr('income.date')}：${DateFormat("dd/MM/yyyy").format(DateTime.now())}',
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
                                            tr('income.company_position'),
                                            style: fontDMBold.copyWith(
                                              color: BaseColors.white,
                                              fontSize: 8,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            tr('income.company_monthly_salary'),
                                            style: fontDMBold.copyWith(
                                              color: BaseColors.white,
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              tr('income.position_requirements'),
                                              style: fontDMBold.copyWith(
                                                color: BaseColors.white,
                                                fontSize: 10,
                                              ),
                                              textAlign: TextAlign.center),
                                        ),
                                        Expanded(
                                          child: Text(
                                              tr('income.monthly_performance_maintenance'),
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
                                                      .name,
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
                                                    '${controller.getConditionDes(index: index)}'
                                                    '\n'
                                                    '${controller.formatAmount((controller.enableJobList[index].conditionInfo?.teamPlanAmountTotal ?? 0))}'
                                                    '${tr('income.usd_performance')}',
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
                                      tr('income.your_rights'),
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
                                      tr('income.extra_benefits_analysis'),
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
            tr('income.vision_and_mission'),
            style: fontDMBold.copyWith(color: BaseColors.white, fontSize: 18),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Text(
            tr('income.ai_era_disruption'),
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
                title: tr('income.partner_benefits_mission'),
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
                title: tr('income.computing_community_offline_support'),
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
