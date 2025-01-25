import 'package:dgpt/screens/home/analyze_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyzeScreen extends GetView<AnalyzeScreenController> {
  const AnalyzeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
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
      ),
      body: GetBuilder<AnalyzeScreenController>(
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
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
                ),
                Text(
                  'Connect to Computing Center',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Center(
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
                                    border: Border.all(
                                      width: 20,
                                      color: Colors.red
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.green.withOpacity(controller.rippleOpacities[index]),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                      // Central Icon
                      Icon(
                        Icons.flash_on,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



