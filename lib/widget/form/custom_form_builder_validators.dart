import 'package:dgpt/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomFormBuilderValidators {
  static FormFieldValidator required(String title) {
    return FormBuilderValidators.required(
        errorText: tr(LocaleKeys.error_required, args: [title]));
  }

  static FormFieldValidator<String> email() {
    return FormBuilderValidators.email(errorText: tr(LocaleKeys.error_email));
  }

  static FormFieldValidator<String> equalLength(int length) {
    return FormBuilderValidators.equalLength(length,
        errorText: tr(LocaleKeys.error_size, args: [length.toString()]));
  }

  static FormFieldValidator<String> number() {
    return FormBuilderValidators.numeric(
        errorText: tr(LocaleKeys.error_number));
  }

  static FormFieldValidator checkbox(String title) {
    return FormBuilderValidators.equal(true,
        errorText: tr(LocaleKeys.error_required_checkbox, args: [title]));
  }

  static FormFieldValidator<String> password() {
    RegExp regex = RegExp(
        r'(?=^.{6,16}$)(?=.*\d)(?=.*\W+)(?=.*[A-Z])(?=.*[a-z])(?!.*\n).*$');
    return FormBuilderValidators.match(regex,
        errorText: tr(LocaleKeys.error_password_limit));
  }

  static bool isEmail(String str) {
    RegExp email = RegExp(
        r"^((([a-z]|\d|[!#\$%&'*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    return email.hasMatch(str.toLowerCase());
  }

  static FormFieldValidator<T> betweenLength<T>(
      {required int min, required int max}) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.min(min,
          errorText: tr(LocaleKeys.error_number_min_max,
              args: [min.toString(), max.toString()])),
      FormBuilderValidators.max(max,
          errorText: tr(LocaleKeys.error_number_min_max,
              args: [min.toString(), max.toString()])),
    ]);
  }
}
