import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_detail_entity.dart';
import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/core/domain/exceptions/exceptions.dart';
import 'package:act_desafio_pokedex/app/core/infra/use_cases/pokemon_use_case_impl.dart';
import 'package:act_desafio_pokedex/app/shared/states/generic_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

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
  bool isButtonScrollVisible = true;

  @observable
  int currentPage = 5;

  @observable
  int paginationNumber = 5;

  @observable
  int offset = 0;

  @computed
  int get nextPage => currentPage + paginationNumber;

  @computed
  int get previousPage => currentPage - paginationNumber;
  @observable
  GenericState state = InitialState();

  onAction() async {
    if (searchController.text.isNotEmpty) {
      state = LoadingState();
      final result =
          await _useCases.getBySearch(searchController.text.toLowerCase());
      result.fold(
          (SearchException e) => {
                state = ExceptionState(message: e.message),
                isButtonScrollVisible = false,
              },
          (entities) => {
                if (entities != null)
                  {
                    state = DataFetchedState<List<PokemonEntity>>(
                        entities: entities),
                    isButtonScrollVisible = true
                  }
                else
                  {
                    state = ExceptionState(
                        message: 'Ocorreu um erro ao realizar a pesquisa.'),
                    isButtonScrollVisible = false,
                  }
              });
    }
  }

  onChange(String value) async {
    if (value.isEmpty) {
      fetchData(nextPage: '0', offsetParam: '0');
    }
  }
  modalOpened(PokemonDetailEntity entity) async{
    var modalResult = await platform.invokeMethod('showDialog', {
      'name': entity.name,
      'image': entity.image,
      'id': entity.id.toString(),
      'weight': entity.weight.toString(),
      'height': entity.height.toString(),
    });
    if(modalResult != null) fetchData(nextPage: nextPage.toString(), offsetParam: offset.toString());
  }

  Future<void> showDialog(PokemonEntity entity) async {
    state = LoadingState();
    try {
      final result = await _useCases.getPokemonDetail(entity.name);
      result.fold(
          (DetailException e) => {
                state = ExceptionState(message: e.message),
                isButtonScrollVisible = false,
              },
          (entity) async => {
                if (entity != null){
                  await modalOpened(entity)
                  } else {
                    state = ExceptionState(
                        message: 'Ocorreu um erro ao trazer os dados.'),
                    isButtonScrollVisible = false,
                  }
              });
    } on PlatformException catch (_) {}
  }

  callNextPage() {
    currentPage = nextPage;
    searchController.text = '';
    fetchData(nextPage: nextPage.toString(), offsetParam: offset.toString());
    Future.delayed(const Duration(milliseconds: 500), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @action
  Future<void> fetchData({String? nextPage, String? offsetParam}) async {
    state = LoadingState();
    final result = await _useCases.get(
        nextPage ?? currentPage.toString(), offsetParam ?? offset.toString());
    result.fold(
        (GetException e) => {
              state = ExceptionState(message: e.message),
              isButtonScrollVisible = false,
            },
        (entities) => {
              if (entities != null)
                {
                  state =
                      DataFetchedState<List<PokemonEntity>>(entities: entities),
                  isButtonScrollVisible = true,
                }
              else
                {
                  state = ExceptionState(
                      message: 'Ocorreu um erro ao trazer os dados.'),
                  isButtonScrollVisible = false,
                }
            });
  }
}
