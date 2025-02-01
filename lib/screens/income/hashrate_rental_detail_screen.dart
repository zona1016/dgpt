import 'package:dgpt/screens/income/hashrate_rental_detail_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HashrateRentalDetailScreen extends GetView<HashrateRentalDetailScreenController> {
  const HashrateRentalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.incomeBackgroundImage,
      appBar: const BaseAppBar(
        title: '产品详情',
        color: BaseColors.white,
      ),
      body: Container(
        margin: const EdgeInsets.all(defaultPadding),
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
            border: Border.all(
                color: BaseColors.primaryColor,
                width: 1
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: defaultPadding / 2,),
              _buildHardwareInfo(),
              // SizedBox(height: 16),
              //
              // // 奖励和租借信息部分
              // _buildRewardsAndRentalInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Image.asset(
          'assets/images/home/income_icon.png',
          width: 120,
          height: 128,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: defaultPadding / 2,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'GDEPIN30',
                    style: fontDMBold.copyWith(
                      color: BaseColors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: defaultPadding / 4,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultPadding),
                        border: Border.all(
                            color: BaseColors.secondPrimaryColor,
                            width: 1
                        ),
                        color: BaseColors.secondPrimaryColor.withOpacity(0.1)
                    ),
                    child: Text(
                      'HIGH SPEED',
                      style: fontDMBold.copyWith(
                        color: BaseColors.secondPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'RTX4090',
                style: fontDMMedium.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                '4062 Mbps',
                style: fontDMRegular.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                '4610 Mbps 99 ports',
                style: fontDMRegular.copyWith(
                  color: BaseColors.white,
                  fontSize: 12,
                ),
              ),
              Container(
                height: 1,
                color: BaseColors.weakTextColor,
              ),
              Row(
                children: [
                  Text(
                    '81.4 FLOPS\n24GB',
                    style: fontDMRegular.copyWith(
                      color: BaseColors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: defaultPadding / 5,),
                  Text(
                    'Max CUDA : 12.4\n876.5 GB/s',
                    style: fontDMRegular.copyWith(
                      color: BaseColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildHardwareInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '进行中',
          style: fontDMMedium.copyWith(
            color: BaseColors.white,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: defaultPadding / 4,),
        Container(
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: BaseColors.whiteGray3.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                width:(Get.size.width - defaultPadding * 4) * .2,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF05CCFF), // 0% 的颜色
                      Color(0xFF08C8FF), // 2% 的颜色
                      Color(0xFF4F7FFF), // 37% 的颜色
                      Color(0xFF834AFF), // 66% 的颜色
                      Color(0xFFA32AFF), // 88% 的颜色
                      Color(0xFFB01EFF), // 100% 的颜色
                    ],
                    stops: [0.0, 0.02, 0.37, 0.66, 0.88, 1.0], // 颜色停止点
                    begin: Alignment.centerLeft, // 渐变起点
                    end: Alignment.centerRight, // 渐变终点
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding / 2,),
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFFFFF).withOpacity(0.4), // 0% 的颜色
                Color(0xFFD8E4F1).withOpacity(0.4), // 6% 的颜色
                Color(0xFFB6CEE5).withOpacity(0.4), // 13% 的颜色
                Color(0xFF9DBDDC).withOpacity(0.4), // 19% 的颜色
                Color(0xFF8FB3D7).withOpacity(0.4), // 25% 的颜色
                Color(0xFF8AB0D6).withOpacity(0.4), // 29% 的颜色
                Color(0xFF5E6EA9).withOpacity(0.4), // 65% 的颜色
                Color(0xFF8E6CA3).withOpacity(0.4), // 80% 的颜色
                Color(0xFFD16B9B).withOpacity(0.4), // 99% 的颜色
              ],
              stops: [0.0, 0.06, 0.13, 0.19, 0.25, 0.29, 0.65, 0.80, 0.99], // 颜色停止点
              begin: Alignment.centerLeft, // 渐变起点
              end: Alignment.centerRight, // 渐变终点
            ),
            borderRadius: BorderRadius.circular(10), // 圆角
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/home/income_detail_icon.png',
                height: 46,
                width: 100,
              ),
              const SizedBox(width: defaultPadding / 2,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AMD EPYC 7702 ',
                    style: fontDMBold.copyWith(
                      color: BaseColors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '64-Core Processor ',
                    style: fontDMBold.copyWith(
                      color: BaseColors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '21.3/256 cpu    43/516 GB',
                    style: fontDMRegular.copyWith(
                      color: BaseColors.white,
                      fontSize: 10,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: defaultPadding / 2,),
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFFFFF).withOpacity(0.4), // 0% 的颜色
                Color(0xFFD8E4F1).withOpacity(0.4), // 6% 的颜色
                Color(0xFFB6CEE5).withOpacity(0.4), // 13% 的颜色
                Color(0xFF9DBDDC).withOpacity(0.4), // 19% 的颜色
                Color(0xFF8FB3D7).withOpacity(0.4), // 25% 的颜色
                Color(0xFF8AB0D6).withOpacity(0.4), // 29% 的颜色
                Color(0xFF5E6EA9).withOpacity(0.4), // 65% 的颜色
                Color(0xFF8E6CA3).withOpacity(0.4), // 80% 的颜色
                Color(0xFFD16B9B).withOpacity(0.4), // 99% 的颜色
              ],
              stops: [0.0, 0.06, 0.13, 0.19, 0.25, 0.29, 0.65, 0.80, 0.99], // 颜色停止点
              begin: Alignment.centerLeft, // 渐变起点
              end: Alignment.centerRight, // 渐变终点
            ),
            borderRadius: BorderRadius.circular(10), // 圆角
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Corsair MP600',
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'PRO XT',
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '2897MB/s 421.5GB',
                      style: fontDMRegular.copyWith(
                        color: BaseColors.white,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 46,
                color: BaseColors.white,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ROME2D32GM-2T ',
                      style: fontDMBold.copyWith(
                        color: BaseColors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'PCIE 4.0,8x 123GB/s',
                      style: fontDMRegular.copyWith(
                        color: BaseColors.white,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        Center(
          child: Text(
            'Available Rewards',
            style: fontDMRegular.copyWith(
              color: BaseColors.thirdPrimaryColor,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.greenAccent, Colors.green],
            ),
            borderRadius: BorderRadius.circular(defaultPadding),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/home/income_qb.png',
                width: 25,
                height: 25,
              ),
              const SizedBox(width: defaultPadding / 2,),
              Text(
                '4,323.49 \$',
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 20),
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            Expanded(
              child: Text(
                'Contract Date',
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                '24.01.2025',
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding / 4),
        Row(
          children: [
            Expanded(
              child: Text(
                'Rental Deposit',
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                '\$100',
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding / 4),
        Row(
          children: [
            Expanded(
              child: Text(
                'Rental Profit',
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                '\$630',
                style: fontDMBold.copyWith(
                    color: BaseColors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 构建奖励和租借信息部分
  Widget _buildRewardsAndRentalInfo() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Rewards',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '4,323.49\$',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              'Contract Date',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '24.01.2025',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Rental Deposit',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '\$100',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Rental Profit',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '\$630',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // 构建信息行
  Widget _buildInfoRow(String leftText, String rightText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            rightText,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
