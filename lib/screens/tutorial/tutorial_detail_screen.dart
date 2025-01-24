import 'package:chewie/chewie.dart';
import 'package:dgpt/screens/tutorial/tutorial_detail_screen_controller.dart';
import 'package:dgpt/screens/tutorial/widget/tutorial_item_widget.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class TutorialDetailScreen extends GetView<TutorialDetailScreenController> {
  const TutorialDetailScreen({super.key});

  @override
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
      body: GetBuilder<TutorialDetailScreenController>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/tab/home_inactive.png'),
                                fit: BoxFit.cover)),
                        child: Text(
                          'Basic Tutorial',
                          style: fontSFProMedium.copyWith(
                            fontSize: 14,
                            color: BaseColors.white,
                          ),
                        ),
                      ),
                      if (true)
                        Container(
                          width: double.infinity,
                            padding: const EdgeInsets.only(top: defaultPadding),
                            child: controller.chewieController != null
                                ? AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Chewie(controller: controller.chewieController!),
                                )
                                : const Center(
                                    child: CircularProgressIndicator())),
                      if (true)
                        Padding(
                          padding: const EdgeInsets.only(top: defaultPadding),
                          child: Text(
                            'Basic Tutorial' * 12,
                            style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.white,
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                    ],
                  ),
                ),
                SliverList.separated(
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 20,
                      color: Colors.red,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Container(height: defaultPadding,);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
