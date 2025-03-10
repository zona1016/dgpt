import 'package:dgpt/screens/transaction/order_screen_controller.dart';
import 'package:dgpt/screens/transaction/widgets/order_item.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends GetView<OrderScreenController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.my_orders'),
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: ListView.separated(
          itemCount: controller.hasratePageList.length,
          itemBuilder: (_, index) {
            return OrderItem(planDetail: controller.hasratePageList[index],);
          },
          separatorBuilder: (_, index) {
            return const SizedBox(height: defaultPadding,);
          },
        ),
      )),
    );
  }
}
