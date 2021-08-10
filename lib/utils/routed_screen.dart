import 'package:flutter/material.dart';

import 'enums.dart';


class RoutedScreen extends StatelessWidget {
  final Animation animation;
  final Widget screen;
  final AppTransition transition;

  const RoutedScreen({
    Key key,
    this.animation,
    this.screen,
    this.transition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (transition == AppTransition.zoom) {
      final tween = Tween<double>(begin: 0.0, end: 1.0);
      final curvedAnimation =
      CurvedAnimation(parent: animation, curve: Curves.easeIn);
      return ScaleTransition(
        scale: tween.animate(curvedAnimation),
        child: screen,
      );
    } else if (transition == AppTransition.size) {
      return Align(
        child: SizeTransition(sizeFactor: animation, child: screen),
      );
    } else if (transition == AppTransition.left_to_right) {
      final tween = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));
      return SlideTransition(
        position: animation.drive(tween),
        child: screen,
      );
    } else if (transition == AppTransition.right_to_left) {
      final tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
      return SlideTransition(
        position: animation.drive(tween),
        child: screen,
      );
    } else if (transition == AppTransition.bottom_to_top) {
      final tween = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0));
      return SlideTransition(
        position: animation.drive(tween),
        child: screen,
      );
    } else if (transition == AppTransition.top_to_bottom) {
      final tween = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0));
      return SlideTransition(
        position: animation.drive(tween),
        child: screen,
      );
    }
    return FadeTransition(
      opacity: animation,
      child: screen,
    );
  }
}
