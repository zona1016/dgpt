import 'package:dgpt/screens/transaction/order_detail_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailScreen extends GetView<OrderDetailScreenController> {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: 'Order details',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: BaseColors.black
              ),
              child: Row(
                children: [
                  const SizedBox(
                    height: 80,
                    width: 80,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: BaseNetworkImage(
                        imageURL: '',
                      ),
                    ),
                  ),
                  const SizedBox(width: defaultPadding,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Accelerator Ⅰ',
                        style: fontSFProMedium.copyWith(
                          fontSize: 14,
                          color: BaseColors.white,
                        ),
                      ),
                      Text(
                        'Daily training hours：2 H',
                        style: fontSFProMedium.copyWith(
                          fontSize: 14,
                          color: BaseColors.white,
                        ),
                      ),
                      Text(
                        'Deadlines：60Days',
                        style: fontSFProMedium.copyWith(
                          fontSize: 14,
                          color: BaseColors.white,
                        ),
                      ),
                      Text(
                        'Total yield：104%',
                        style: fontSFProMedium.copyWith(
                          fontSize: 14,
                          color: BaseColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: BaseColors.black
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.itemList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.itemList[index],
                            style: fontSFProMedium.copyWith(
                              fontSize: 16,
                              color: BaseColors.white,
                            ),
                          ),
                        ),
                        Text(
                          "Actual to be ",
                          style: fontSFProMedium.copyWith(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return Container(height: 1, color: Colors.black,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
