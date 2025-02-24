
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
  return formatted.replaceAll(RegExp(r'(\.\d*?[1-9])0+$'), r'$1').replaceAll(RegExp(r'\.0+$'), '');
}