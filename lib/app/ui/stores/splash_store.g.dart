// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashStoreImpl on SplashStore, Store {
  late final _$stateAtom = Atom(name: 'SplashStore.state', context: context);

  @override
  GenericState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(GenericState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$verifyConnectionAsyncAction =
      AsyncAction('SplashStore.verifyConnection', context: context);

  @override
  Future<void> verifyConnection(BuildContext context) {
    return _$verifyConnectionAsyncAction
        .run(() => super.verifyConnection(context));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
