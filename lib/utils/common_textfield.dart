import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_utils.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield({
    Key key,
    this.labelText,
    @required this.controller,
    @required this.hintText,
    this.textInput = TextInputType.text,
    this.textAlign = TextAlign.left,
    this.isSecure = false,
    this.isDisabled = false,
    this.isDigitsOnly = false,
    this.maxLength,
    this.suffixWidget,
    this.prefixWidget,
    this.focus,
    this.validation,
    this.emptyValidation = true,
    this.nextFocus,
    this.onChange,
    this.maxLine,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final TextInputType textInput;
  final TextAlign textAlign;
  final String hintText;
  final int maxLength;
  final bool isSecure;
  final bool isDisabled;
  final bool isDigitsOnly;
  final bool emptyValidation;
  final FocusNode focus;
  final Widget suffixWidget;
  final Widget prefixWidget;
  final Function validation;
  final Function nextFocus;
  final Function onChange;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: textInput,
            inputFormatters: isDigitsOnly
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      try {
                        final text = newValue.text;
                        if (text.isNotEmpty) double.parse(text);
                        return newValue;
                      } catch (e) {}
                      return oldValue;
                    }),
                  ]
                : null,
            maxLength: maxLength,
            maxLines: maxLine,
            focusNode: focus,
            obscureText: isSecure,
            enabled: !isDisabled,
            textAlignVertical: TextAlignVertical.bottom,
            textAlign: textAlign,
            style: blackRegular16,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                  right: 15.w,
                ),
                child: suffixWidget,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 2
                ),
                child: prefixWidget,
              ),
              prefixIconConstraints: BoxConstraints(maxHeight: 24.sp),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              suffixIconConstraints: BoxConstraints(maxHeight: 24.sp),
              counterText: "",
              hintText: hintText,
              hintStyle: hintTextStyle,
              contentPadding:
                  EdgeInsets.only(bottom: 15.w, top: 15.w, left: 15.w),
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            validator: emptyValidation
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return '$hintText Required';
                    }
                    return null;
                  }
                : validation,
            onEditingComplete: nextFocus,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
