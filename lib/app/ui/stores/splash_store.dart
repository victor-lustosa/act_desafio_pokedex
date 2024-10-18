
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../main.dart';
import '../../shared/mixins/connectivity_mixin.dart';
import '../../shared/states/generic_states.dart';

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
          if(context.mounted) Modular.to.navigate(MainModule.homeRoute);
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
