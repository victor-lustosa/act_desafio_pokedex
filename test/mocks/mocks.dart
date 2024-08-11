import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/core/external/dio_external.dart';
import 'package:act_desafio_pokedex/app/core/infra/adapters/pokemon_adapter.dart';
import 'package:act_desafio_pokedex/app/core/infra/adapters/pokemon_detail_adapter.dart';
import 'package:act_desafio_pokedex/app/core/infra/repositories/pokemon_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class PokemonRepositoryMock extends Mock implements PokemonRepository<List<PokemonEntity>>{}
class PokemonAdapterMock extends Mock implements PokemonAdapter{}
class PokemonDetailAdapterMock extends Mock implements PokemonDetailAdapter{}
class DioMock extends Mock implements Dio{}
class ClientExternalMock extends Mock implements DioExternal{}
