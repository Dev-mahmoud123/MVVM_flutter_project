import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test_app/style/app_colors.dart';

class AuthDivider extends StatelessWidget {
  final double topPadding;

  const AuthDivider({Key key, this.topPadding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding ?? 24.h,
        bottom: 10.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.blackColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ).tr(),
          ),
          Expanded(
            child: Divider(
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
