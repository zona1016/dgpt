import 'package:aida/screens/chat/profile/my_profile_detail_screen_controller.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class GenderChoseWidget extends StatefulWidget {

  final Function(int allowType)? callback;
  const GenderChoseWidget({super.key, this.callback});

  @override
  State<GenderChoseWidget> createState() => _ApplicationTypeWidgetState();
}

class _ApplicationTypeWidgetState extends State<GenderChoseWidget> {
  int? gender =
      Get.find<MyProfileDetailScreenController>().userFullInfo.gender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                Expanded(child: Container()),
                typeWidget(1, TIM_t("男")),
                Expanded(child: Container()),
                typeWidget(2, TIM_t("女")),
                Expanded(child: Container()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              text: TIM_t("确认"),
              callback: () {
                if (widget.callback != null) widget.callback!(gender ?? 0);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget typeWidget(int type, String text) {
    return GestureDetector(
      onTap: (){
        setState(() {
          gender = type;
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                type == 1 ? 'assets/image/profile/profile_female.png' : 'assets/image/profile/profile_male.png',
                height: 130,
                width: 150,
              ),
              if (gender == type)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Image.asset(
                    'assets/image/base/base_selected.png',
                    height: 16,
                    width: 16,
                  ),
                )
            ],
          ),
          const SizedBox(height: 8,),
          Text(
            text,
            style: fontMedium.copyWith(
                color: BaseColors.primaryColor,
                fontSize: 16
            ),
          )
        ],
      ),
    );
  }
}
