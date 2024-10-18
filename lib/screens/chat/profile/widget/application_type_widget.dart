import 'package:aida/screens/chat/profile/my_profile_detail_screen_controller.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class ApplicationTypeWidget extends StatefulWidget {

  final Function(int allowType)? callback;
  const ApplicationTypeWidget({super.key, this.callback});

  @override
  State<ApplicationTypeWidget> createState() => _ApplicationTypeWidgetState();
}

class _ApplicationTypeWidgetState extends State<ApplicationTypeWidget> {
  int? allowType =
      Get.find<MyProfileDetailScreenController>().userFullInfo.allowType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          typeWidget(0, TIM_t("允许任何人")),
          typeWidget(1, TIM_t("需要验证信息")),
          typeWidget(2, TIM_t("禁止加我为好友")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              text: TIM_t("确认"),
              callback: () {
                if (widget.callback != null) widget.callback!(allowType ?? 0);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget typeWidget(int type, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            allowType = type;
          });
        },
        child: Container(
          height: 60,
          color: BaseColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: allowType == type
                        ? Colors.red
                        : BaseColors.primaryColor,
                    fontSize: 18,
                  ),
                ),
              ),
              if (allowType == type)
                Image.asset(
                  'assets/image/base/base_selected.png',
                  width: 16,
                  height: 16,
                ),
              SizedBox(
                width: allowType == type ? 24 : 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
