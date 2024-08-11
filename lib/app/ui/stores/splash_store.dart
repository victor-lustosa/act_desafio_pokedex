import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:act_desafio_pokedex/app/shared/states/generic_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../core/configs/app_routes.dart';
import '../../shared/mixins/connectivity_mixin.dart';

part 'splash_store.g.dart';

class SplashStoreImpl = SplashStore with _$SplashStoreImpl;

abstract class SplashStore with Store, ConnectivityMixin {

  @observable
  GenericState state = InitialState();

  @action
  Future<void> verifyConnection(BuildContext context) async {
    try {
      state = LoadingState();
      final response = await isConnected();
      if (response) {
        Future.delayed(const Duration(seconds: 2),(){
          state = DataFetchedState();
          if(context.mounted) context.navigator.pushReplacementNamed(AppRoutes.homeRoute);
        });
      } else {
        state = ExceptionState(
            message: 'Sem conexão com a internet. Cheque sua rede.');
      }
    } catch (e) {
      state = ExceptionState(message: e.toString());
    }
  }
}
