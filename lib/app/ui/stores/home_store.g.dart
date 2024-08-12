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

  late final _$isButtonScrollVisibleAtom =
      Atom(name: 'HomeStore.isButtonScrollVisible', context: context);

  @override
  bool get isButtonScrollVisible {
    _$isButtonScrollVisibleAtom.reportRead();
    return super.isButtonScrollVisible;
  }

  @override
  set isButtonScrollVisible(bool value) {
    _$isButtonScrollVisibleAtom.reportWrite(value, super.isButtonScrollVisible,
        () {
      super.isButtonScrollVisible = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: 'HomeStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$paginationNumberAtom =
      Atom(name: 'HomeStore.paginationNumber', context: context);

  @override
  int get paginationNumber {
    _$paginationNumberAtom.reportRead();
    return super.paginationNumber;
  }

  @override
  set paginationNumber(int value) {
    _$paginationNumberAtom.reportWrite(value, super.paginationNumber, () {
      super.paginationNumber = value;
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
  Future<void> fetchData({String? nextPage, String? offsetParam}) {
    return _$fetchDataAsyncAction.run(
        () => super.fetchData(nextPage: nextPage, offsetParam: offsetParam));
  }

  @override
  String toString() {
    return '''
searchController: ${searchController},
scrollController: ${scrollController},
isButtonScrollVisible: ${isButtonScrollVisible},
currentPage: ${currentPage},
paginationNumber: ${paginationNumber},
offset: ${offset},
state: ${state},
nextPage: ${nextPage},
previousPage: ${previousPage}
    ''';
  }
}
