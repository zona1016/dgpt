import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskItemWidget extends StatefulWidget {
  const TaskItemWidget({super.key});

  @override
  State<TaskItemWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: BaseColors.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Accelerator Ⅰ',
                style: fontSFProMedium.copyWith(
                  fontSize: 14,
                  color: BaseColors.white,
                ),
              ),
              const Spacer(),
              Text(
                'Not start',
                style: fontSFProMedium.copyWith(
                  fontSize: 14,
                  color: BaseColors.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily training hours： 2 H',
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Text(
                        'Daily training amount：1',
                        style: fontSFProMedium.copyWith(
                          fontSize: 14,
                          color: BaseColors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Earnings per occurrence：3.4 USDT',
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Text(
                        'Remaining period：58Days',
                        style: fontSFProMedium.copyWith(
                          fontSize: 14,
                          color: BaseColors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Total yield：104%',
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                child: CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 4.0,
                  animation: true,
                  percent: 0.7,
                  center: Column(
                    children: [
                      const Spacer(),
                      Text(
                        '0 %',
                        style: fontSFProMedium.copyWith(
                          fontSize: 12,
                          color: BaseColors.white,
                        ),
                      ),
                      const SizedBox(
                        height: defaultPadding / 4,
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: 20,
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding / 4,
                              vertical: defaultPadding / 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan),
                          child: Text(
                            'Start',
                            style: fontSFProMedium.copyWith(
                              fontSize: 12,
                              color: BaseColors.white,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: BaseColors.weakTextColor,
                  progressColor: BaseColors.primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
