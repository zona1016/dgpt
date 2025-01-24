import 'package:chewie/chewie.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/theme/color.dart';
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
}
