import 'package:dgpt/screens/hashrate/hashrate_loading_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HashrateLoadingScreen extends GetView<HashrateLoadingScreenController> {
  const HashrateLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: 'assets/images/custom/hashrate_loading_bg.png',
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            const Spacer(flex: 4,),
            Center(
              child: Text(
                '正在链接算力中心',
                style: fontDMBold.copyWith(
                  fontSize: 24,
                  color: BaseColors.white
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 2,),
            Center(
              child: Text(
                '请稍等...',
                style: fontDMRegular.copyWith(
                    fontSize: 20,
                    color: BaseColors.white
                ),
              ),
            ),
            const Spacer(flex: 3,),
            Obx(() => Container(
              width: 95,
              height: 95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(95),
                  color: BaseColors.white
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: Image.asset(
                  controller.images[controller.currentIndex.value],
                  key: ValueKey<int>(controller.currentIndex.value),
                  width: 64,
                  height: 64,
                ),
              ),
            )),
            const Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }

  BaseAppBar _buildAppBar() {
    return BaseAppBar(
      title: '算力租借进行中',
      color: Colors.white,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(color: Colors.transparent,),
      ),
    );
  }
}
