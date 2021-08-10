import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:test_app/style/app_colors.dart';
import 'package:test_app/style/app_padding.dart';
import 'package:test_app/style/decorations.dart';
import 'package:test_app/style/text_styles.dart';
import 'package:test_app/utils/enums.dart';
import 'package:test_app/utils/helper_functions.dart';
import 'package:test_app/utils/images.dart';
import 'package:test_app/view/screens/login/widgets/middle_buttons.dart';
import 'package:test_app/view/widgets/auth_bar_title.dart';
import 'package:test_app/view/widgets/auth_divider.dart';
import 'package:test_app/view/widgets/circle_button.dart';
import 'package:test_app/view/widgets/email_field.dart';
import 'package:test_app/view/widgets/loading_alert_widget.dart';
import 'package:test_app/view/widgets/password_field.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final emailController = useTextEditingController();
    // final passwordController = useTextEditingController();
    // final emailNode = useFocusNode();
    // final passwordNode = useFocusNode();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final emailNode = FocusNode();
    final passwordNode = FocusNode();


    return Stack(
      children: [
        Directionality(
          textDirection: HelperFunctions.isEnglish(context)
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: GestureDetector(
            onTap: () {
              emailNode.unfocus();
              passwordNode.unfocus();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                decoration: Decorations.authDecoration,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: ListView(
                    padding: AppPadding.padding24v26h,
                    children: [
                      // TODO: app bar title
                      AuthAppBarTitle(title: lang.tr('login')),
                      // TODO: form
                      Column(
                        children: [
                          EmailField(
                            emailController: emailController,
                            emailNode: emailNode,
                            nextNode: passwordNode,
                          ),
                          PasswordField(
                            passwordController: passwordController,
                            passwordNode: passwordNode,
                          ),
                        ],
                      ),
                      // TODO: Buttons
                      MiddleButtons(
                        emailController: emailController,
                        passwordController: passwordController,
                        emailNode: emailNode,
                        passwordNode: passwordNode,
                        authType: AuthType.login,
                      ),
                      // TODO: Forgot Password
                      SizedBox(
                        height: 19.h,
                      ),
                      // TODO: Forgot Text
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'did_you_forget_password',
                            style: TextStyles.style14SBB,
                          ).tr(),
                        ),
                      ),
                      AuthDivider(),
                      // TODO: Register Text
                      Center(
                        child: Text(
                          'you_can_subscribe_here',
                          style: TextStyles.style16SBB,
                        ).tr(),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(
                            onPressed: () {},
                            color: AppColors.googleColor,
                            icon: Images.googleIcon,
                          ),
                          SizedBox(
                            width: 26.w,
                          ),
                          CircleButton(
                            onPressed: () {},
                            color: AppColors.facebookColor,
                            icon: Images.facebookIcon,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        LoadingAndAlertWidget(),
      ],
    );
  }
}
