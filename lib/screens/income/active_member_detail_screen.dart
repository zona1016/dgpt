import 'package:dgpt/models/pulse/layer_hashrate_info.dart';
import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/screens/income/active_member_detail_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveMemberDetailScreenArgs {
  final MemberList memberList;

  ActiveMemberDetailScreenArgs({required this.memberList});
}

class ActiveMemberDetailScreen
    extends GetView<ActiveMemberDetailScreenController> {
  const ActiveMemberDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('member.member_detail'),
        color: BaseColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              _header(),
              const SizedBox(
                height: defaultPadding,
              ),
              _threeTotal(context, onTap: (index) {}),
              _secondTotal(context, onTap: (index) {}),
              Obx(() => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.planDetailList.length,
                    itemBuilder: (_, index) {
                      return _item(index);
                    },
                    separatorBuilder: (_, index) {
                      return Container(
                        height: defaultPadding,
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: BoxDecoration(
        gradient: BaseColors.incomeLinearGradient,
        borderRadius: BorderRadius.circular(15), // 圆角
      ),
      child: Obx(() => Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/custom/profile_icon_bg.png'),
                          fit: BoxFit.cover),
                    ),
                    child: ClipOval(
                      // 裁剪成圆形
                      child: BaseNetworkImage(
                        imageURL:
                            controller.memberList.value?.user?.avatar ?? '',
                        placeholder:
                            "assets/images/placeholder/profile_placeholder.png",
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: defaultPadding * 2,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: SizeUtil.width() / 3.5,
                              child: Text(
                                controller.memberList.value?.user?.account ??
                                    '',
                                style: fontDMBold.copyWith(
                                  color: BaseColors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              width: 60,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding / 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: BaseColors.secondPrimaryColor,
                                      width: 1)),
                              child: Center(
                                child: Text(
                                  controller
                                          .memberList.value?.powerInfo?.name ??
                                      '',
                                  style: fontDMMedium.copyWith(
                                    color: BaseColors.secondPrimaryColor,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'UID: ${controller.memberList.value?.user?.id}',
                                style: fontDMRegular.copyWith(
                                  color: BaseColors.weakTextColor,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              height: 16,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding / 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: BaseColors.primaryColor),
                              child: Center(
                                child: Text(
                                  tr('income.valid'),
                                  style: fontDMMedium.copyWith(
                                    color: BaseColors.white,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          tr('income.registration_time'),
                          style: fontDMRegular.copyWith(
                            color: BaseColors.weakTextColor,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '${controller.memberList.value?.user?.createTime}',
                          style: fontDMRegular.copyWith(
                            color: BaseColors.weakTextColor,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/income/phone.png',
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(
                    width: defaultPadding,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr('member.email'),
                          style: fontDMRegular.copyWith(
                            color: BaseColors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: defaultPadding / 5,
                        ),
                        Text(
                          controller.memberList.value?.user?.email ?? '',
                          style: fontDMBold.copyWith(
                            color: BaseColors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/income/profile.png',
                    width: 25,
                    height: 22,
                  ),
                  const SizedBox(
                    width: defaultPadding,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr('member.superior'),
                          style: fontDMRegular.copyWith(
                            color: BaseColors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: defaultPadding / 5,
                        ),
                        Text(
                          controller.reUserInfo.value?.referenceUser?.account ??
                              '',
                          style: fontDMBold.copyWith(
                            color: BaseColors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
            ],
          )),
    );
  }

  _threeTotal(context, {required Function(int index) onTap}) {
    return Obx(() => IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                  child: _buildInfoCard(
                context: context,
                imagePath: 'assets/images/income/mxssy.png',
                title: tr('member.total_rent'),
                value: controller.reUserInfo.value?.totalRent ?? 0,
                onTap: () => onTap(0),
              )),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                  child: _buildInfoCard(
                context: context,
                imagePath: 'assets/images/income/team_djhy.png',
                title: tr('member.total_member'),
                value: controller.reUserInfo.value?.totalMember ?? 0,
                onTap: () => onTap(1),
              )),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                  child: _buildInfoCard(
                context: context,
                imagePath: 'assets/images/income/team_jrsy.png',
                title: tr('member.total_profit'),
                value: controller.reUserInfo.value?.totalProfit ?? 0,
                onTap: () => onTap(2),
              )),
            ],
          ),
        ));
  }

  Widget _buildInfoCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required int value,
    required Function() onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: BaseColors.memberDetailGradient,
          color: Colors.white.withOpacity(0.4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: 25,
            height: 25,
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            title,
            style: fontDMMedium.copyWith(
              fontSize: 14,
              color: BaseColors.white,
            ),
          ),
          const SizedBox(height: defaultPadding / 4),
          GestureDetector(
            onTap: onTap,
            child: Text(
              value.toString(),
              style: fontDMBold.copyWith(
                fontSize: 18,
                color: BaseColors.fourPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  _secondTotal(context, {required Function(int index) onTap}) {
    return Obx(() => IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Row(
              children: [
                Expanded(
                    child: _buildSecondInfoCard(
                  context: context,
                  imagePath: 'assets/images/income/total_sub.png',
                  title: tr('member.total_subscription'),
                  value:
                      '${controller.reUserInfo.value?.totalSubscription ?? 0} USDT',
                  onTap: () => onTap(0),
                )),
                const SizedBox(
                  width: defaultPadding,
                ),
                Expanded(
                    child: _buildSecondInfoCard(
                  context: context,
                  imagePath: 'assets/images/income/total_rev.png',
                  title: tr('member.total_revenue'),
                  value:
                      '${controller.reUserInfo.value?.totalRevenue ?? 0} USDT',
                  onTap: () => onTap(0),
                )),
              ],
            ),
          ),
        ));
  }

  Widget _buildSecondInfoCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String value,
    required Function() onTap,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding * 1.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: BaseColors.memberDetailGradient,
          color: Colors.white.withOpacity(0.4)),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 25,
            height: 25,
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: fontDMRegular.copyWith(
                    color: BaseColors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: defaultPadding / 5,
                ),
                Text(
                  value,
                  style: fontDMBold.copyWith(
                    color: BaseColors.fourPrimaryColor,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _item(index) {
    PlanDetail planDetail = controller.planDetailList[index];
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF395C96).withOpacity(0.3)),
      child: Column(
        children: [
          _rowTitle(title: tr('member.type'), detail: planDetail.name),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          _rowTitle(
              title: tr('member.purchasing_price'),
              detail: '${planDetail.amount} USDT',
              detailColor: Colors.purpleAccent),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          _rowTitle(
              title: tr('member.purchasing_time'),
              detail: planDetail.beginDate),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          _rowTitle(
              title: tr('member.expire_date'), detail: planDetail.realEndDate),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          _rowTitle(
              title: tr('member.status'),
              detail: tr('member.running'),
              status: planDetail.status == 1 ? true : false),
        ],
      ),
    );
  }

  _rowTitle(
      {required String title,
      required String detail,
      Color detailColor = BaseColors.white,
      bool status = false,
      Color statusColor = BaseColors.primaryColor}) {
    return Row(
      children: [
        Text(
          title,
          style: fontDMRegular.copyWith(
            color: BaseColors.weakTextColor,
            fontSize: 12,
          ),
          textAlign: TextAlign.left,
        ),
        Expanded(child: Container()),
        if (status)
          Container(
            height: 20,
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: status ? BaseColors.secondPrimaryColor.withOpacity(0.1) : Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: status ? BaseColors.primaryColor : Colors.red, width: 1)),
            child: Center(
              child: Text(
                detail,
                style: fontDMMedium.copyWith(
                  color: status ? BaseColors.secondPrimaryColor : Colors.red,
                  fontSize: 8,
                ),
              ),
            ),
          ),
        if (!status)
          Text(
            detail,
            style: fontDMBold.copyWith(
              color: detailColor,
              fontSize: 12,
            ),
            textAlign: TextAlign.right,
          )
      ],
    );
  }
}
