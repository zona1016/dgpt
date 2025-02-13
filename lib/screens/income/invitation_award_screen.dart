import 'package:dgpt/screens/income/invitation_award_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitationAwardScreen extends GetView<InvitationAwardScreenController> {
  const InvitationAwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: BaseAppBar(
        title: '邀请奖',
        color: BaseColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: defaultPadding,),
              _card(cardTaps: (index) {
                if (index == 0) {
                } else if (index == 1) {
                }
              }),
              const SizedBox(height: defaultPadding,),
              Container(
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultPadding),
                  color: const Color(0xFF1F222A)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '账号',
                            style: fontDMBold.copyWith(
                              color: BaseColors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '金额',
                            style: fontDMBold.copyWith(
                              color: BaseColors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '奖金',
                            style: fontDMBold.copyWith(
                              color: BaseColors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '日期',
                            style: fontDMBold.copyWith(
                              color: BaseColors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.right
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '账号',
                                  style: fontDMMedium.copyWith(
                                    color: BaseColors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '金额',
                                  style: fontDMMedium.copyWith(
                                    color: BaseColors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                    '奖金',
                                    style: fontDMMedium.copyWith(
                                      color: BaseColors.white,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center
                                ),
                              ),
                              Expanded(
                                child: Text(
                                    '日期',
                                    style: fontDMMedium.copyWith(
                                      color: BaseColors.white,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.right
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return Container(height: 0.5, color: BaseColors.weakTextColor,);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _card({required Function(int index) cardTaps}) {
    return Row(
      children: [
        Expanded(
          child: _cardItem(
              callBack: () => cardTaps(0),
              title: controller.actionTitles[0],
              image: controller.actionImages[0],
              amount: 0,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF17CE92), // 起始颜色
                  Color(0xFF0C684A), // 结束颜色
                ],
              )),
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        Expanded(
          child: _cardItem(
              callBack: () => cardTaps(1),
              title: controller.actionTitles[1],
              image: controller.actionImages[1],
              amount: 0,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF6F00FF), // 起始颜色
                  Color(0xFF430099), // 结束颜色
                ],
              )),
        ),
      ],
    );
  }

  _cardItem(
      {required String title,
        required String image, required double amount,
        required LinearGradient gradient,
        GestureTapCallback? callBack}) {
    return GestureDetector(
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
            const SizedBox(height: defaultPadding / 5,),
            Text(
              title,
              style: fontDMMedium.copyWith(
                color: BaseColors.white,
                fontSize: 12,
              ),
            ),
            Text(
              NumberFormat('#,##0.000').format(amount),
              style: fontDMBold.copyWith(
                color: BaseColors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
