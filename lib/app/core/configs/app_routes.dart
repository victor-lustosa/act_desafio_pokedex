import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModularFadeTransition extends CustomTransition {
  ModularFadeTransition(
      {Duration? transitionDuration,
        Duration? reverseTransitionDuration,
        bool? opaque})
      : super(
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1,
          child: child,
        );
      },
      transitionDuration:
      transitionDuration ?? const Duration(milliseconds: 150),
      reverseTransitionDuration:
      reverseTransitionDuration ?? const Duration(milliseconds: 150),
      opaque: opaque ?? true);
}
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
              begin: begin ?? const Offset(1, -1),
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