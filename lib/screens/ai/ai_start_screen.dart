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
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        color: BaseColors.white,
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () => Get.close(2),
          child: Row(
            children: [
              const Icon(
                Icons.chevron_left,
                size: 24,
              ),
              Text(
                'Back',
                style: fontSFProBold.copyWith(
                  fontSize: 12,
                  color: BaseColors.white,
                ),
              ),
            ],
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
        title: '',
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.greenAccent,
              size: 35,
            ),
            onPressed: () => Get.close(2),
          ),
        ],
      ),
      body: Obx(() => Column(
        children: [
          if (controller.messageList.isEmpty)
            Expanded(child: _empty()),
          if (controller.messageList.isNotEmpty)
            Expanded(child: _messageListView()),
          _buildInputArea(),
        ],
      )),
    );
  }

  Widget _buildInputArea() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                controller: controller.textEditingController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.greenAccent),
            onPressed: () {
              controller.textEditingController.text = '';
              controller.messageList.add(controller.textEditingController.text);
            },
          ),
        ],
      ),
    );
  }

  _messageListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: controller.messageList.length, // 消息数量
      itemBuilder: (context, index) {
        return Align(
          alignment:
              index.isEven ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: index.isEven ? Colors.grey : Colors.greenAccent,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(8.0),
                topRight: const Radius.circular(8.0),
                bottomLeft: Radius.circular(index.isEven ? 0 : 8.0),
                bottomRight: Radius.circular(index.isEven ? 8.0 : 0),
              ),
            ),
            child: Text(
              index.isEven ? "Hello" : "123",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  _empty() {
    return Column(
      children: [
        Text(
          'Welcome to \nDGPT-AI',
          style: fontSFProBold.copyWith(
            fontSize: 20,
            color: BaseColors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Text(
          'Ask anything, get your answer',
          style: fontSFProBold.copyWith(
            fontSize: 14,
            color: BaseColors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Container(
          color: Colors.white,
          child: Image.asset("assets/images/tab/home_inactive.png", width: 300),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: BaseColors.black),
          child: Text(
            'DGPT-AI: Powering the Next Generation of LLM '
            'Models.Your all-encompassing artificial intelligence assistant',
            style: fontSFProBold.copyWith(
              fontSize: 14,
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
}
