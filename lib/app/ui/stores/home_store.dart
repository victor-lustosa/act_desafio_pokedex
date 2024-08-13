import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../../core/domain/entities/pokemon_detail_entity.dart';
import '../../core/domain/entities/pokemon_entity.dart';
import '../../core/domain/exceptions/exceptions.dart';
import '../../core/infra/use_cases/pokemon_use_case_impl.dart';
import '../../shared/states/generic_states.dart';

part 'home_store.g.dart';

class HomeStoreImpl = HomeStore with _$HomeStoreImpl;

abstract class HomeStore with Store {
  HomeStore({required PokemonUseCase useCases}) : _useCases = useCases;

  static const platform =
      MethodChannel('com.example.act_desafio_pokedex/channel');

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
        if (offset == 0){
          isPreviousButtonVisible = false
        }
        else {
          isPreviousButtonVisible = true
        }
      };

  get initialAction => {
    isPreviousButtonVisible = false,
    isNextButtonVisible = false
  };

  @action
  onAction() async {
    if (searchController.text.isNotEmpty) {
      state = LoadingState();
      initialAction;
      offset = 0;
      final result = await _useCases.getBySearch(searchController.text.toLowerCase());
      result.fold(
          (SearchException e) => {
                state = ExceptionState(message: e.message),
                initialAction
              },
          (entities) => {
                if (entities != null)
                  {
                    state = DataFetchedState<List<PokemonEntity>>(entities: entities),
                    previousAction,
                    if ((entities as List).isEmpty) isNextButtonVisible = false
                  }
                else
                  {
                    state = ExceptionState(message: 'Ocorreu um erro ao realizar a pesquisa.'),
                    initialAction
                  }
              });
    }
  }

  @action
  onChange(String value) async {
    if (value.isEmpty) {
      isNextButtonVisible = true;
      fetchData(nextPage: '0', offsetParam: '0');
    }
  }

  @action
  modalOpened(PokemonDetailEntity entity) async {
    var modalResult = await platform.invokeMethod('showDialog', {
      'name': entity.name,
      'image': entity.image,
      'id': entity.id.toString(),
      'weight': entity.weight.toString(),
      'height': entity.height.toString(),
    });
    if (modalResult != null) fetchData(nextPage: nextPage.toString(), offsetParam: offset.toString());
  }

  @action
  Future<void> showDialog(PokemonEntity entity) async {
    state = LoadingState();
    initialAction;
    try {
      final result = await _useCases.getPokemonDetail(entity.name);
      result.fold(
          (DetailException e) => {
                state = ExceptionState(message: e.message),
                initialAction
              },
          (entity) async => {
                if (entity != null) {
                    await modalOpened(entity),
                    previousAction,
                    isNextButtonVisible = true,
                    searchController.text = ''
                  } else {
                    state = ExceptionState(message: 'Ocorreu um erro ao trazer os dados.'),
                    initialAction
                  }
              });
    } on PlatformException catch (_) {}
  }

  callPreviousPage() {
    searchController.text = '';
    if (previousPage >= 0) offset = previousPage;
    fetchData(nextPage: pageNumbers.toString(), offsetParam: offset.toString());
  }

  callNextPage() {
    searchController.text = '';
    if (nextPage >= 0) offset = nextPage;
    fetchData(nextPage: pageNumbers.toString(), offsetParam: offset.toString());
  }

  @action
  Future<void> fetchData({String? nextPage, String? offsetParam}) async {
    state = LoadingState();
    final result = await _useCases.get(
        nextPage ?? pageNumbers.toString(), offsetParam ?? offset.toString());
    result.fold(
        (GetException e) => {
              state = ExceptionState(message: e.message),
              initialAction
            },
        (entities) => {
              if (entities != null) {
                  state = DataFetchedState<List<PokemonEntity>>(entities: entities),
                  previousAction,
                  isNextButtonVisible = true
                } else {
                  state = ExceptionState(message: 'Ocorreu um erro ao trazer os dados.'),
                  initialAction
                }
            });
  }
}
