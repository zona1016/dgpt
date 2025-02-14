import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_button.dart';
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
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: BaseColors.white.withOpacity(0.2)),
      child: Column(
        children: [
          const SizedBox(
            height: defaultPadding / 2,
          ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultPadding),
                    color: BaseColors.primaryColor),
                child: Center(
                  child: Text(
                    '运行中',
                    style: fontSFProMedium.copyWith(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
                width: 80,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BaseNetworkImage(
                    imageURL: '',
                    placeholder: 'assets/images/home/income_icon.png',
                  ),
                ),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '加速器I',
                      style: fontDMBold.copyWith(
                        fontSize: 12,
                        color: BaseColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding / 4,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '每日训练时长',
                              style: fontDMRegular.copyWith(
                                fontSize: 10,
                                color: BaseColors.white,
                              ),
                            ),
                            const SizedBox(
                              height: defaultPadding / 4,
                            ),
                            Text(
                              '期限',
                              style: fontDMRegular.copyWith(
                                fontSize: 10,
                                color: BaseColors.white,
                              ),
                            ),
                            const SizedBox(
                              height: defaultPadding / 4,
                            ),
                            Text(
                              '总产量',
                              style: fontDMRegular.copyWith(
                                fontSize: 10,
                                color: BaseColors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2H',
                              style: fontDMRegular.copyWith(
                                fontSize: 10,
                                color: BaseColors.white,
                              ),
                            ),
                            const SizedBox(
                              height: defaultPadding / 4,
                            ),
                            Text(
                              '60天',
                              style: fontDMRegular.copyWith(
                                fontSize: 10,
                                color: BaseColors.white,
                              ),
                            ),
                            const SizedBox(
                              height: defaultPadding / 4,
                            ),
                            Text(
                              'U830',
                              style: fontDMRegular.copyWith(
                                fontSize: 10,
                                color: BaseColors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Center(
                      child: Text(
                        '进行中...',
                        style: fontDMBold.copyWith(
                          fontSize: 12,
                          color: const Color(0xFF81E5FF),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Image.asset(
                      'assets/images/home/order_progress.png'
                    ),
                    Center(
                      child: Text(
                        '已失效...',
                        style: fontDMBold.copyWith(
                          fontSize: 12,
                          color: const Color(0xFF81E5FF),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Image.asset(
                        'assets/images/home/order_progress_fail.png'
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Container(
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                              width: 1, color: BaseColors.secondPrimaryColor)),
                      child: Center(
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(
                              '实际需交付',
                              style: fontDMRegular.copyWith(
                                fontSize: 10,
                                color: BaseColors.white,
                              ),
                            ),
                            const SizedBox(
                              width: defaultPadding / 4,
                            ),
                            Text(
                              'U100.00',
                              style: fontDMRegular.copyWith(
                                fontSize: 10,
                                color: BaseColors.secondPrimaryColor,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          height: 24,
                          width: 52,
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(defaultPadding),
                              color: BaseColors.primaryColor),
                          child: Center(
                            child: Text(
                              '详情',
                              style: fontDMBold.copyWith(
                                fontSize: 12,
                                color: BaseColors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
