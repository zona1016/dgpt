import 'package:dgpt/screens/ai/ai_start_screen_controller.dart';
import 'package:dgpt/screens/ai/widgets/animated_text.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/base/base_smart_refresher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiStartScreen extends GetView<AiStartScreenController> {
  const AiStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.transparent),
        ),
        title: '',
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever,
              size: 20,
            ),
            onPressed: () => controller.deleteHistory(),
          ),
        ],
        onBackTap: () {
          Get.back();
          Get.back();
        },
      ),
      body: Obx(() => Column(
            children: [
              if (controller.messageList.isEmpty) Expanded(child: _empty()),
              if (controller.messageList.isNotEmpty)
                Expanded(child: _messageListView()),
              _buildInputArea(),
            ],
          )),
    );
  }

  Widget _buildInputArea() {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(width: 1, color: BaseColors.white)),
              child: TextField(
                controller: controller.textEditingController,
                style: fontDMMedium.copyWith(
                    color: BaseColors.white, fontSize: 16),
                decoration: const InputDecoration(
                  hintText: 'How do I make an HTTP?',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: defaultPadding / 3 * 2,
          ),
          GestureDetector(
            onTap: () => controller.aiPulseChatGptSend(),
            child: Image.asset(
              "assets/images/custom/ai_send.png",
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }

  _messageListView() {
    return Obx(() => BaseSmartRefresher(
          refreshController: controller.refreshController,
          enableLoadMore: true,
          uiState: controller.uiState.value,
          isEmpty: controller.messageList.isEmpty,
          onPullToRefresh: (loadingState) {
            controller.aiPulseChatGptUserPage(loadingState: loadingState);
          },
          onLoadMore: (loadingState) {
            controller.aiPulseChatGptUserPage(loadingState: loadingState);
          },
          childBuilder: (context, physics) {
            return ListView.builder(
              physics: physics,
              padding: const EdgeInsets.all(defaultPadding),
              controller: controller.scrollController,
              itemCount: controller.messageList.length,
              // 消息数量
              itemBuilder: (context, index) {
                return controller.messageList[index].isSelf
                    ? _rightItem(index)
                    : _leftItm(index);
              },
            );
          },
        ));
  }

  _empty() {
    return Column(
      children: [
        Text(
          '${tr('ai.welcome_to_use')}\nAIP-AI',
          style: fontDMBold.copyWith(
            fontSize: 32,
            color: BaseColors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Text(
          tr('ai.ask_any_question'),
          style: fontDMBold.copyWith(
            fontSize: 18,
            color: BaseColors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Image.asset(
          "assets/images/custom/ai_logo.png",
          width: 180,
          height: 250,
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: BaseColors.white.withOpacity(0.08)),
          child: Text(
            tr('ai.aip_ai_description'),
            style: fontDMMedium.copyWith(
              fontSize: 16,
              color: BaseColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }

  _leftItm(index) {
    return Stack(
      children: [
        SizedBox(
          width: Get.width / 3 * 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              constraints: BoxConstraints(
                minWidth: Get.width / 3 * 2,
                maxWidth: Get.width / 3 * 2,
                minHeight: 100,
              ),
              decoration: BoxDecoration(
                color: BaseColors.white.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              child: controller.messageList[index].id == 0
                  ? _buildAnimal()
                  : controller.messageList[index].animal!
                      ? AnimatedText(
                          text: controller.messageList[index].message ?? '',
                          textStyle: const TextStyle(color: Colors.white))
                      : Text(
                          controller.messageList[index].message ?? '',
                          style: const TextStyle(color: Colors.white),
                        ),
            ),
          ),
        ),
        if (index != 1)
          Positioned(
            bottom: defaultPadding,
            right: Get.width - Get.width / 3 * 2 - defaultPadding * 2 - 48,
            child: Image.asset(
              'assets/images/custom/ai_message_logo.png',
              height: 44,
              width: 68,
            ),
          )
      ],
    );
  }

  _buildAnimal() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (index) {
          return AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: controller.dotScales[index].value,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  _rightItem(index) {
    return SizedBox(
      width: Get.width / 3 * 2,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
          constraints: BoxConstraints(
            maxWidth: Get.width / 3 * 2,
          ),
          decoration: BoxDecoration(
            gradient: BaseColors.aiMyLinearGradient,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Text(
            controller.messageList[index].message ?? '',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
