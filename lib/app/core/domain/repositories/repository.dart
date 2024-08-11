import 'package:act_desafio_pokedex/app/core/domain/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';

class ResponseDTO{
  ResponseDTO({required this.statusCode, required this.data});
  final int statusCode;
  final dynamic data;
}

abstract class Repository<R> implements GetRepository<R>, GetBySearchRepository<R> {}

//working with segregation interface principle, it's part of SOLID
abstract class GetRepository <R>{
  Future<Either<GetException, R?>> get(String page, String offset);
}

abstract class GetBySearchRepository<R> {
  Future<Either<SearchException, R?>> getBySearch(String query);
}

