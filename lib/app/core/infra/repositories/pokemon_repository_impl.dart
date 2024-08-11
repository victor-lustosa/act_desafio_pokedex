import 'dart:convert';

import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/core/domain/exceptions/exceptions.dart';
import 'package:act_desafio_pokedex/app/core/domain/repositories/repository.dart';
import 'package:act_desafio_pokedex/app/core/infra/adapters/pokemon_adapter.dart';
import 'package:dartz/dartz.dart';

import '../../configs/app_consts.dart';
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
      if(response.statusCode != 200)  return const Right([]);
      return Right(PokemonAdapter().fromMapList(response.data));
    } catch(_){
      return Left(GetException('ocorreu um erro ao trazer dados do servidor'));
    }
  }

  @override
  Future<Either<SearchException,List<PokemonEntity>>> getBySearch(String query) async{
    try{
      final ResponseDTO response = await client.get('${AppConsts.pokemonsUrl}$query');
      if(response.statusCode != 200)  return const Right([]);
      return Right(PokemonAdapter().fromMapList(response.data));
    } catch(_){
      return Left(SearchException('ocorreu um erro ao trazer dados do servidor'));
    }
  }

  @override
  Future<Either<DetailException, PokemonDetailEntity?>> getPokemonDetail(String id) async {
    try{
      final response = await client.get('${AppConsts.pokemonsUrl}$id');
      if(response.statusCode != 200)  return Right(PokemonDetailEntity.empty());
      return Right(PokemonDetailAdapter().fromMap(response.data));
    } catch(_){
      return Left(DetailException('ocorreu um erro ao trazer dados do servidor'));
    }
  }
}