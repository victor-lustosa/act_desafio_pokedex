import 'package:dartz/dartz.dart';

import '../exceptions/exceptions.dart';

abstract class UseCases<R>
    implements GetUseCases<R>, GetBySearchUseCases<R> {}

abstract class GetUseCases<R> {
  Future<Either<GetException, R?>> get(String page, String offset);
}

abstract class GetBySearchUseCases<R> {
  Future<Either<SearchException, R?>> getBySearch(String query);
}
