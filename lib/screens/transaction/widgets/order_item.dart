import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_buy_detail_screen.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderItem extends StatefulWidget {
  final PlanDetail planDetail;

  const OrderItem({super.key, required this.planDetail});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Row(
            children: [
              Text(
                widget.planDetail.planId.toString(),
                style: fontSFProMedium.copyWith(
                  fontSize: 16,
                  color: BaseColors.white,
                ),
              ),
              Expanded(child: Container()),
              if (widget.planDetail.status == 1)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2,
                      vertical: defaultPadding / 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: BaseColors.secondPrimaryColor.withOpacity(0.1),
                      border:
                          Border.all(width: 2, color: BaseColors.primaryColor)),
                  child: Center(
                    child: Text(
                      '运作中',
                      style: fontSFProMedium.copyWith(
                        fontSize: 10,
                        color: BaseColors.secondPrimaryColor,
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
              SizedBox(
                height: 90,
                width: 80,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BaseNetworkImage(
                    imageURL: widget.planDetail.logoFileIdUrl,
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
                      widget.planDetail.name,
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
                        Expanded(
                          child: Text(
                            '下单日期',
                            style: fontDMRegular.copyWith(
                              fontSize: 10,
                              color: BaseColors.weakTextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            formatDateString(widget.planDetail.beginDate),
                            style: fontDMRegular.copyWith(
                              fontSize: 10,
                              color: BaseColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '租赁金额',
                            style: fontDMRegular.copyWith(
                              fontSize: 10,
                              color: BaseColors.weakTextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'U ${widget.planDetail.amount}',
                            style: fontDMRegular.copyWith(
                              fontSize: 10,
                              color: BaseColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '租赁收益',
                            style: fontDMRegular.copyWith(
                              fontSize: 10,
                              color: BaseColors.weakTextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'U ${widget.planDetail.roiTotal}',
                            style: fontDMRegular.copyWith(
                              fontSize: 10,
                              color: BaseColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Center(
                      child: Text(
                        widget.planDetail.status == 1 ? '进行中' : '已失效',
                        style: fontDMBold.copyWith(
                          fontSize: 12,
                          color: widget.planDetail.status == 1 ? const Color(0xFF81E5FF) : Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Container(
                      height: 25,
                      // width: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                            'assets/images/transaction/icon_bg${widget.planDetail.status == 1 ? '' : '1'}.png'),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(13, (index) {
                          return Image.asset(
                            'assets/images/transaction/icon${widget.planDetail.status == 2 ? '2' : index < progress() ? '1' : '2'}.png',
                            height: 13,
                            width: 16,
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    if (widget.planDetail.status == 1)
                      Row(
                        children: [
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.hashrateRentalBuyDetail,
                                  arguments: HashrateRentalBuyDetailScreenArgs(
                                      planDetail: widget.planDetail));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding,
                                  vertical: defaultPadding / 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: BaseColors.primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  '详情',
                                  style: fontSFProMedium.copyWith(
                                    fontSize: 12,
                                    color: BaseColors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    if (widget.planDetail.status == 1)
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

  int progress() {
    DateTime sysDate = DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse(widget.planDetail.sysNowTime ?? '');
    DateTime beginDateObj = DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse(widget.planDetail.beginDate ?? '');
    int continueDay = sysDate.difference(beginDateObj).inDays;
    return ((continueDay / widget.planDetail.cycle) * 13).toInt();
  }

  String formatDateString(String dateString) {
    // 解析字符串为 DateTime
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);

    // 格式化为 "dd.MM.yyyy"
    return DateFormat("dd.MM.yyyy").format(dateTime);
  }
}
