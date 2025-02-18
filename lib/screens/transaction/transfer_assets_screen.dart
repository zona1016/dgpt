import 'package:dgpt/screens/transaction/transfer_assets_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_dropdown_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TransferAssetsScreen extends GetView<TransferAssetsScreenController> {
  const TransferAssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: '转移资产',
        color: BaseColors.white,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Obx(() => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Container(
                      padding: const EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF272F57)
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'From: ',
                                style: fontDMMedium.copyWith(
                                  fontSize: 16,
                                  color: BaseColors.white,
                                ),
                              ),
                              Text(
                                '现金账户',
                                style: fontDMMedium.copyWith(
                                  fontSize: 16,
                                  color: BaseColors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding * 2,),
                          Row(
                            children: [
                              Text(
                                'To: ',
                                style: fontDMMedium.copyWith(
                                  fontSize: 16,
                                  color: BaseColors.white,
                                ),
                              ),
                              Text(
                                '租赁账户',
                                style: fontDMMedium.copyWith(
                                  fontSize: 16,
                                  color: BaseColors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Text(
                      '代币',
                      style: fontDMMedium.copyWith(
                        fontSize: 16,
                        color: BaseColors.white,
                      ),
                    ),
                    BaseDropDownFormField(
                        items: controller.merchantList,
                        fillColor: const Color(0xFF282F54).withOpacity(0.6),
                        dropDownColor: const Color(0xFF282F54),
                        onChanged: (value) {
                          controller.selectedMerchant = value?.value;
                        },
                        name: 'paymentMethodType',
                        style: fontDMMedium.copyWith(color: BaseColors.white),
                        hintText: (controller.merchantList.isNotEmpty) ? controller.merchantList.first.label : '请选择种类',
                        menuMaxHeight: 250),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Text(
                      tr('profile.amount'),
                      style: fontDMMedium.copyWith(
                        fontSize: 16,
                        color: BaseColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xFF282F54).withOpacity(0.6)),
                      child: TextField(
                          controller: controller.textEditingController,
                          decoration: InputDecoration(
                              hintText: 'Minimum 0.00000001',
                              hintStyle: fontDMMedium.copyWith(
                                  color: BaseColors.weakTextColor, fontSize: 14),
                              contentPadding:
                              const EdgeInsets.only(bottom: 10),
                              border: InputBorder.none),
                          style: fontDMMedium.copyWith(
                              color: BaseColors.white, fontSize: 14),
                          textAlign: TextAlign.left,
                          onChanged: (value) {
                            controller.amount.value = value;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')), // 仅允许输入数字和一个小数点
                          ]),
                    ),
                    const SizedBox(height: defaultPadding),
                  ],
                ),
              ),
            ),
            Obx(() => BaseButton(
              enabled: controller
                  .amount.value.isNotEmpty && controller.enabled.value,
              onPressed: () => controller.aiPulseWalletTransfer(),
              text: '确认转移',
            ))
          ],
        )),
      ),
    );
  }
}
