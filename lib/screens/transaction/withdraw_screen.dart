import 'package:dgpt/screens/transaction/withdraw_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawScreen extends GetView<WithdrawScreenController> {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: const BaseAppBar(
        title: '提现',
        color: BaseColors.white,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: defaultPadding,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0xFF282F54).withOpacity(0.6)
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/home/recharge_icon.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: defaultPadding / 2,),
                        Expanded(
                          child: Text(
                            'USDT-TRC20',
                            style: fontDMMedium.copyWith(
                              fontSize: 16,
                              color: BaseColors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultPadding / 5,),
                        const Icon(
                          Icons.chevron_right,
                          size: 25,
                          color: BaseColors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2,),
                  Text(
                    '数额',
                    style: fontDMMedium.copyWith(
                      fontSize: 16,
                      color: BaseColors.white,
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0xFF282F54).withOpacity(0.6)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: TextField(
                              controller: controller.textEditingController,
                              decoration: InputDecoration(
                                  hintText: '请输入金额',
                                  hintStyle: fontDMMedium.copyWith(
                                      color: BaseColors.white,
                                      fontSize: 14
                                  ),
                                  contentPadding: const EdgeInsets.only(bottom: 10),
                                  border: InputBorder.none
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultPadding / 2,),
                        Container(
                          height: 20,
                          width: 1,
                          color: BaseColors.white,
                        ),
                        const SizedBox(width: defaultPadding / 2,),
                        Text(
                          'USDT',
                          style: fontDMMedium.copyWith(
                            fontSize: 16,
                            color: BaseColors.white,
                          ),
                        ),
                        const SizedBox(width: defaultPadding / 5,),
                        const Icon(
                          Icons.chevron_right,
                          size: 25,
                          color: BaseColors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: BaseButton(
                          type: BaseButtonType.secondary,
                          onPressed: () => Get.back(),
                          text: '取消',
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: BaseButton(
                            onPressed: () {},
                            text: '确认提现',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xFF315A5F),
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: defaultPadding,),
                  Text(
                    '贴士',
                    style: fontDMMedium.copyWith(
                      fontSize: 16,
                      color: BaseColors.white,
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2,),
                  Text(
                    '处理时间： T+3\n\n'
                        '手续费： 每笔 2U + 税费\n\n'
                        '税费标准：\n'
                        '提现金额 ≤ 100U：税费 8%\n'
                        '101U – 500U：税费 5%\n'
                        '501U – 1000U：税费 3%\n'
                        '1000U 以上：税费 1%\n\n'
                        '最低提现金额为 10U',
                    style: fontDMMedium.copyWith(
                      fontSize: 16,
                      color: BaseColors.white,
                    ),
                  ),
                  const SizedBox(height: defaultPadding,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
