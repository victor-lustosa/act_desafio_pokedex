import 'dart:convert';

import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/core/domain/exceptions/exceptions.dart';
import 'package:act_desafio_pokedex/app/core/domain/repositories/repository.dart';
import 'package:act_desafio_pokedex/app/core/infra/adapters/pokemon_adapter.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../configs/app_consts/app_consts.dart';
import '../../domain/entities/pokemon_detail_entity.dart';
import '../adapters/pokemon_detail_adapter.dart';

abstract class GetDetailRepository {
  Future<Either<DetailException, PokemonDetailEntity?>> getPokemonDetail(String id);
}

abstract class PokemonRepository<R> extends Repository<R> implements GetDetailRepository{}

class PokemonRepositoryImpl implements PokemonRepository<List<PokemonEntity>>{
  final http.Client client;

  PokemonRepositoryImpl({required this.client});

  @override
  Future<Either<GetException,List<PokemonEntity>>> get(String page, String offset) async{
    try{
      final response = await client.get(Uri.parse('${AppConsts.pokemonsUrl}?limit=$page,&offset=$offset'));
      final results = jsonDecode(response.body) as Map<String, dynamic>;
      final data = results['results'] as List<dynamic>;
      final entity = PokemonAdapter().fromMapList(data);
      return Right(entity);
    } catch(_){
      return Left(GetException());
    }
  }

  @override
  Future<Either<SearchException,List<PokemonEntity>>> getBySearch(String query) async{
    try{
      final result = await client.get(Uri.parse('${AppConsts.pokemonsUrl}$query'));
      return Right(PokemonAdapter().fromMapList(result));
    } catch(_){
      return Left(SearchException());
    }
  }

  @override
  Future<Either<DetailException, PokemonDetailEntity?>> getPokemonDetail(String id) async {
    try{
      final result = await client.get(Uri.parse('${AppConsts.pokemonsUrl}$id'));
      return Right(PokemonDetailAdapter.fromMap(result));
    } catch(_){
      return Left(DetailException());
    }
  }
}