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
    Get.lazyPut(() => TutorialDetailScreenController(), fenix: false);
  }
}

class TutorialDetailScreenController extends BaseController {
  final AuthService authService = Get.find();
  VideoPlayerController? playerController;
  ChewieController? chewieController;

  // 使用 Rx 变量来管理播放状态
  RxBool isPlaying = false.obs;
  Rx<Duration> currentPosition = Duration.zero.obs;
  Rx<Duration> totalDuration = Duration.zero.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeVideoController(
        'https://vd3.bdstatic.com/mda-rap2xhpvu54u25jn/576p/h264/1737684244005612350/mda-rap2xhpvu54u25jn.mp4');
  }

  @override
  void dispose() {
    playerController?.removeListener(_videoListener); // 移除监听器
    playerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  Future<void> _initializeVideoController(String url) async {
    playerController = VideoPlayerController.networkUrl(Uri.parse(url));
    await playerController!.initialize();

    // 添加监听器
    playerController!.addListener(_videoListener);

    chewieController = ChewieController(
      videoPlayerController: playerController!,
      autoPlay: false,
      looping: false,
      aspectRatio: playerController!.value.aspectRatio,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      deviceOrientationsOnEnterFullScreen: [DeviceOrientation.portraitUp],
      allowFullScreen: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: BaseColors.primaryColor,
        bufferedColor: BaseColors.primaryColor.withOpacity(0.1),
      ),
      showControlsOnInitialize: false,
      showOptions: false,
      customControls: _buildCustomControls()
    );

    // 初始化总时长
    totalDuration.value = playerController!.value.duration;
    update();
  }

  // 监听视频状态变化
  void _videoListener() {
    if (playerController != null) {
      isPlaying.value = playerController!.value.isPlaying;
      currentPosition.value = playerController!.value.position;
      totalDuration.value = playerController!.value.duration;
    }
  }

  // 自定义控件
  Widget _buildCustomControls() {
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
              value: currentPosition.value.inMilliseconds.toDouble(),
              min: 0.0,
              max: totalDuration.value.inMilliseconds.toDouble(),
              onChanged: (value) {
                // 当滑动进度条时，更新视频播放进度
                playerController!.seekTo(Duration(milliseconds: value.toInt()));
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
                // 切换播放/暂停状态
                if (playerController!.value.isPlaying) {
                  playerController!.pause();
                } else {
                  playerController!.play();
                }
              },
              child: Visibility(
                visible: !isPlaying.value,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    isPlaying.value ? Icons.pause : Icons.play_arrow,
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