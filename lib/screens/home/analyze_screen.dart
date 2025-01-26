import 'package:dgpt/screens/home/analyze_screen_controller.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyzeScreen extends GetView<AnalyzeScreenController> {
  const AnalyzeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: GetBuilder<AnalyzeScreenController>(
        builder: (_) {
          return SingleChildScrollView(
            child: _powerCenter(),
          );
        },
      ),
    );
  }

  BaseAppBar _buildAppBar() {
    return BaseAppBar(
      color: BaseColors.white,
      backgroundColor: Colors.black,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Row(
          children: [
            const Icon(Icons.chevron_left),
            const SizedBox(width: defaultPadding / 4),
            Text(
              'Back',
              style: fontSFProMedium.copyWith(
                fontSize: 12,
                color: BaseColors.white,
              ),
            ),
          ],
        ),
      ),
      title: '',
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.greenAccent, size: 35),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }

  Widget _line() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildCloudIcon(),
        const Text(
          'Connect to Computing Center',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: defaultPadding * 4),
        _buildRippleEffect(),
      ],
    );
  }

  Widget _buildCloudIcon() {
    return const Column(
      children: [
        Icon(
          Icons.cloud,
          size: 50,
          color: Colors.greenAccent,
        ),
        SizedBox(height: 8),
        Text(
          'Parameter Setting Revenue Analysis Center',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRippleEffect() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            children: List.generate(controller.rippleScales.length, (index) {
              return ValueListenableBuilder(
                valueListenable: controller.rippleScales[index],
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: controller.rippleScales[index].value,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(width: 20, color: Colors.red),
                        shape: BoxShape.circle,
                        color: Colors.green.withOpacity(
                          controller.rippleOpacities[index],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          // Central Icon
          const Icon(
            Icons.flash_on,
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
    );
  }

  Widget _lineChatColumn() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCircleAvatar(),
          const SizedBox(height: defaultPadding),
          _buildAISection(),
          const SizedBox(height: defaultPadding * 2),
          const Text(
            'The comprehensive computing power of your device',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: defaultPadding / 2),
          _buildIncomeText(),
          const SizedBox(height: defaultPadding * 2),
          _lineChat(),
          const SizedBox(height: defaultPadding),
          _buildParametersSection(),
          const SizedBox(height: defaultPadding * 2),
          _deployButton(),
        ],
      ),
    );
  }

  Widget _buildCircleAvatar() {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.greenAccent, width: 2),
        ),
        child: Center(
          child: Text(
            '1001',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAISection() {
    return Text(
      'AI score',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }

  Widget _buildIncomeText() {
    return Text(
      'Estimated income: 0.012 USD/Day',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }

  Widget _buildParametersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detailed parameters',
          style: fontSFProMedium.copyWith(
            fontSize: 12,
            color: BaseColors.white,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: defaultPadding / 2),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: BaseColors.black,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text(
                        'Detailed parameters',
                        style: fontSFProMedium.copyWith(
                          fontSize: 12,
                          color: BaseColors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Detailed parameters',
                        style: fontSFProMedium.copyWith(
                          fontSize: 12,
                          color: BaseColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  const Divider(color: Colors.white),
                  if (index == 1) const SizedBox(height: defaultPadding),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _deployButton() {
    return SafeArea(
      child: BaseButton(
        onPressed: () {},
        text: 'Deploy computing power',
      ),
    );
  }

  Widget _powerCenter() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.supervised_user_circle, size: 60),
          const SizedBox(height: defaultPadding),
          _buildSuccessMessage(),
          const SizedBox(height: defaultPadding * 2),
          _buildIncomeInfo(),
          const SizedBox(height: defaultPadding * 2),
          _lineChat(),
          const SizedBox(height: defaultPadding * 2),
          _viewDetailButton(),
        ],
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Text(
      'Computing power deployed successfully',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }

  Widget _buildIncomeInfo() {
    return const Text(
      'Estimated income：0.012USD/Day',
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _viewDetailButton() {
    return SafeArea(
      child: BaseButton(
        onPressed: () {
          Get.back();
          MainScreenController mainScreenController = Get.find();
          mainScreenController.selectedTabIndex(0);
          mainScreenController.pageController.jumpToPage(0);
          mainScreenController.update();
        },
        text: 'View detail',
      ),
    );
  }

  _lineChat() {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(
              show: false,
            ),
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 1),
                  FlSpot(1, 2),
                  FlSpot(2, 0.5),
                  FlSpot(3, 1.5),
                  FlSpot(4, 1),
                ],
                isCurved: true,
                color: Colors.greenAccent,
                // Use the color property
                barWidth: 2,
                belowBarData: BarAreaData(
                    show: true, color: Colors.greenAccent.withOpacity(0.2)),
              ),
            ],
          ),
        ),
      );
  }
}
