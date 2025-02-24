
import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String maskEmail() {
    final regex = RegExp(r'^(.)(.*)(@.*)$');

    return replaceAllMapped(regex, (match) {
      String firstChar = match.group(1) ?? '';
      String middleSection = match.group(2) ?? '';
      String domain = match.group(3) ?? '';

      String maskedMiddle = '*' * middleSection.length;

      return '$firstChar$maskedMiddle$domain';
    });
  }
}

String formatNumber(double value) {
  final formatter = NumberFormat('#,##0.0000');
  String formatted = formatter.format(value);
  if (formatted.contains('.')) {
    while (formatted.endsWith('0')) {
      formatted = formatted.substring(0, formatted.length - 1);
    }
    // 如果去掉0后是个小数点，就去掉小数点
    if (formatted.endsWith('.')) {
      formatted = formatted.substring(0, formatted.length - 1);
    }
  }

  return formatted;
}