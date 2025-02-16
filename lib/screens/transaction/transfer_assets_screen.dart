import 'package:dgpt/screens/transaction/recharge_screen_controller.dart';
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    BaseDropDownFormField(
                        items: controller.merchantList,
                        fillColor: const Color(0xFF282F54).withOpacity(0.6),
                        dropDownColor: const Color(0xFF282F54),
                        onChanged: (value) {
                          controller.selectedMerchant = value?.value;
                        },
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: defaultPadding,
                              top: defaultPadding / 2,
                              bottom: defaultPadding / 2),
                          child: Image.asset(
                            'assets/images/home/recharge_icon.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        name: 'paymentMethodType',
                        style: fontDMMedium.copyWith(color: BaseColors.white),
                        hintText: tr('profile.payment_method'),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: TextField(
                                  controller: controller.textEditingController,
                                  decoration: InputDecoration(
                                      hintText: tr('profile.enter_amount'),
                                      hintStyle: fontDMMedium.copyWith(
                                          color: BaseColors.white, fontSize: 14),
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: InputBorder.none),
                                  style: fontDMMedium.copyWith(
                                      color: BaseColors.white, fontSize: 14),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.left,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d*\.?\d{0,2}')),
                                    // 限制为合法数字，两位小数
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            color: BaseColors.white,
                          ),
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
                          Text(
                            'USDT',
                            style: fontDMMedium.copyWith(
                              fontSize: 16,
                              color: BaseColors.white,
                            ),
                          ),
                          const SizedBox(
                            width: defaultPadding / 5,
                          ),
                          const Icon(
                            Icons.chevron_right,
                            size: 25,
                            color: BaseColors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                  ],
                ),
              ),
            ),
            BaseButton(
              enabled: controller
                  .enabled.value && controller.selectedMerchant != null,
              onPressed: () {},
              text: tr('profile.confirm_deposit'),
            )
          ],
        ),
      ),
    );
  }
}
