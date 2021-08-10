import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class TextStyles {
  const TextStyles._();

  // TODO: size: 11 / bold / red
  static TextStyle get style11BRed => TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 11.sp,
        fontWeight: FontWeight.bold,
      );

  // TODO: size: 12 / normal / grey
  static TextStyle get style12NGr => TextStyle(
        color: AppColors.greyColor,
        fontSize: 12.sp,
      );

  // TODO: size: 12 / normal / green
  static TextStyle get style12NG => style12NGr.copyWith(
        color: AppColors.primaryColor,
      );

  // TODO: size: 12 / normal / green
  static TextStyle get style12NY => style12NG.copyWith(
        color: AppColors.yellowColor,
      );

  // TODO: size: 12 / normal / white
  static TextStyle get style12NW => style12NG.copyWith(
        color: Colors.white,
      );

  // TODO: size: 12 / normal / black
  static TextStyle get style12NB => style12NGr.copyWith(
        color: AppColors.blackColor,
      );

  // TODO: size: 12 / semi bold / black
  static TextStyle get style12SBB => style12NB.copyWith(
        fontWeight: FontWeight.w600,
      );

  // TODO: size: 12 / semi bold / grey
  static TextStyle get style12SBGr => style12SBB.copyWith(
        color: AppColors.greyColor,
      );

  // TODO: size: 12 / semi bold / green
  static TextStyle get style12SBG => style12SBB.copyWith(
        color: AppColors.primaryColor,
      );

  // TODO: size: 14 / semi bold / black
  static TextStyle get style14SBB => TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
      );

  // TODO: size: 14 / bold / black
  static TextStyle get style14BB => style14SBB.copyWith(
        fontWeight: FontWeight.bold,
      );

  // TODO: size: 14 / bold / grey
  static TextStyle get style14BGr => style14BB.copyWith(
        color: AppColors.greyColor,
      );

  // TODO: size: 14 / bold / black
  static TextStyle get style14BG => style14BB.copyWith(
        color: AppColors.primaryColor,
      );

  // TODO: size: 14 / simi bold / green
  static TextStyle get style14SBG => style14SBB.copyWith(
        color: AppColors.primaryColor,
      );

  // TODO: size: 14 / normal / black
  static TextStyle get style14NB => style14SBB.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      );

  // TODO: size: 14 / normal / white
  static TextStyle get style14NW => style14NB.copyWith(
        color: Colors.white,
      );

  // TODO: size: 14 / normal / grey
  static TextStyle get style14NGr => style14NB.copyWith(
        color: AppColors.greyColor,
      );

  // TODO: size: 16 / semi bold / black
  static TextStyle get style16SBB => style14SBB.copyWith(
        fontSize: 16.sp,
      );

  // TODO: size: 16 / semi bold / grey
  static TextStyle get style16SBGr => style16SBB.copyWith(
        color: AppColors.greyColor,
      );

  // TODO: size: 16 / semi bold / green
  static TextStyle get style16SBG => style16SBB.copyWith(
        color: AppColors.primaryColor,
      );

  // TODO: size: 16 / bold / black
  static TextStyle get style16BB => style16SBB.copyWith(
        fontWeight: FontWeight.bold,
      );

  // TODO: size: 16 / bold / white
  static TextStyle get style16BW => style16BB.copyWith(
        color: Colors.white,
      );

  // TODO: size: 16 / normal / black / Pop up menu button
  static TextStyle get style16NBPop => style16SBB.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      );

  // TODO: size: 16 / normal / black / Pop up menu button
  static TextStyle get style16NB => style16NBPop.copyWith(
        fontSize: 16.sp,
      );

  // TODO: size: 18 / bold / black
  static TextStyle get style18BG => style14SBB.copyWith(
        fontSize: 18.sp,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
      );

  // TODO: size: 18 / bold / black
  static TextStyle get style18BB => style18BG.copyWith(
        color: AppColors.blackColor,
      );

  // TODO: size: 18 / semi bold / black
  static TextStyle get style18SBB => style18BB.copyWith(
        fontWeight: FontWeight.w600,
      );

  // TODO: size: 18 / semi bold / white
  static TextStyle get style18SBW => style18SBB.copyWith(
        color: Colors.white,
      );

  // TODO: size: 24 / bold / green
  static TextStyle get style24BG => TextStyle(
        fontSize: 24.sp,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
      );

  // TODO: size: 24 / bold / black
  static TextStyle get style24BB => style24BG.copyWith(
        color: AppColors.blackColor,
      );

  // TODO: size: 24 / semi bold / red
  static TextStyle get style24SBR => style24BG.copyWith(
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w600,
      );

  // TODO: size: 21 / bold / green
  static TextStyle get style21BG => style24BG.copyWith(
        fontSize: 21.sp,
      );
}
