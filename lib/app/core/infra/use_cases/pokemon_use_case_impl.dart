import 'package:dartz/dartz.dart';

import '../../domain/entities/pokemon_detail_entity.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/exceptions/exceptions.dart';
import '../../domain/use_cases/use_cases.dart';
import '../repositories/pokemon_repository_impl.dart';

abstract class GetDetailUseCase {
  Future<Either<DetailException, PokemonDetailsEntity?>> getPokemonDetail(String id);
}

abstract class PokemonUseCase<R> extends UseCases<R> implements GetDetailUseCase{}
class PokemonUseCasesImpl implements PokemonUseCase<List<PokemonEntity>?> {
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

  @override
  Future<Either<DetailException, PokemonDetailsEntity?>> getPokemonDetail(String id) async {
    try {
      final result = await repository.getPokemonDetail(id);
      return result;
    } on DetailException catch (e) {
      return Left(e);
    }
  }
}
