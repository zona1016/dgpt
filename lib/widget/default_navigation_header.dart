import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';

class DefaultNavigationHeader extends StatefulWidget {
  final String? defaultLeftImg;
  final String? defaultLeftTitle;

  final List<String?>? rightImages;
  final Function(int index)? onRightImageTaps;

  final bool showRightTitle;
  final String? rightTitle;
  final Function()? onRightTap;

  const DefaultNavigationHeader(
      {super.key,
      this.defaultLeftImg,
      this.defaultLeftTitle,
      this.rightImages,
      this.onRightImageTaps,
      this.showRightTitle = false,
      this.rightTitle,
      this.onRightTap});

  @override
  State<DefaultNavigationHeader> createState() =>
      _DefaultNavigationHeaderState();
}

class _DefaultNavigationHeaderState extends State<DefaultNavigationHeader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            Image.asset(
              widget.defaultLeftImg ?? 'assets/images/tab/home_inactive.png',
              width: 20,
            ),
            const SizedBox(width: defaultPadding / 2),
            Text(
              widget.defaultLeftTitle ?? '',
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: BaseColors.white,
              ),
            ),
            const Spacer(),
            Row(
              children: List.generate(widget.rightImages?.length ?? 0, (index) {
                final image = widget.rightImages?[index] ?? '';
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  child: GestureDetector(
                    onTap: () {
                      if (widget.onRightImageTaps != null) {
                        widget.onRightImageTaps!(index);
                      }
                    },
                    child: Image.asset(
                      image,
                      width: 20,
                    ),
                  ),
                );
              }),
            ),
            if (widget.showRightTitle)
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 35,
                  margin: const EdgeInsets.only(left: defaultPadding / 2),
                  padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.5),
                      color: BaseColors.primaryColor),
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
              ),
          ],
        ),
      ),
    );
  }
}
