import 'package:dgpt/screens/us/help_center_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_dropdown_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends GetView<HelpCenterScreenController> {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: '帮助中心',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '您好！非常抱歉，我们暂时无法为您提供服务。如果您需要帮助，请留下信息，我们将会尽快与您联系并提供解决方案！',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.phoneController,
                  decoration: InputDecoration(
                    labelText: '手机号',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入手机号';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.messageController,
                  decoration: InputDecoration(
                    labelText: '信息',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入信息';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('图片上传'),
                SizedBox(height: 10),
                controller.image == null
                    ? Text('您可上传图像不超过5MB的图片。')
                    : Image.file(controller.image!, height: 100),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    controller.onPickCoverImage(context: context);
                  },
                  child: Text('上传图片'),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: controller.submitForm,
                    child: Text('提交'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}