import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: BaseColors.black
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '011920365071396',
                style: fontSFProMedium.copyWith(
                  fontSize: 16,
                  color: BaseColors.white,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
                height: 35,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: BaseColors.primaryColor
                ),
                child: Center(
                  child: Text(
                    'Running',
                    style: fontSFProMedium.copyWith(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: defaultPadding,),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: defaultPadding,),
          Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: const AspectRatio(
                  aspectRatio: 1,
                  child: BaseNetworkImage(
                    imageURL: '',
                  ),
                ),
              ),
              const SizedBox(width: defaultPadding / 2,),
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
          const SizedBox(height: defaultPadding,),
          Row(
            children: [
              Expanded(
                child: Text(
                  '2025-01-19 20:36:50',
                  style: fontSFProMedium.copyWith(
                    fontSize: 16,
                    color: BaseColors.white,
                  ),
                ),
              ),
              Text(
                "Actual to be paid：\$100.00",
                style: fontSFProMedium.copyWith(
                  fontSize: 16,
                  color: Colors.red,
                ),
              )
            ],
          ),
          const SizedBox(height: defaultPadding,),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: defaultPadding,),
          Row(
            children: [
              Expanded(
                child: Container()
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.orderDetail);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black
                  ),
                  child: Center(
                    child: Text(
                      'Detail',
                      style: fontSFProMedium.copyWith(
                        fontSize: 16,
                        color: BaseColors.weakTextColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
