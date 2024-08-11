import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:act_desafio_pokedex/app/shared/states/generic_states.dart';
import 'package:act_desafio_pokedex/app/ui/stores/splash_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/configs/app_routes.dart';
import '../../core/di/dependencies_injection.dart';
import '../../design_system/components/loadings/loadings_widget.dart';
import '../../design_system/configs/app_fonts.dart';

//
//
// class SplashView extends StatefulWidget {
//   const SplashView({super.key});
//
//   @override
//   State<SplashView> createState() => _SplashViewState();
// }
//
// class _SplashViewState extends State<SplashView> {
//   late final DatabaseBloc bloc;
//
//   @override
//   initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<DatabaseBloc, GenericState<DatabasesState>>(
//         listener: (context, state) async {
//           if (state is FetchingDataState<DatabasesState>) {
//             if (!state.isData) {
//               navigate(InitModule.initialRoute);
//             } else {
//               navigate(AuthModule.authRoute + AuthModule.loginRoute);
//             }
//           }
//         },
//         bloc: bloc,
//         builder: (context, state) {
//           if (state is LoadingState<DatabasesState> || state is FetchingDataState<DatabasesState>) {
//             return const LoadingWidget(
//               androidRadius: 4,
//               iosRadius: 14,
//               color: AppColors.darkGreen,
//             );
//           } else {
//             return const GenericErrorView();
//           }
//         },
//       ),
//     );
//   }
// }
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
                child: Text(
                  (store.state as ExceptionState).message,
                  style: AppFonts.defaultFont(color: Colors.red),
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
