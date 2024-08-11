import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_detail_entity.dart';
import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/core/domain/exceptions/exceptions.dart';
import 'package:act_desafio_pokedex/app/core/infra/use_cases/pokemon_use_case_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mocks/mocks.dart';

main() {
  final repository = PokemonRepositoryMock();

  final usecases = PokemonUseCasesImpl(repository: repository);
  test('Deve retornar uma lista de pokemons', () async {


    when(() => repository.get('', ''))
        .thenAnswer((_) async => const Right(<PokemonEntity>[]));
    final result = await usecases.get('', '');
    expect(result, isA<Right>());
    expect(result | null, isA<List<PokemonEntity>>());
  });

  test('Deve retornar uma exception em caso de erro', () async {
    when(() => repository.get('', ''))
        .thenAnswer((_) async => Left(GetException('')));
    final result = await usecases.get('', '');
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<GetException>());
  });

  test('Deve retornar uma lista de pokemons por pesquisa', () async {
    when(() => repository.getBySearch(''))
        .thenAnswer((_) async => const Right(<PokemonEntity>[]));
    final result = await usecases.getBySearch('');
    expect(result, isA<Right>());
    expect(result | null, isA<List<PokemonEntity>>());
  });

  test('Deve retornar uma exception em caso de erro ao pesquisar', () async {
    when(() => repository.getBySearch(''))
        .thenAnswer((_) async => Left(SearchException('')));
    final result = await usecases.getBySearch('');
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<SearchException>());
  });

  test('Deve retornar os detalhes de um pokemon', () async {
    when(() => repository.getPokemonDetail(''))
        .thenAnswer((_) async => Right(PokemonDetailEntity.empty()));
    final result = await usecases.getPokemonDetail('');
    expect(result, isA<Right>());
    expect(result | null, isA<PokemonDetailEntity>());
  });

  test('Deve retornar uma exception em caso de erro ao retornar os detalhes de um pokemon', () async {
    when(() => repository.getPokemonDetail(''))
        .thenAnswer((_) async => Left(DetailException('')));
    final result = await usecases.getPokemonDetail('');
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<DetailException>());
  });
}
