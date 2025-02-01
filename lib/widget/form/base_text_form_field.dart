import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

enum TextFormFieldType { primary, secondary, golden }

class BaseTextFormField extends StatefulWidget {
  final TextFormFieldType type;
  final String name;
  final String? title;
  final String? hintText;
  final TextStyle? hintStyle;
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
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final bool notPaddingPrefixIcon;
  final double radius;

  const BaseTextFormField({
    super.key,
    required this.name,
    this.hintText,
    this.hintStyle,
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
    this.type = TextFormFieldType.primary,
    this.prefixIcon,
    this.title,
    this.isRequired = false,
    this.bottomHint,
    this.readOnly = false,
    this.suffixText,
    this.wrapperEnabled = true,
    this.maxLines = 1,
    this.suffixClick,
    this.textAlign,
    this.fillColor,
    this.autofocus = false,
    this.autovalidateMode,
    this.radius = 30,
    this.notPaddingPrefixIcon = false,
  });

  @override
  State<StatefulWidget> createState() => BaseTextFormFieldState();
}

class BaseTextFormFieldState extends State<BaseTextFormField> {
  bool showObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null && widget.type == TextFormFieldType.golden)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              widget.title!,
              style: fontSFProRegular.copyWith(
                  fontSize: 17, color: BaseColors.white),
            ),
          ),
        FormBuilderTextField(
          maxLines: widget.maxLines,
          name: widget.name,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          initialValue: widget.initialValue,
          controller: widget.controller,
          autocorrect: false,
          enableSuggestions: true,
          autovalidateMode:
          widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              errorStyle: fontDMRegular.copyWith(
                  fontSize: 12, color: Colors.red, height: 1.5),
              errorMaxLines: 3,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              hintText: widget.hintText != null
                  ? "${widget.hintText}${widget.isRequired ? "*" : ""}"
                  : null,
              fillColor: widget.fillColor ?? getFillColor(context),
              hintStyle: widget.hintStyle ?? getHintStyle(context),
              enabledBorder: getInputBorder(context),
              border: getInputBorder(context),
              focusedBorder: getInputBorder(context),
              focusedErrorBorder: getInputBorder(context)
                  .copyWith(borderSide: const BorderSide(color: Colors.red)),
              errorBorder: getInputBorder(context)
                  .copyWith(borderSide: const BorderSide(color: Colors.red)),
              prefixIcon: widget.notPaddingPrefixIcon
                  ? widget.prefixIcon
                  : Padding(
                padding: EdgeInsets.fromLTRB(
                    widget.prefixIcon != null ? 24 : 12,
                    10,
                    widget.prefixIcon != null ? 16 : 8,
                    10),
                child: widget.prefixIcon,
              ),
              prefixIconConstraints: const BoxConstraints(maxHeight: 36),
              suffixIconConstraints: const BoxConstraints(maxHeight: 36),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 20, left: 8),
                child: widget.obscureText
                    ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      showObscure = !showObscure;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset(
                        "assets/images/icons/ic_${showObscure ? "hide" : "show"}.png",
                        width: 18,
                      color: showObscure ? BaseColors.secondPrimaryColor : null,
                    ),
                  ),
                )
                    : widget.suffixIcon,
              )),
          obscureText: widget.obscureText && showObscure,
          onChanged: widget.onChanged,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          style: widget.style ?? getTextStyle(context),
          focusNode: widget.focusNode,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          textAlign: widget.textAlign ?? TextAlign.start,
        ),
      ],
    );
  }

  TextStyle getTextStyle(BuildContext context) {
    return switch (widget.type) {
      TextFormFieldType.primary ||
      TextFormFieldType.secondary =>
          fontDMHeavy.copyWith(
              fontSize: 16,
              color: widget.readOnly
                  ? context.appTheme.weakTextColor
                  : context.appTheme.textColor),
      TextFormFieldType.golden => fontDMHeavy.copyWith(
          fontSize: 16, color: context.appTheme.textColor, height: 1)
    };
  }

  TextStyle getHintStyle(BuildContext context) {
    return switch (widget.type) {
      TextFormFieldType.primary || TextFormFieldType.secondary => fontDMRegular
          .copyWith(fontSize: 16, color: BaseColors.black.withOpacity(0.25)),
      TextFormFieldType.golden => fontDMRegular.copyWith(
          fontSize: 16, color: BaseColors.black.withOpacity(0.25))
    };
  }

  Color getFillColor(BuildContext context) {
    return switch (widget.type) {
      TextFormFieldType.primary => BaseColors.gray85.withOpacity(0.5),
      TextFormFieldType.secondary => BaseColors.gray85.withOpacity(0.5),
      TextFormFieldType.golden => BaseColors.gray85.withOpacity(0.5)
    };
  }

  InputBorder getInputBorder(BuildContext context) {
    return switch (widget.type) {
      TextFormFieldType.primary ||
      TextFormFieldType.secondary =>
          OutlineInputBorder(
              borderSide: widget.type == TextFormFieldType.primary
                  ? BorderSide.none
                  : BorderSide(color: context.appTheme.lightPrimaryColor),
              borderRadius: BorderRadius.circular(widget.radius)),
      TextFormFieldType.golden => OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(5))
    };
  }
}
