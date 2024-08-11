import 'dart:convert';

import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/core/infra/repositories/pokemon_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mocks/mocks.dart';
import 'package:http/http.dart' as http;

main() {
  late MockHttpClient client;
  late final PokemonRepositoryImpl repository;
  setUpAll(() {
    // Registrar o valor de fallback para Uri
    registerFallbackValue(FakeUri());
  });
  setUp(() {
    client = MockHttpClient();
    repository = PokemonRepositoryImpl(client: client);
  });

  test('Deve retornar os dados da API e transforma-los para a lista de entities', () async {
    final jsonResponse = jsonEncode({
      "results": [
        {"name": "Pikachu", "url": "https://pokeapi.co/api/v2/pokemon/25/"},
        {"name": "Charmander", "url": "https://pokeapi.co/api/v2/pokemon/4/"}
      ]
    });
    when(() => client.get(any())).thenAnswer((_) async => http.Response(jsonResponse, 200));
    when(() => PokemonAdapterMock().fromMapList(any()))
        .thenReturn(<PokemonEntity>[]);

    final result = await repository.get('', '');

    expect(result.isRight(), isTrue);
    expect(result.getOrElse(() => []), isA<List<PokemonEntity>>());
  });
}

//
//   test('Deve retornar uma exception em caso de erro', () async {
//     when(() => repository.get('', ''))
//         .thenAnswer((_) async => Left(GetException()));
//     final result = await usecases.get('', '');
//     expect(result.isLeft(), true);
//     expect(result.fold(id, id), isA<GetException>());
//   });
//
//   test('Deve retornar uma lista de pokemons por pesquisa', () async {
//     when(() => repository.getBySearch(''))
//         .thenAnswer((_) async => const Right(<PokemonEntity>[]));
//     final result = await usecases.getBySearch('');
//     expect(result, isA<Right>());
//     expect(result | null, isA<List<PokemonEntity>>());
//   });
//
//   test('Deve retornar uma exception em caso de erro ao pesquisar', () async {
//     when(() => repository.getBySearch(''))
//         .thenAnswer((_) async => Left(SearchException()));
//     final result = await usecases.getBySearch('');
//     expect(result.isLeft(), true);
//     expect(result.fold(id, id), isA<SearchException>());
//   });
// }
