import 'package:dartz/dartz.dart';

import '../exceptions/exceptions.dart';

abstract class UseCases
    implements GetUseCases, GetBySearchUseCases {}

abstract class GetUseCases<R> {
  Future<R?> get(String page, String offset);
}

abstract class GetBySearchUseCases<R> {
  Future<R?> getBySearch(String query);
}
