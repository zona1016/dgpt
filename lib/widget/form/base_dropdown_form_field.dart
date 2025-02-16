import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/form/menu_item.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BaseDropDownFormField extends StatelessWidget {
  final Key? fieldKey;
  final String name;
  final Color? dropDownColor;
  final Color? fillColor;
  final String? hintText;
  final List<MenuItem> items;
  final MenuItem? initialValue;
  final MenuItem? value;
  final Function(MenuItem<dynamic>?)? valueTransformer;
  final Function(MenuItem<dynamic>?)? onChanged;
  final String? placeholder;
  final DropdownButtonBuilder? selectedItemBuilder;
  final TextStyle? style;
  final bool isDense;
  final bool isExpanded;
  final double? menuMaxHeight;
  final double? width;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;
  final BorderRadius? borderRadius;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final double radius;
  final String? Function(MenuItem<dynamic>?)? validator;

  const BaseDropDownFormField(
      {super.key,
        required this.items,
        this.dropDownColor,
        this.fillColor,
        this.hintText,
        this.placeholder,
        this.isExpanded = true,
        this.isDense = true,
        this.style,
        this.selectedItemBuilder,
        this.menuMaxHeight,
        this.width,
        this.enableFeedback,
        this.borderRadius,
        this.alignment = AlignmentDirectional.centerStart,
        this.suffixIconConstraints,
        this.suffixIcon,
        this.prefixIcon,
        required this.name,
        this.onChanged,
        this.focusNode,
        this.initialValue,
        this.value,
        this.decoration,
        this.valueTransformer,
        this.validator,
        this.radius = 30,
        this.fieldKey});

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(colors: [
      BaseColors.primaryGradientStartColor,
      BaseColors.primaryGradientEndColor,
    ]);
    return FormBuilderField<MenuItem>(
        validator: validator,
        key: fieldKey,
        initialValue: initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        valueTransformer: valueTransformer ?? (value) => value?.value,
        builder: (field) {
          return DropdownButtonFormField2(
            isExpanded: isExpanded,
            value: value ?? field.value,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            hint: hintText != null
                ? Text(hintText!,
                style: fontMedium.copyWith(
                    fontSize: 14, color: BaseColors.white))
                : null,
            decoration: decoration ??
                InputDecoration(
                    labelStyle: fontMedium.copyWith(
                        fontSize: 14, color: BaseColors.white),
                    errorStyle:
                    fontRegular.copyWith(fontSize: 12, color: Colors.red),
                    filled: true,
                    fillColor: fillColor ?? BaseColors.black,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    // prefix: const Padding(padding: EdgeInsets.only(left: 20)),
                    // suffix: const Padding(padding: EdgeInsets.only(left: 20)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(radius)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(radius)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(radius)),
                    suffixIconConstraints: suffixIconConstraints,
                    labelText: placeholder,
                    alignLabelWithHint: true,
                    suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon
                ),
            items: items
                .map((item) => DropdownMenuItem(
                value: item,
                enabled: item.enabled,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: item == field.value
                      ? BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                    color: dropDownColor ?? Colors.black
                  )
                      : null,
                  child: Text(
                    item.label,
                    style: fontMedium.copyWith(
                        fontSize: 14,
                        color: item == field.value
                            ? Colors.white
                            : context.appTheme.weakTextColor),
                  ),
                )))
                .toList(),
            selectedItemBuilder: (context) => items
                .map((item) => Row(
              children: [
                Expanded(
                    child: Text(
                      item.label,
                      style: fontMedium.copyWith(
                          fontSize: 14, color: BaseColors.white),
                      overflow: TextOverflow.ellipsis,
                    ))
              ],
            ))
                .toList(),
            validator: (value) => field.errorText,
            style: style ??
                fontMedium.copyWith(
                    fontSize: 14, color: BaseColors.white),
            isDense: isDense,
            onChanged: (value) {
              field.didChange(value);
              onChanged?.call(value);
            },
            focusNode: focusNode,
            enableFeedback: enableFeedback,
            alignment: alignment,
            dropdownStyleData: DropdownStyleData(
              elevation: 0,
              width: width,
              maxHeight: menuMaxHeight,
              offset: const Offset(0, -10),
              decoration: BoxDecoration(
                  color: dropDownColor ?? Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x1A333333),
                        blurRadius: 3,
                        offset: Offset(0, 0))
                  ]),
            ),
            menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 0)),
            iconStyleData: IconStyleData(
                icon: Image.asset(
                  "assets/images/icons/arrow_right.png",
                  width: 6,
                  color: BaseColors.white,
                )),
          );
        },
        name: name);
  }
}
