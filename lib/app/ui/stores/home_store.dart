import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/core/domain/exceptions/exceptions.dart';
import 'package:act_desafio_pokedex/app/core/infra/use_cases/pokemon_use_case_impl.dart';
import 'package:act_desafio_pokedex/app/shared/states/generic_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';


part 'home_store.g.dart';

class HomeStoreImpl = HomeStore with _$HomeStoreImpl;

abstract class HomeStore with Store {
  HomeStore({required PokemonUseCase useCases}) : _useCases = useCases;

  @observable
  final TextEditingController searchController = TextEditingController();

  @observable
  PokemonUseCase _useCases;

  @observable
  int page = 20;

  @observable
  int offset = 0;

  @observable
  GenericState state = InitialState();

  onChange(String value) async{
    if(value.length > 2){
      final result = await _useCases.get(page.toString(), offset.toString());
      result.fold((GetException e) => {
        state = ExceptionState(message: e.message)
      }, (entities) => {
        if(entities != null) state = DataFetchedState<List<PokemonEntity>>(entities: entities)
        else state = ExceptionState(message: 'Ocorreu um erro ao trazer os dados.')
      });
    }
  }

  @action
  Future<void> fetchData() async {
    final result = await _useCases.get(page.toString(), offset.toString());
    result.fold((GetException e) => {
      state = ExceptionState(message: e.message)
    }, (entities) => {
      if(entities != null) state = DataFetchedState<List<PokemonEntity>>(entities: entities)
      else state = ExceptionState(message: 'Ocorreu um erro ao trazer os dados.')
    });
  }
}
