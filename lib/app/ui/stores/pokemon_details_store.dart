
import 'package:mobx/mobx.dart';

import '../../core/domain/entities/pokemon_detail_entity.dart';
import '../../core/domain/entities/pokemon_entity.dart';
import '../../core/domain/exceptions/exceptions.dart';
import '../../core/infra/use_cases/pokemon_use_case_impl.dart';
import '../../shared/states/generic_states.dart';

part 'pokemon_details_store.g.dart';

class PokemonDetailsStoreImpl = PokemonDetailsStore with _$PokemonDetailsStoreImpl;

abstract class PokemonDetailsStore with Store {
  PokemonDetailsStore({required PokemonUseCase useCases}) : _useCases = useCases;

  @observable
  PokemonUseCase _useCases;

  @observable
  GenericState state = InitialState();

  @action
  Future<void> getDetails(PokemonEntity entity) async {
    state = LoadingState();
    final result = await _useCases.getPokemonDetail(entity.name);
    result.fold(
        (DetailException e) =>
            {state = ExceptionState(message: e.message),},
        (entity) => {
              if (entity != null) {
                  state = DataFetchedState<PokemonDetailsEntity>(entities: entity),
                }
              else {
                  state = ExceptionState(message: 'Ocorreu um erro ao realizar a pesquisa.'),
                }
        });
  }

}
