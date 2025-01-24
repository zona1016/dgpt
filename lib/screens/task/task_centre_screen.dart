import 'package:dgpt/screens/task/task_centre_screen_controller.dart';
import 'package:dgpt/screens/task/task_history_screen.dart';
import 'package:dgpt/screens/task/widgets/task_item_widget.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskCentreScreen extends GetView<TaskCentreScreenController> {
  const TaskCentreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: 'Task Center',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () =>
                Get.toNamed(AppRoutes.taskHistory,
                arguments: TaskHistoryScreenArgs(historyType: TaskHistoryType.taskCenter)),
            child: Image.asset(
              'assets/images/tab/home_inactive.png',
              width: 25,
              height: 25,
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: 7,
        itemBuilder: (_, index) {
          return const TaskItemWidget();
        },
        separatorBuilder: (_, index) {
          return Container(
            height: defaultPadding / 2,
          );
        },
      ),
    );
  }
}
