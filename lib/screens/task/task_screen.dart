import 'package:dgpt/screens/task/task_screen_controller.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskScreen extends GetView<TaskScreenController> {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseScreen(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text(
                      'My Power',
                    ),
                    Spacer(),
                    Icon(Icons.add),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
