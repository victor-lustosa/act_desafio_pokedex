
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../ui/stores/home_store.dart';
import '../../ui/stores/splash_store.dart';
import '../external/dio_external.dart';
import '../infra/repositories/pokemon_repository_impl.dart';
import '../infra/use_cases/pokemon_use_case_impl.dart';

final injector = GetIt.instance;

initDependencies(){
  injector.registerSingleton<SplashStore>(SplashStoreImpl());
  injector.registerSingleton<PokemonRepositoryImpl>(PokemonRepositoryImpl(client: DioExternal(dio: Dio())));
  injector.registerSingleton<PokemonUseCasesImpl>(PokemonUseCasesImpl(repository: injector.get<PokemonRepositoryImpl>()));
  injector.registerSingleton<HomeStore>(HomeStoreImpl(useCases: injector.get<PokemonUseCasesImpl>()));
}