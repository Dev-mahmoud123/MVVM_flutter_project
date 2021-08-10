import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/entities/snack_bar_entity.dart';
import 'package:test_app/providers/providers.dart';
import 'package:test_app/utils/enums.dart';
import 'package:test_app/utils/page_router.dart';
import 'package:test_app/view/screens/home/home_view.dart';
import 'package:test_app/view/screens/login/login_screen.dart';

class AuthViewModel extends ChangeNotifier {
  final Reader reader;

  AuthViewModel(this.reader);

  Future<void> login({@required String email, @required String password, @required BuildContext context,}) async {
    final snackBarProvider = reader(snackBarStateProvider);
    final loadingProvider = reader(loadingStateProvider);

    if (email.isEmpty || password.isEmpty) {
      snackBarProvider.state = SnackBarEntity.error(message: "Fill All inputs");
      return;
    }
    loadingProvider.state = true;

    final result = await reader(authServiceProvider).login(email, password);
    loadingProvider.state = false;

    if (result.status) {
      snackBarProvider.state = SnackBarEntity.success(message: result.message);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', result.data.token);
      PageRouter.pushReplacementScreen(
        context: context,
        transition: AppTransition.bottom_to_top,
        screen: HomeDataView(),
      );
    } else {
      snackBarProvider.state = SnackBarEntity.error(message: result.message);
    }
  }


  Future<void> logout(BuildContext context) async {
    final snackBarProvider = reader(snackBarStateProvider);
    final loadingProvider = reader(loadingStateProvider);

    loadingProvider.state = true;

    final result = await reader(authServiceProvider).logout();
    loadingProvider.state = false;

    if (result.status) {
      snackBarProvider.state = SnackBarEntity.success(message: result.message);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.clear();
      PageRouter.pushReplacementScreen(
        context: context,
        transition: AppTransition.bottom_to_top,
        screen: LoginScreen(),
      );
    } else {
      snackBarProvider.state = SnackBarEntity.error(message: result.message);
    }
  }

  Future<void> register({@required String name, @required String phone, @required String email, @required String password, @required String image, @required BuildContext context,}) async {

    final snackBarProvider = reader(snackBarStateProvider);
    final loadingProvider = reader(loadingStateProvider);


    if (name.isEmpty) {
      snackBarProvider.state = SnackBarEntity.error(message: "Name is Required");
      return;
    }
    else if (email.isEmpty || password.isEmpty) {
      snackBarProvider.state = SnackBarEntity.error(message: "Email And Password is required");
      return;
    }
    else if (image.isEmpty ) {
      snackBarProvider.state = SnackBarEntity.error(message: "Image is required");
      return;
    }

    loadingProvider.state = true;

    final result = await reader(authServiceProvider).register(name,phone,email,password,image);

    loadingProvider.state = false;

    if (result.status) {
      snackBarProvider.state = SnackBarEntity.success(message: result.message);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', result.data.token);
      PageRouter.pushReplacementScreen(
        context: context,
        transition: AppTransition.bottom_to_top,
        screen: HomeDataView(),
      );
    } else {
      snackBarProvider.state = SnackBarEntity.error(message: result.message);
    }
  }


}
