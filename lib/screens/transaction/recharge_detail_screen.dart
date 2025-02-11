import 'package:dgpt/screens/transaction/recharge_detail_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_dropdown_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RechargeDetailScreen extends GetView<RechargeDetailScreenController> {
  const RechargeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.deposit'),
        color: BaseColors.white,
        backgroundColor: Colors.black,
      ),
      body: Obx(() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding,),
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.white,
                  child: QrImageView(
                    data: controller.url.value, // 要编码的字符串数据
                    version: QrVersions.auto,
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding,),
              Text(
                '钱包地址：',
                style: fontDMMedium.copyWith(
                  fontSize: 16,
                  color: BaseColors.white,
                ),
              ),
              const SizedBox(height: defaultPadding / 2,),
              Row(
                children: [
                  Text(
                    controller.url.value,
                    style: fontDMMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.white,
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(
                          text: controller.url.value));
                      ToastUtils.showToast(title: tr('tip.copy_success'));
                    },
                    child: Image.asset(
                      'assets/images/home/share_copy.png',
                      height: 16,
                      width: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(height: defaultPadding,),
              Text(
                '所属网络',
                style: fontDMMedium.copyWith(
                  fontSize: 16,
                  color: BaseColors.white,
                ),
              ),
              const SizedBox(height: defaultPadding / 2,),
              BaseDropDownFormField(
                  items: controller.merchantList,
                  fillColor: const Color(0xFF282F54).withOpacity(0.6),
                  dropDownColor: const Color(0xFF282F54),
                  onChanged: (value) {
                    controller.selectedMerchant = value?.value;
                  },
                  // prefixIcon: Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: defaultPadding,
                  //       top: defaultPadding / 2,
                  //       bottom: defaultPadding / 2),
                  //   child: Image.asset(
                  //     'assets/images/home/recharge_icon.png',
                  //     width: 20,
                  //     height: 20,
                  //   ),
                  // ),
                  name: 'paymentMethodType',
                  style: fontDMMedium.copyWith(color: BaseColors.white),
                  hintText: 'TRC20',
                  menuMaxHeight: 250)
            ],
          ),
        ),
      )),
    );
  }
}
