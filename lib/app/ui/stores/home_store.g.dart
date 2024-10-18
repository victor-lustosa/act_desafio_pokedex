// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStoreImpl on HomeStore, Store {
  Computed<int>? _$nextPageComputed;

  @override
  int get nextPage => (_$nextPageComputed ??=
          Computed<int>(() => super.nextPage, name: 'HomeStore.nextPage'))
      .value;
  Computed<int>? _$previousPageComputed;

  @override
  int get previousPage =>
      (_$previousPageComputed ??= Computed<int>(() => super.previousPage,
              name: 'HomeStore.previousPage'))
          .value;

  late final _$searchControllerAtom =
      Atom(name: 'HomeStore.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$scrollControllerAtom =
      Atom(name: 'HomeStore.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

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

  late final _$isNextButtonVisibleAtom =
      Atom(name: 'HomeStore.isNextButtonVisible', context: context);

  @override
  bool get isNextButtonVisible {
    _$isNextButtonVisibleAtom.reportRead();
    return super.isNextButtonVisible;
  }

  @override
  set isNextButtonVisible(bool value) {
    _$isNextButtonVisibleAtom.reportWrite(value, super.isNextButtonVisible, () {
      super.isNextButtonVisible = value;
    });
  }

  late final _$isPreviousButtonVisibleAtom =
      Atom(name: 'HomeStore.isPreviousButtonVisible', context: context);

  @override
  bool get isPreviousButtonVisible {
    _$isPreviousButtonVisibleAtom.reportRead();
    return super.isPreviousButtonVisible;
  }

  @override
  set isPreviousButtonVisible(bool value) {
    _$isPreviousButtonVisibleAtom
        .reportWrite(value, super.isPreviousButtonVisible, () {
      super.isPreviousButtonVisible = value;
    });
  }

  late final _$pageNumbersAtom =
      Atom(name: 'HomeStore.pageNumbers', context: context);

  @override
  int get pageNumbers {
    _$pageNumbersAtom.reportRead();
    return super.pageNumbers;
  }

  @override
  set pageNumbers(int value) {
    _$pageNumbersAtom.reportWrite(value, super.pageNumbers, () {
      super.pageNumbers = value;
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

  late final _$isSearchedAtom =
      Atom(name: 'HomeStore.isSearched', context: context);

  @override
  int get isSearched {
    _$isSearchedAtom.reportRead();
    return super.isSearched;
  }

  @override
  set isSearched(int value) {
    _$isSearchedAtom.reportWrite(value, super.isSearched, () {
      super.isSearched = value;
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

  late final _$onSearchActionAsyncAction =
      AsyncAction('HomeStore.onSearchAction', context: context);

  @override
  Future onSearchAction() {
    return _$onSearchActionAsyncAction.run(() => super.onSearchAction());
  }

  late final _$onCleanActionAsyncAction =
      AsyncAction('HomeStore.onCleanAction', context: context);

  @override
  Future onCleanAction() {
    return _$onCleanActionAsyncAction.run(() => super.onCleanAction());
  }

  late final _$onChangeAsyncAction =
      AsyncAction('HomeStore.onChange', context: context);

  @override
  Future onChange(String value) {
    return _$onChangeAsyncAction.run(() => super.onChange(value));
  }

  late final _$showDetailsAsyncAction =
      AsyncAction('HomeStore.showDetails', context: context);

  @override
  Future<void> showDetails(PokemonEntity entity) {
    return _$showDetailsAsyncAction.run(() => super.showDetails(entity));
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('HomeStore.fetchData', context: context);

  @override
  Future<void> fetchData({String? nextPage, String? offsetParam}) {
    return _$fetchDataAsyncAction.run(
        () => super.fetchData(nextPage: nextPage, offsetParam: offsetParam));
  }

  @override
  String toString() {
    return '''
searchController: ${searchController},
scrollController: ${scrollController},
isNextButtonVisible: ${isNextButtonVisible},
isPreviousButtonVisible: ${isPreviousButtonVisible},
pageNumbers: ${pageNumbers},
offset: ${offset},
isSearched: ${isSearched},
state: ${state},
nextPage: ${nextPage},
previousPage: ${previousPage}
    ''';
  }
}
