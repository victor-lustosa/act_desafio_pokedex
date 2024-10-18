
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModularSlideTransition extends CustomTransition {
  ModularSlideTransition({
    Duration? transitionDuration,
    Duration? reverseTransitionDuration,
    Curve? curve,
    Offset? begin,
    Offset? end,
    bool? opaque,
  }) : super(
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: anim1.drive(
            Tween(
              begin: begin ?? const Offset(1, 0),
              end: end ?? Offset.zero,
            ).chain(
              CurveTween(
                curve: curve ?? Curves.ease,
              ),
            ),
          ),
          child: child,
        );
      },
      transitionDuration:
      transitionDuration ?? const Duration(milliseconds: 300),
      reverseTransitionDuration:
      reverseTransitionDuration ?? const Duration(milliseconds: 300),
      opaque: opaque ?? true);
}