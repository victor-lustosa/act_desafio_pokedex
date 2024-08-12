import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/views_exceptions/unknown_view_exception.dart';
import '../../ui/views/home_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String splashRoute = "/splash";
  static const String homeRoute = "/home";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return CustomTransitionPageRoute(
          transitionSpeed: const Duration(milliseconds: 500),
          reverseSpeed: const Duration(milliseconds: 500),
          child: const HomeView(),
          tween: Tween(begin: const Offset(1, 0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.ease)),
        );
      default:
        return unknownRoute();
    }
  }
}

unknownRoute() {
  if (Platform.isIOS) {
    return CupertinoPageRoute(
      builder: (_) => const CupertinoPageScaffold(
        child: UnknownViewException(),
      ),
    );
  } else {
    return MaterialPageRoute(
      builder: (_) => const UnknownViewException(),
    );
  }
}

class CustomTransitionPageRoute extends PageRouteBuilder {
  final Widget child;
  final Animatable<Offset> tween;
  final Duration transitionSpeed;
  final Duration reverseSpeed;

  CustomTransitionPageRoute(
      {required this.transitionSpeed,
        required this.reverseSpeed,
        required this.tween,
        required this.child})
      : super(
      reverseTransitionDuration: reverseSpeed,
      transitionDuration: transitionSpeed,
      pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
/*  ScaleTransition(
        scale : animation,
        child: child,
     );*/
/*FadeTransition(opacity: animation, child: child);*/
}
