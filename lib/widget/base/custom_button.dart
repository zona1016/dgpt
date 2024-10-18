import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  void Function()? callback;
  final Widget? child;
  final String text;
  final double? height;
  final double? radius;

  CustomButton(
      {super.key,
      required this.text,
      this.callback,
      this.child,
      this.height = 60,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? (height! / 2)),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF00E0E5).withOpacity(0.5),
              const Color(0xFF00BFBF).withOpacity(0.5)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: child ?? Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: height! - 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? (height! - 10) / 2),
              gradient: const LinearGradient(
                colors: [Color(0xFF00E0E5), Color(0xFF00BFBF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: fontMedium.copyWith(
                    color: BaseColors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
