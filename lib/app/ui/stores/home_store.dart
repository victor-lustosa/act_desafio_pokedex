import 'package:act_desafio_pokedex/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/domain/entities/pokemon_entity.dart';
import '../../core/domain/exceptions/exceptions.dart';
import '../../core/infra/use_cases/pokemon_use_case_impl.dart';
import '../../shared/states/generic_states.dart';

part 'home_store.g.dart';

class HomeStoreImpl = HomeStore with _$HomeStoreImpl;

abstract class HomeStore with Store {
  HomeStore({required PokemonUseCase useCases}) : _useCases = useCases;

  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  @observable
  PokemonUseCase _useCases;

  @observable
  bool isNextButtonVisible = true;

  @observable
  bool isPreviousButtonVisible = false;

  @observable
  int pageNumbers = 5;

  @observable
  int offset = 0;

  @observable
  int isSearched = 0;

  @computed
  int get nextPage => offset + 5;

  @computed
  int get previousPage => offset - 5;

  @observable
  GenericState state = InitialState();

  get previousAction => {
        if (offset == 0)
          {isPreviousButtonVisible = false}
        else
          {isPreviousButtonVisible = true}
      };

  get initialAction =>
      {isPreviousButtonVisible = false, isNextButtonVisible = false};

  @action
  onSearchAction() async {
    if (searchController.text.isNotEmpty) {
      state = LoadingState();
      initialAction;
      final result =
          await _useCases.getBySearch(searchController.text.toLowerCase());
      result.fold(
          (SearchException e) =>
              {state = ExceptionState(message: e.message), initialAction},
          (entities) => {
                if (entities != null)
                  {
                    state = DataFetchedState<List<PokemonEntity>>(entities: entities),
                    previousAction,
                    if ((entities as List).isEmpty) initialAction
                  }
                else
                  {
                    state = ExceptionState(message: 'Ocorreu um erro ao realizar a pesquisa.'),
                    initialAction
                  }
              },
      );
    }
  }

  @action
  onCleanAction() async {
    if (searchController.text.isNotEmpty) {
      searchController.text = "";
      fetchData(
        nextPage: pageNumbers.toString(),
        offsetParam: offset.toString(),
      );
    }
  }

  @action
  onChange(String value) async {
    if (value.isEmpty) {
      isNextButtonVisible = true;
      fetchData(
        nextPage: pageNumbers.toString(),
        offsetParam: offset.toString(),
      );
    }
  }

  @action
  Future<void> showDetails(PokemonEntity entity) async {
    Modular.to.pushNamed(MainModule.pokemonDetailsRoute,arguments: entity);
  }

  callPreviousPage() {
    if (previousPage >= 0) offset = previousPage;
    fetchData(nextPage: pageNumbers.toString(), offsetParam: offset.toString());
  }

  callNextPage() {
    if (nextPage >= 0) offset = nextPage;
    fetchData(nextPage: pageNumbers.toString(), offsetParam: offset.toString());
  }

  @action
  Future<void> fetchData({String? nextPage, String? offsetParam}) async {
    state = LoadingState();
    final result = await _useCases.get(
        nextPage ?? pageNumbers.toString(),
        offsetParam ?? offset.toString(),
       );
    result.fold(
        (GetException e) =>
            {state = ExceptionState(message: e.message), initialAction},
        (entities) => {
              if (entities != null)
                {
                  state = DataFetchedState<List<PokemonEntity>>(entities: entities),
                  previousAction,
                  isNextButtonVisible = true
                }
              else
                {
                  state = ExceptionState(message: 'Ocorreu um erro ao trazer os dados.'),
                  initialAction
                }
            });
  }
}
