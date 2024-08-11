// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStoreImpl on HomeStore, Store {
  late final _$_useCasesAtom =
      Atom(name: 'HomeStore._useCases', context: context);

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

  late final _$pageAtom = Atom(name: 'HomeStore.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$offsetAtom = Atom(name: 'HomeStore.offset', context: context);

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$stateAtom = Atom(name: 'HomeStore.state', context: context);

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

  late final _$fetchDataAsyncAction =
      AsyncAction('HomeStore.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
page: ${page},
offset: ${offset},
state: ${state}
    ''';
  }
}
