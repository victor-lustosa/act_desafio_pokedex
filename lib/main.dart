import 'dart:async';

import 'package:act_desafio_pokedex/app/core/di/dependencies_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/core/configs/app_routes.dart';
import 'app/core/configs/no_glow_behavior.dart';
import 'app/design_system/configs/app_themes.dart';
import 'app/ui/views/splash_view.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      initDependencies();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]).then(
        (_) => runApp(
          MaterialApp(
            builder: (context, Widget? child) {
              return ScrollConfiguration(
                behavior: NoGlowBehavior(),
                child: child!,
              );
            },
            theme: lightTheme,
            home: const SplashView(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          ),
        ),
      );
    },
    (error, stackTrace) => (error, stackTrace),
  );
}
