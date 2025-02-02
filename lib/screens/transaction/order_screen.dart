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
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: 'My Orders',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ListView.separated(
          itemCount: 10,
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
