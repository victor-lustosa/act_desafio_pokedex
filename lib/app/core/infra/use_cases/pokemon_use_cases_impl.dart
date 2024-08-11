import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/exceptions/exceptions.dart';
import '../../domain/use_cases/use_cases.dart';
import '../repositories/pokemon_repository_impl.dart';

class PokemonUseCasesImpl implements UseCases {
  final PokemonRepository<List<PokemonEntity>> repository;

  PokemonUseCasesImpl({required this.repository});

  @override
  Future<Either<GetException, List<PokemonEntity>?>> get(String page, String offset) async {
    try {
      final result = await repository.get(page, offset);
      return result;
    } on GetException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<SearchException, List<PokemonEntity>?>> getBySearch(String query) async {
    try {
      final result = await repository.getBySearch(query);
      return result;
    } on SearchException catch (e) {
      return Left(e);
    }
  }
}
