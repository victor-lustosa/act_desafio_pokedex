import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/core/configs/no_glow_behavior.dart';
import 'app/core/di/dependencies_injection.dart';
import 'app/design_system/configs/app_themes.dart';
import 'app/ui/views/home_view.dart';
import 'app/ui/views/pokemon_details_view.dart';
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
          ModularApp(
            module: MainModule(),
            child: MaterialApp.router(
              builder: (context, Widget? child) {
                return ScrollConfiguration(
                  behavior: NoGlowBehavior(),
                  child: child!,
                );
              },
              title: 'Pokedex',
              theme: lightTheme,
              routerConfig: Modular.routerConfig,
              debugShowCheckedModeBanner: false,
            ),
          ),
        ),
      );
    },
    (error, stackTrace) => (error, stackTrace),
  );
}

class MainModule extends Module {
  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String pokemonDetailsRoute = '/pokemon-details';

  @override
  void routes(r) {
    r.child(initialRoute, child: (_) => SplashView());
    r.child(homeRoute, child:(_) => HomeView());
    r.child(pokemonDetailsRoute, child: (_) => PokemonDetailsView());
  }
}