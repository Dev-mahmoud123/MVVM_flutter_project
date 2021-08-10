import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/style/app_colors.dart';
import 'package:test_app/style/text_styles.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final TextStyle textStyle;
  final double topMargin;
  final double bottomMargin;
  final double verticalPadding;
  final double horizontalPadding;
  final double radius;
  final VoidCallback onPressed;
  final bool hasBorder;
  final bool hasLeftRadius;
  final bool hasRightRadius;


  const CustomButton({
    Key key,
    @required this.title,
    this.color,
    this.textStyle,
    this.onPressed,
    this.topMargin,
    this.bottomMargin,
    this.verticalPadding,
    this.horizontalPadding,
    this.radius,
    this.hasBorder = false,
    this.hasLeftRadius = true,
    this.hasRightRadius = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topMargin ?? 24.h,
        bottom: bottomMargin ?? 0.0,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? AppColors.primaryColor,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(
                hasRightRadius ? (radius ?? 5.w) : 0.0,
              ),
              left: Radius.circular(
                hasLeftRadius ? (radius ?? 5.w) : 0.0,
              ),
            ),
            border: hasBorder
                ? Border.all(
              color: AppColors.secondaryColor,
            )
                : null,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: (verticalPadding ?? 9.h),
                horizontal: (horizontalPadding ?? 0.0),
              ),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  title,
                  style: textStyle ?? TextStyles.style16BW,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
