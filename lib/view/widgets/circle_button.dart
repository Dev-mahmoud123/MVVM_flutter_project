import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleButton extends StatelessWidget {
  final Color color;
  final String icon;
  final VoidCallback onPressed;

  const CircleButton({
    Key key,
    @required this.color,
    @required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('//');
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 36.h,
        width: 36.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          icon,
          color: color,
        ),
      ),
    );
  }
}
