import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/core/infra/adapters/pokemon_adapter.dart';
import 'package:act_desafio_pokedex/app/core/infra/repositories/pokemon_repository_impl.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class PokemonRepositoryMock extends Mock implements PokemonRepository<List<PokemonEntity>>{}
class PokemonAdapterMock extends Mock implements PokemonAdapter{}
class MockHttpClient extends Mock implements http.Client {}
class FakeUri extends Fake implements Uri {}