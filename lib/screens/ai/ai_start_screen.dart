import 'package:dgpt/screens/ai/ai_start_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
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
            icon: Image.asset(
              "assets/images/custom/logo.png",
              width: 25,
              height: 26,
            ),
            onPressed: () => Get.close(2),
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
                    color: BaseColors.white.withOpacity(0.5), fontSize: 16),
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
            onTap: () {
              if (controller.messageList.length > 2) {
                controller.endAnimal();
              } else {
                controller.startAnimal();
              }
              controller.textEditingController.text = '';
              controller.messageList.add(controller.textEditingController.text);
            },
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
    return Obx(() => ListView.builder(
          padding: const EdgeInsets.all(defaultPadding),
          itemCount: controller.messageList.length, // 消息数量
          itemBuilder: (context, index) {
            return !index.isEven ? _leftItm(index) : _rightItem();
          },
        ));
  }

  _empty() {
    return Column(
      children: [
        Text(
          '欢迎使用\nAIP-AI',
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
          '请尽管发问任何问题！',
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
            'AIP-AI：驱动未来LLM模型。您全方位的人工智能助手，助力智能与创新无缝融合。',
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
              child: (index == 1)
                  ? Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding / 2),
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
                    )
                  : Text(
                      index.isEven ? "Hello" : "123",
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

  _rightItem() {
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
            "123",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
