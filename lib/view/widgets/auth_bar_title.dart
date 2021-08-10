import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/style/text_styles.dart';


class AuthAppBarTitle extends StatelessWidget {
  final String title;

  const AuthAppBarTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        Center(
          child: Text(
            title,
            style: TextStyles.style24BG,
          ),
        ),
      ],
    );
  }
}
