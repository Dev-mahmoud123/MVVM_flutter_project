import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'custom_text_field.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final FocusNode passwordNode;

  const PasswordField(
      {Key key, this.passwordController, this.passwordNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: passwordController,
      focusNode: passwordNode,
      hintText: tr('password'),
      obSecure: true,
      bottomPadding: 24.h,
    );
  }
}
