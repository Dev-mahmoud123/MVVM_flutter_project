import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/style/app_colors.dart';
import 'package:test_app/style/text_styles.dart';


class CustomTextField extends StatelessWidget {
  @required
  final TextEditingController controller;
  @required
  final FocusNode focusNode;
  @required
  final String hintText;
  final FocusNode nextNode;
  final TextInputType keyboardType;
  final Function(String) validator;
  final bool obSecure;
  final double topPadding;
  final double bottomPadding;
  final int lines;
  final Widget prefixIcon;

  CustomTextField({
    Key key,
    this.controller,
    this.focusNode,
    this.nextNode,
    this.keyboardType,
    this.hintText,
    this.validator,
    this.obSecure,
    this.topPadding,
    this.bottomPadding,
    this.lines,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding ?? 12.0.h,
        bottom: bottomPadding ?? 0.0,
      ),
      child: Container(
        //height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(.2),
          //     blurRadius: 3,
          //   ),
          // ],
        ),
        child: TextFormField(
          keyboardAppearance: Brightness.light,
          cursorColor: AppColors.primaryColor,
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(nextNode),
          keyboardType: keyboardType,
          obscureText: obSecure ?? false,
          style: TextStyles.style14SBB,
          maxLines: lines ?? 1,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyles.style14NB,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 10.h,
            ),
            filled: true,
            fillColor: Colors.white,
            border: _border,
            enabledBorder: _border,
            focusedBorder: _border.copyWith(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            errorBorder: _border.copyWith(
              borderSide: BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            prefixIcon: prefixIcon,
          ),
          validator: validator,
        ),
      ),
    );
  }

  final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      5.w,
    ),
    borderSide: BorderSide(
      width: 1,
      color: Colors.black12,
    ),
  );
}
