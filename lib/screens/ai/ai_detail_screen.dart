import 'package:dgpt/screens/ai/ai_detail_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiDetailScreen extends GetView<AiDetailScreenController> {
  const AiDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        color: BaseColors.white,
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Row(
            children: [
              const Icon(Icons.chevron_left),
              const SizedBox(width: defaultPadding / 4,),
              Text(
                'Back',
                style: fontSFProMedium.copyWith(
                  fontSize: 12,
                  color: BaseColors.white,
                ),
              ),
            ],
          ),
        ),
        title: '',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.greenAccent, size: 35,),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: 10, // 消息数量
              itemBuilder: (context, index) {
                return Align(
                  alignment: index.isEven
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
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
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          _buildInputArea(),
        ],
      ),
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
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send, color: Colors.greenAccent),
            onPressed: () {
              // 发送消息逻辑
            },
          ),
        ],
      ),
    );
  }
}