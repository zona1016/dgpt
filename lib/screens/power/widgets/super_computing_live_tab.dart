import 'package:dgpt/screens/power/power_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperComputingLiveTab extends GetView<PowerScreenController> {
  const SuperComputingLiveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (_, index) {
        return Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: BaseColors.black,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Rules',
                    style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Rules',
                    style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding,),
              Row(
                children: [
                  Text(
                    'Rules',
                    style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.white,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: BaseColors.primaryColor
                    ),
                    child: Center(
                      child: Text(
                        'Rules',
                        style: fontSFProMedium.copyWith(
                          fontSize: 14,
                          color: BaseColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, index) {
        return Container(height: defaultPadding,);
      },
    );
  }
}
