import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class DefaultEmptyView extends StatelessWidget {
  final String? emptyText;
  final String? emptyImg;
  const DefaultEmptyView({super.key, this.emptyText, this.emptyImg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FractionallySizedBox(
              widthFactor: 0.25, child: Image.asset(emptyImg ?? context.appTheme.emptyImg)),
          const SizedBox(height: 10),
          Text(
            tr(emptyText ?? tr("general.no_data")),
            style: fontMedium.copyWith(fontSize: 12, color: BaseColors.gray),
          )
        ],
      ),
    );
  }
}
