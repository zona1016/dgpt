import 'package:dgpt/screens/tutorial/widget/tutorial_item_widget.dart';
import 'package:dgpt/screens/tutorial/tutorials_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
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
        title: 'Tutorials',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ListView.separated(
          itemCount: 7,
          itemBuilder: (_, index) {
            return const TutorialItemWidget();
          },
          separatorBuilder: (_, index) {
            return Container(
              height: defaultPadding / 2,
            );
          },
        ),
      ),
    );
  }
}
