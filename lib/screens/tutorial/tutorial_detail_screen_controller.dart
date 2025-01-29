import 'package:chewie/chewie.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class TutorialDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => TutorialDetailScreenController(),
        permanent: false, fenix: false);
  }
}

class TutorialDetailScreenController extends BaseController {
  final AuthService authService = Get.find();
  VideoPlayerController? playerController;
  ChewieController? chewieController;

  RxBool isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeVideoController(
        'https://vd3.bdstatic.com/mda-rap2xhpvu54u25jn/576p/h264/1737684244005612350/mda-rap2xhpvu54u25jn.mp4');
  }

  @override
  void dispose() {
    playerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future<void> _initializeVideoController(String url) async {
    final videoPlayerController =
    VideoPlayerController.networkUrl(Uri.parse(url));
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      aspectRatio: videoPlayerController.value.aspectRatio,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      deviceOrientationsOnEnterFullScreen: [DeviceOrientation.portraitUp],
      allowFullScreen: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: BaseColors.primaryColor,
        bufferedColor: BaseColors.primaryColor.withOpacity(0.1),
      ),
      showControlsOnInitialize: false,
      showOptions: false,
    );
    update();
  }

  Widget _buildCustomControls(VideoPlayerController videoPlayerController) {
    return Obx(() => Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // 进度条
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Slider(
              value: videoPlayerController.value.position.inMilliseconds.toDouble(),
              min: 0.0,
              max: videoPlayerController.value.duration.inMilliseconds.toDouble(),
              onChanged: (value) {
                // 当滑动进度条时，更新视频播放进度
                videoPlayerController.seekTo(Duration(milliseconds: value.toInt()));
              },
            ),
          ),
          // 播放/暂停按钮
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                // 你可以在这里添加自定义控制逻辑，比如播放/暂停等
                if (videoPlayerController.value.isPlaying) {
                  videoPlayerController.pause();
                } else {
                  videoPlayerController.play();
                }
                isPlaying.value = videoPlayerController.value.isPlaying;
                update();
              },
              child: Visibility(
                visible: !isPlaying.value,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    isPlaying.value
                        ? Icons.edit
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

}
