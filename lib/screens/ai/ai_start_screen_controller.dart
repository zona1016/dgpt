import 'package:dgpt/models/pulse/ai_chat_message.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AiStartScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => AiStartScreenController(), permanent: false,
        fenix: false);
  }
}

class AiStartScreenController extends BaseController
    with GetTickerProviderStateMixin {

  final AiPulseService aiPulseService = Get.find();

  RxList<AiChatMessage> messageList = <AiChatMessage>[].obs;

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();

  GlobalKey containerKey = GlobalKey();

  ScrollController scrollController = ScrollController();

  late AnimationController animationController;
  late List<Animation<double>> dotScales;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    dotScales = List.generate(3, (index) {
      final start = index * 0.2;
      return Tween<double>(begin: 0.5, end: 1.2).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(start, start + 0.6, curve: Curves.easeInOut),
        ),
      );
    });
    aiPulseChatGptUserPage();
  }

  @override
  void dispose() {
    if (animationController != null) {
      animationController.dispose();
    }
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void _scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  aiPulseChatGptSend(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    if (textEditingController.text.isEmpty) return;
    animationController.repeat();
    messageList.add(AiChatMessage(
        1, 0, 1, textEditingController.text, textEditingController.text,
        'datetime', false));
    messageList.add(AiChatMessage(0, 0, 2, 'text', 'message', 'datetime', false));
    _scrollToBottom();
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        state: UIState.partialSuccess,
        request: () => aiPulseService.aiPulseChatGptSend(
            prompt: textEditingController.text));
    textEditingController.text = '';
    if (result != null) {
      for (var message in messageList) {
        message.animal = false;
      }
      messageList.removeWhere((message) => message.id == 0);
      messageList.addAll(result.map((message) {
        return AiChatMessage(2, 0, 2, 'text', message.text, 'datetime', false);
      }));
      messageList.last.animal = true;
      animationController.stop();
      _scrollToBottom();
    }
  }

  aiPulseChatGptUserPage(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    final result = await fetchPaginatedData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseChatGptUserPage(page: page, perPage: 20));
    if (result != null && result.list.isNotEmpty) {
      if (loadingState == AppLoadingState.loadMore) {
        messageList.insertAll(0, result.list.reversed.toList());
      } else {
        messageList.assignAll(result.list.reversed.toList());
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }
  }
}
