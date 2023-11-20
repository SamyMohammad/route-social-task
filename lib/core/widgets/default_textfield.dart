import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_social_app/core/resources/assets_manager.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';

class DefaultTextField extends StatelessWidget {
  Key? formKey;
  VoidCallback? onTap;
  TextEditingController? controller;
  TextStyle? style;
  TextDirection? textDirection;
  bool isHidden;
  Function(String value)? onChanged;
  Function(String value)? onFieldSubmitted;
  TextInputType? type;
  String? hintText;
  IconData? suffix;
  IconData? prefix;
  int? maxLines;
  Function()? suffixPressed;
  Color? cursorColor;
  String? Function(String? value)? validator;
  String? labelText;
  bool? isEnabled;
  String? errorText;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  bool? autocorrect;

  DefaultTextField(
      {super.key,
      this.textInputType,
      this.textInputAction,
      this.focusNode,
      this.autocorrect,
      this.errorText,
      this.maxLines,
      this.isEnabled,
      this.textDirection,
      this.onTap,
      this.controller,
      this.style,
      required this.isHidden,
      this.onChanged,
      this.onFieldSubmitted,
      this.type,
      this.hintText,
      this.suffix,
      this.prefix,
      this.suffixPressed,
      this.cursorColor,
      this.validator,
      this.labelText,
      this.formKey});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.all(Radius.circular(70.sp)),
      child: TextFormField(
          textInputAction: textInputAction,
          autofocus: false,
          onTap: onTap,
          maxLines: maxLines,
          keyboardType: textInputType,
          textDirection: textDirection,
          enabled: isEnabled,
          style: style ?? const TextStyle(fontSize: 17, color: Colors.black),
          obscureText: isHidden,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'this Field can\'t be empty.';
                }
                return null;
              },
          key: key,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
              fillColor: const Color(0xFFF6F7F9),
              filled: true,
              labelText: labelText,
              labelStyle: TextStyle(color: ColorManager.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(70.sp)),
              ),
              alignLabelWithHint: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(70.sp)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(70.sp)),
              ),
              errorText: errorText,
              // labelText: labelText,
              hintStyle: TextStyle(
                  color: ColorManager.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontConstants.fontFamily),
              hintText: hintText,
              prefixIcon: (prefix != null)
                  ? Icon(prefix, color: Theme.of(context).primaryColor)
                  : Image.asset(ImageAssets.search),
              suffixIcon: (suffix != null)
                  ? InkWell(
                      onTap: suffixPressed,
                      child: Icon(
                        suffix,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(
                  vertical: 8.h, horizontal: 8.w)) // border: InputBorder.none,
          ),
    );
  }
}
