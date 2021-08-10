import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/utils/enums.dart';
import 'package:test_app/utils/images.dart';
import 'package:test_app/utils/page_router.dart';
import 'package:test_app/view/screens/home/home_view.dart';

import '../../../providers/providers.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    context.read(splashProvider).init(context);
  }

  void checkUSerAuth() async{
    SharedPreferences preferences =  await SharedPreferences.getInstance();
    if(preferences.getString('token') != null){
      PageRouter.pushReplacementScreen(
          context: context,
          transition: AppTransition.bottom_to_top,
          screen: HomeDataView(),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Images.splash,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
