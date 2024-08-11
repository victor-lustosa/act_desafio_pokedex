import 'package:act_desafio_pokedex/app/core/domain/use_cases/use_cases.dart';
import 'package:act_desafio_pokedex/app/core/external/dio_external.dart';
import 'package:act_desafio_pokedex/app/core/infra/repositories/pokemon_repository_impl.dart';
import 'package:act_desafio_pokedex/app/core/infra/use_cases/pokemon_use_case_impl.dart';
import 'package:act_desafio_pokedex/app/ui/stores/splash_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../ui/stores/home_store.dart';

final injector = GetIt.instance;

initDependencies(){
  injector.registerSingleton<SplashStore>(SplashStoreImpl());
  injector.registerSingleton<PokemonRepositoryImpl>(PokemonRepositoryImpl(client: DioExternal(dio: Dio())));
  injector.registerSingleton<PokemonUseCasesImpl>(PokemonUseCasesImpl(repository: injector.get<PokemonRepositoryImpl>()));
  injector.registerSingleton<HomeStore>(HomeStoreImpl(useCases: injector.get<PokemonUseCasesImpl>()));
}