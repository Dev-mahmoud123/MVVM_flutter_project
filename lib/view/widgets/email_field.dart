import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'custom_text_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;
  final FocusNode emailNode;
  final FocusNode nextNode;

  const EmailField(
      {Key key, this.emailController, this.emailNode, this.nextNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: emailController,
      focusNode: emailNode,
      nextNode: nextNode,
      keyboardType: TextInputType.emailAddress,
      hintText: tr('email'),
      topPadding: 48.h,
    );
  }
}
