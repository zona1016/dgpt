
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