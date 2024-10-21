// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailsStoreImpl on PokemonDetailsStore, Store {
  late final _$_useCasesAtom =
      Atom(name: 'PokemonDetailsStore._useCases', context: context);

  @override
  PokemonUseCase<dynamic> get _useCases {
    _$_useCasesAtom.reportRead();
    return super._useCases;
  }

  @override
  set _useCases(PokemonUseCase<dynamic> value) {
    _$_useCasesAtom.reportWrite(value, super._useCases, () {
      super._useCases = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'PokemonDetailsStore.state', context: context);

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

  late final _$getDetailsAsyncAction =
      AsyncAction('PokemonDetailsStore.getDetails', context: context);

  @override
  Future<void> getDetails(PokemonEntity entity) {
    return _$getDetailsAsyncAction.run(() => super.getDetails(entity));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
