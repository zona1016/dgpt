import 'package:dgpt/screens/task/task_history_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_dropdown_checkbox_form_field.dart';
import 'package:dgpt/widget/form/base_dropdown_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TaskHistoryType { task, taskCenter }

class TaskHistoryScreenArgs {
  final TaskHistoryType historyType;

  TaskHistoryScreenArgs({required this.historyType});
}

class TaskHistoryScreen extends GetView<TaskHistoryScreenController> {
  const TaskHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: 'History',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Data overview',
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 44,
                    child: BaseDropDownFormField(
                        items: controller.historyTypes,
                        radius: 10,
                        name: 'historyTypes',
                        hintText: '  ALL >  ',
                        menuMaxHeight: 250),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Container(
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: BaseColors.black),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return (index == 0)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // 用于在水平方向上对齐元素
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // 垂直对齐元素
                            children: [
                              Expanded(
                                child: Text(
                                  'Category',
                                  style: fontSFProMedium.copyWith(
                                    fontSize: 14,
                                    color: BaseColors.white,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const SizedBox(width: defaultPadding,),
                              Expanded(
                                child: Text(
                                  'Amount',
                                  style: fontSFProMedium.copyWith(
                                    fontSize: 14,
                                    color: BaseColors.primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(width: defaultPadding,),
                              Expanded(
                                child: Text(
                                  'Time',
                                  style: fontSFProMedium.copyWith(
                                    fontSize: 14,
                                    color: BaseColors.primaryColor,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          )
                        : SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // 用于在水平方向上对齐元素
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // 垂直对齐元素
                              children: [
                                Expanded(
                                  child: Text(
                                    '$index',
                                    style: fontSFProMedium.copyWith(
                                      fontSize: 14,
                                      color: BaseColors.white,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const SizedBox(width: defaultPadding,),
                                Expanded(
                                  child: Text(
                                    'Amount',
                                    style: fontSFProMedium.copyWith(
                                      fontSize: 14,
                                      color: BaseColors.primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: defaultPadding,),
                                Expanded(
                                  child: Text(
                                    '2025-01-20 20:36:29',
                                    style: fontSFProMedium.copyWith(
                                      fontSize: 14,
                                      color: BaseColors.primaryColor,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                  separatorBuilder: (_, index) {
                    return (index == 0)
                        ? Container()
                        : Container(
                            height: 0.5,
                            color: BaseColors.black,
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
