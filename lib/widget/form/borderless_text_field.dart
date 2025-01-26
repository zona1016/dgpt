import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

enum BorderTextFormFieldType { primary, secondary }

class BorderlessTextFormField extends StatefulWidget {
  final BorderTextFormFieldType type;
  final String name;
  final String? title;
  final String? hintText;
  final String? bottomHint;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final bool wrapperEnabled;
  final bool enabled;
  final bool readOnly;
  final Widget? prefixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffixIcon;
  final String? suffixText;
  final Function()? suffixClick;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? fillColor;
  const BorderlessTextFormField(
      {super.key,
        required this.name,
        this.hintText,
        this.onChanged,
        this.validator,
        this.textInputAction = TextInputAction.next,
        this.obscureText = false,
        this.controller,
        this.initialValue,
        this.keyboardType,
        this.style,
        this.focusNode,
        this.inputFormatters,
        this.enabled = true,
        this.suffixIconConstraints,
        this.suffixIcon,
        this.decoration,
        this.type = BorderTextFormFieldType.primary,
        this.prefixIcon,
        this.title,
        this.isRequired = true,
        this.bottomHint,
        this.readOnly = false,
        this.suffixText,
        this.wrapperEnabled = true,
        this.maxLines = 1,
        this.suffixClick,
        this.textAlign,
        this.fillColor});

  @override
  State<StatefulWidget> createState() => BorderlessTextFormFieldState();
}

class BorderlessTextFormFieldState extends State<BorderlessTextFormField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      maxLines: widget.maxLines,
      name: widget.name,
      readOnly: widget.readOnly,
      initialValue: widget.initialValue,
      controller: widget.controller,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        errorStyle:
        fontRegular.copyWith(fontSize: 12, color: Colors.red, height: 1.5),
        errorMaxLines: 2,
        filled: true,
        contentPadding: const EdgeInsets.all(0),
        hintText: widget.hintText,
        hintStyle: fontMedium.copyWith(
            fontSize: 16, color: context.appTheme.weakTextColor),
        fillColor: widget.fillColor ?? Colors.transparent,
        enabledBorder: getInputBorder(),
        border: getInputBorder(),
        focusedBorder: getInputBorder(),
      ),
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      style: widget.style ??
          fontMedium.copyWith(fontSize: 16, color: context.appTheme.textColor),
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      textAlign: widget.textAlign ?? TextAlign.start,
    );
  }

  OutlineInputBorder getInputBorder() {
    return OutlineInputBorder(
        borderSide: widget.type == BorderTextFormFieldType.primary
            ? BorderSide.none
            : const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30));
  }
}
