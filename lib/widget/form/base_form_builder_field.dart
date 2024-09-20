import 'package:aida/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BaseFormBuilderField<T> extends StatelessWidget {
  final String name;
  final String? Function(Object?)? validator;
  final Widget Function(FormFieldState<T> field) childBuilder;
  const BaseFormBuilderField(
      {super.key,
        required this.name,
        this.validator,
        required this.childBuilder});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        builder: (field) {
          return InputDecorator(
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                errorText: field.errorText,
                errorStyle: fontRegular.copyWith(
                    fontSize: 12, color: Colors.red, height: 1.5),
                errorMaxLines: 3,
              ),
              child: childBuilder(field));
        },
        name: name);
  }
}
