
extension StringExtension on String {
  String maskEmail(String email) {
    final regex = RegExp(r'^(.)(.*)(@.*)$');

    return email.replaceAllMapped(regex, (match) {
      String firstChar = match.group(1) ?? '';
      String middleSection = match.group(2) ?? '';
      String domain = match.group(3) ?? '';

      String maskedMiddle = '*' * middleSection.length;

      return '$firstChar$maskedMiddle$domain';
    });
  }
}