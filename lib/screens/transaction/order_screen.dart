import 'package:dgpt/screens/transaction/order_screen_controller.dart';
import 'package:dgpt/screens/transaction/widgets/order_item.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends GetView<OrderScreenController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: const BaseAppBar(
        title: '我的订单',
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: ListView.separated(
          itemCount: 0,
          itemBuilder: (_, index) {
            return const OrderItem();
          },
          separatorBuilder: (_, index) {
            return const SizedBox(height: defaultPadding,);
          },
        ),
      ),
    );
  }

}
