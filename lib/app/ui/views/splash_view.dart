
import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies_injection.dart';
import '../../design_system/components/loadings/loadings_widget.dart';
import '../../design_system/configs/app_fonts.dart';
import '../../shared/states/generic_states.dart';
import '../stores/splash_store.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final SplashStore store;

  @override
  void initState() {
    super.initState();
    store = injector.get<SplashStore>();
    store.verifyConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.sizeOf.width,
        height: context.sizeOf.height,
        child: Observer(
          builder: (BuildContext context) {
            if (store.state is DataFetchedState) {
              return const SizedBox();
            } else if (store.state is ExceptionState) {
              return Center(
                child: SizedBox(
                  width: 300,
                  child: Text(
                    (store.state as ExceptionState).message,
                    style: AppFonts.defaultFont(color: Colors.red),
                  ),
                ),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoadingWidget(
                    androidRadius: 4,
                    iosRadius: 14,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Verificando conexão...',
                      style: AppFonts.defaultFont(),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
