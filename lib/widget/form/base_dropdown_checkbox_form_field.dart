import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/form/menu_item.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class BaseDropDownCheckboxFormField extends StatefulWidget {
  final String name;
  final String? hintText;
  final List<MenuItem> items;
  final List<MenuItem>? initialValue;
  final Function(List<MenuItem>)? onChanged;
  final String? placeholder;
  final DropdownButtonBuilder? selectedItemBuilder;
  final TextStyle? style;
  final bool isDense;
  final bool isExpanded;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;
  final BorderRadius? borderRadius;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final Function(List<MenuItem>?)? valueTransformer;
  final String? Function(List<MenuItem>?)? validator;

  const BaseDropDownCheckboxFormField(
      {super.key,
        required this.items,
        this.hintText,
        this.placeholder,
        this.isExpanded = true,
        this.isDense = true,
        this.style,
        this.selectedItemBuilder,
        this.menuMaxHeight,
        this.enableFeedback,
        this.borderRadius,
        this.alignment = AlignmentDirectional.centerStart,
        this.suffixIconConstraints,
        this.suffixIcon,
        required this.name,
        this.onChanged,
        this.focusNode,
        this.initialValue,
        this.decoration,
        this.validator,
        this.valueTransformer});

  @override
  State<StatefulWidget> createState() => BaseDropDownCheckboxFormFieldState();
}

class BaseDropDownCheckboxFormFieldState
    extends State<BaseDropDownCheckboxFormField> {
  List<MenuItem> selectedItems = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      setState(() {
        selectedItems.assignAll(widget.initialValue!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<MenuItem>>(
        validator: widget.validator,
        initialValue: widget.initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        valueTransformer: widget.valueTransformer,
        onChanged: (value) {
          if (selectedItems.isEmpty) {
            setState(() {
              selectedItems.assignAll(value ?? []);
            });
          }
        },
        builder: (field) {
          return DropdownButtonFormField2(
            isExpanded: widget.isExpanded,
            value: selectedItems.isEmpty ? null : selectedItems.last,
            autovalidateMode: AutovalidateMode.always,
            hint: widget.hintText != null
                ? Text(widget.hintText!,
                style: fontMedium.copyWith(
                    fontSize: 14, color: context.appTheme.weakTextColor))
                : null,
            decoration: widget.decoration ??
                InputDecoration(
                    labelStyle: fontMedium.copyWith(
                        fontSize: 14, color: BaseColors.weakTextColor),
                    errorStyle:
                    fontRegular.copyWith(fontSize: 12, color: Colors.red),
                    filled: true,
                    fillColor: context.appTheme.inputFillColor,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(30)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(30)),
                    suffixIconConstraints: widget.suffixIconConstraints,
                    labelText: widget.placeholder,
                    alignLabelWithHint: true,
                    hintText: widget.hintText,
                    hintStyle: fontMedium.copyWith(
                        fontSize: 14, color: BaseColors.weakTextColor),
                    suffixIcon: widget.suffixIcon),
            items: widget.items
                .map((item) => DropdownMenuItem(
                value: item,
                enabled: item.enabled,
                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    final isSelected = selectedItems.contains(item);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          isSelected
                              ? selectedItems.remove(item)
                              : selectedItems.add(item);
                          field.didChange(selectedItems);
                          widget.onChanged?.call(selectedItems);
                          setState(() {});
                          menuSetState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          color: context.appTheme.inputFillColor,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                    item.label,
                                    style: fontMedium.copyWith(
                                        fontSize: 14,
                                        color: BaseColors.weakTextColor),
                                  )),
                              IgnorePointer(
                                child: Checkbox(
                                  side: const BorderSide(
                                      color: BaseColors.gray),
                                  shape: const CircleBorder(),
                                  value: isSelected,
                                  onChanged: (value) {},
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )))
                .toList(),
            selectedItemBuilder: (context) => widget.items
                .map((item) => Row(
              children: [
                Expanded(
                    child: Text(
                      selectedItems.map((e) => e.label).toList().join(', '),
                      style: fontMedium.copyWith(
                          fontSize: 14, color: context.appTheme.textColor),
                      overflow: TextOverflow.ellipsis,
                    ))
              ],
            ))
                .toList(),
            validator: (value) => field.errorText,
            style: widget.style ??
                fontMedium.copyWith(
                    fontSize: 14, color: context.appTheme.textColor),
            isDense: widget.isDense,
            onChanged: (value) {},
            focusNode: widget.focusNode,
            enableFeedback: widget.enableFeedback,
            alignment: widget.alignment,
            dropdownStyleData: DropdownStyleData(
              elevation: 0,
              maxHeight: widget.menuMaxHeight,
              offset: const Offset(0, -10),
              decoration: BoxDecoration(
                  color: context.appTheme.containerColor,
                  borderRadius: BorderRadius.circular(25),
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
                  color: context.appTheme.textColor,
                )),
          );
        },
        name: widget.name);
  }
}
