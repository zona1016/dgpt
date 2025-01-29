import 'package:dgpt/screens/tutorial/widget/gradient_circular_progress.dart';
import 'package:dgpt/screens/tutorial/widget/tutorial_item_widget.dart';
import 'package:dgpt/screens/tutorial/tutorials_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorialsScreen extends GetView<TutorialsScreenController> {
  const TutorialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: '教程中心',
        color: BaseColors.white,
        backgroundColor: Colors.purple,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.purple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
        child: ListView.separated(
          itemCount: controller.courses.length,
          itemBuilder: (context, index) {
            final course = controller.courses[index];
            return InkWell(
              onTap: () => Get.toNamed(AppRoutes.tutorialDetail),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A3D),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course["title"],
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "时长：${course["duration"]}",
                            style: const TextStyle(color: Colors.white54, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                                color: course["color"].withOpacity(0.1),
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: course["color"],
                                    width: 1
                                )
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  course["tag"],
                                  style: TextStyle(color: course["color"], fontSize: 14),
                                ),
                                const SizedBox(width: 8),
                                Icon(Icons.star, color: course["color"], size: 14),
                                Icon(Icons.star, color: course["color"], size: 14),
                                Icon(Icons.star, color: course["color"], size: 14),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GradientCircularProgress(
                      progress: course["progress"].toDouble(),
                      gradientColors: [Colors.blue, Colors.purple],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(height: defaultPadding / 2,);
          },
        ),
      ),
    );
  }
}
