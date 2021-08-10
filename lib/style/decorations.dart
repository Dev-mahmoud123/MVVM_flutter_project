import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/images.dart';

class Decorations {
  static BoxDecoration containerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(
      5.w,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 3,
      ),
    ],
  );

  static BoxDecoration authDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        Images.authBg,
      ),
      fit: BoxFit.fill,
    ),
  );
}
