import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_detail_entity.dart';
import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/core/domain/exceptions/exceptions.dart';
import 'package:act_desafio_pokedex/app/core/domain/repositories/repository.dart';
import 'package:act_desafio_pokedex/app/core/infra/repositories/pokemon_repository_impl.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mocks/mocks.dart';

main() {
  late ClientExternalMock client;
  late final PokemonRepositoryImpl repository;

  setUpAll(() {
    client = ClientExternalMock();
    repository = PokemonRepositoryImpl(client: client);
  });

  test('Deve retornar a lista de pokemons da API e transforma-los', () async {
    final jsonResponse = {
      "results": [
        {
          "name": "Pikachu",
          "url": "https://pokeapi.co/api/v2/pokemon/25/",
        },
      ]
    };

    when(() => client.get(any())).thenAnswer(
      (_) async => ResponseDTO(
        statusCode: 200,
        data: jsonResponse,
      ),
    );

    when(() => PokemonAdapterMock().fromMapList(any()))
        .thenReturn(<PokemonEntity>[]);

    final result = await repository.get('', '');

    expect(result.isRight(), isTrue);
    expect(result.getOrElse(() => []), isA<List<PokemonEntity>>());
    verify(() => client.get(any())).called(1);
  });

  test('Deve retornar uma exception ao buscar a lista de pokemons da API',
      () async {
    when(() => client.get(any())).thenThrow(GetException(''));

    final result = await repository.get('', '');

    expect(result.isLeft(), isTrue);
    expect(result.swap().getOrElse(() => GetException('')), isA<GetException>());
    verify(() => client.get(any())).called(1);
  });

  test('Deve retornar uma exception ao transformar a lista de pokemons da API',
      () async {
    final jsonResponse = {
      "results": [
        {
          "nume": "Charmander",
          "url": "https://pokeapi.co/api/v2/pokemon/4/",
        }
      ]
    };

    when(() => client.get(any())).thenAnswer(
      (_) async => ResponseDTO(
        statusCode: 200,
        data: jsonResponse,
      ),
    );

    final result = await repository.get('', '');

    expect(result.isLeft(), isTrue);
    expect(result.swap().getOrElse(() => GetException('')), isA<GetException>());
    verify(() => client.get(any())).called(1);
  });

  test('Deve retornar o detalhamento do pokemon da API e transforma-lo',
      () async {
    final jsonResponse = {
        "name": "chlorophyll",
        "id": 0,
        'weight' : 0,
        'height': 0
    };

    when(() => client.get(any())).thenAnswer(
      (_) async => ResponseDTO(
        statusCode: 200,
        data: jsonResponse,
      ),
    );

    when(() => PokemonDetailAdapterMock().fromMap(any()))
        .thenReturn(PokemonDetailsEntity.empty());

    final result = await repository.getPokemonDetail('');

    expect(result.isRight(), isTrue);
    expect(result.getOrElse(() => null), isA<PokemonDetailsEntity>());
    verify(() => client.get(any())).called(1);
  });

  test('Deve retornar exception ao buscar detalhamento do pokemon da API',
          () async {

       when(() => client.get(any())).thenThrow(DetailException(''));

        final result = await repository.getPokemonDetail('');
       expect(result.isLeft(), isTrue);
       expect(result.swap().getOrElse(() => DetailException('')), isA<DetailException>());
       verify(() => client.get(any())).called(1);
      });

  test('Deve retornar uma exception ao transformar o detalhamento do pokemon da API',
          () async {
        final jsonResponse = {
          "results": [
            {
              "name": "Pikachu",
              "id": "0",
              "height": 0,
              "weight": 0,
            },
          ]
        };

        when(() => client.get(any())).thenAnswer(
              (_) async => ResponseDTO(
            statusCode: 200,
            data: jsonResponse,
          ),
        );

        when(() => PokemonDetailAdapterMock().fromMap(any()))
            .thenReturn(PokemonDetailsEntity.empty());

        final result = await repository.getPokemonDetail('');
        expect(result.isLeft(), isTrue);
        expect(result.swap().getOrElse(() => DetailException('')), isA<DetailException>());
        verify(() => client.get(any())).called(1);
      });
}
