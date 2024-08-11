import 'dart:convert';

import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/core/domain/exceptions/exceptions.dart';
import 'package:act_desafio_pokedex/app/core/domain/repositories/repository.dart';
import 'package:act_desafio_pokedex/app/core/infra/adapters/pokemon_adapter.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../configs/app_consts/app_consts.dart';
import '../../domain/entities/pokemon_detail_entity.dart';
import '../../external/dio_external.dart';
import '../adapters/pokemon_detail_adapter.dart';

abstract class GetDetailRepository {
  Future<Either<DetailException, PokemonDetailEntity?>> getPokemonDetail(String id);
}

abstract class PokemonRepository<R> extends Repository<R> implements GetDetailRepository{}

class PokemonRepositoryImpl implements PokemonRepository<List<PokemonEntity>>{
  final IHttpClient client;

  PokemonRepositoryImpl({required this.client});

  @override
  Future<Either<GetException,List<PokemonEntity>>> get(String page, String offset) async{
    try{
      final response = await client.get('${AppConsts.pokemonsUrl}?limit=$page,&offset=$offset');
      return Right(PokemonAdapter().fromMapList(jsonDecode(response.data)));
    } catch(_){
      return Left(GetException());
    }
  }

  @override
  Future<Either<SearchException,List<PokemonEntity>>> getBySearch(String query) async{
    try{
      final response = await client.get('${AppConsts.pokemonsUrl}$query');
      return Right(PokemonAdapter().fromMapList(jsonDecode(response.data)));
    } catch(_){
      return Left(SearchException());
    }
  }

  @override
  Future<Either<DetailException, PokemonDetailEntity?>> getPokemonDetail(String id) async {
    try{
      final response = await client.get('${AppConsts.pokemonsUrl}$id');
      return Right(PokemonDetailAdapter().fromMap(jsonDecode(response.data)['results'][0]));
    } catch(_){
      return Left(DetailException());
    }
  }
}