import 'package:act_desafio_pokedex/app/core/configs/app_consts/app_consts.dart';
import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_detail_entity.dart';

class PokemonDetailAdapter {
  static final PokemonDetailAdapter _singleton = PokemonDetailAdapter._internal();

  factory PokemonDetailAdapter() {
    return _singleton;
  }

  PokemonDetailAdapter._internal();

  PokemonDetailEntity fromMap(dynamic data) {
    return PokemonDetailEntity(
      name: data['name'],
      image: '${AppConsts.pokemonImagesUrl}${data['id']}.png',
      id: data['id'],
      weight: data['weight'],
      height: data['height'],
    );
  }
}
