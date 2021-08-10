import 'package:flutter/material.dart';
import 'package:test_app/utils/routed_screen.dart';

import 'enums.dart';


class PageRouter {
  const PageRouter._();

  static pushScreen({
    @required BuildContext context,
    @required Widget screen,
    AppTransition transition,
  }) {
    Navigator.of(context).push(_pageRoute(
      screen: screen,
      transition: transition,
    ));
  }

  static pushReplacementScreen({
    @required BuildContext context,
    @required Widget screen,
    AppTransition transition,
  }) {
    Navigator.of(context).pushReplacement(_pageRoute(
      screen: screen,
      transition: transition,
    ));
  }

  static _pageRoute({
    Widget screen,
    AppTransition transition,
  }) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, _) {
        return RoutedScreen(
          animation: animation,
          screen: screen,
          transition: transition,
        );
      },
    );
  }

  static back(BuildContext context) => Navigator.of(context).pop();
}
