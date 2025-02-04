import 'package:dgpt/screens/profile/profile_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.baseBackgroundImage,
      appBar: BaseAppBar(
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
        title: '',
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.transparent,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.systemMessage);
            },
            child: Image.asset(
              'assets/images/home/notice.png',
              width: 25,
              height: 25,
            ),
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/home/more.png',
              width: 25,
              height: 25,
            ),
          ),
          const SizedBox(
            width: defaultPadding,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTopCard(),
          Expanded(child: _buildContentArea()),
        ],
      ),
    );
  }

  Widget _buildTopCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5009C2), Color(0xFF4A045C)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text(
            '我的总资产 (USDT)',
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
          const SizedBox(height: 4),
          const Text(
            '5,971.39 USDT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentArea() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInfoCard('USDT', '13045.62'),
            _buildInfoCard('累计收益', '112.262'),
          ],
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => Get.snackbar('信息', '前往算力订单'),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '我的订单',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white54, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
