
import '../../configs/app_consts.dart';
import '../../domain/entities/pokemon_detail_entity.dart';

class PokemonDetailAdapter {
  static final PokemonDetailAdapter _singleton = PokemonDetailAdapter._internal();

  factory PokemonDetailAdapter() {
    return _singleton;
  }

  PokemonDetailAdapter._internal();

  PokemonDetailsEntity fromMap(dynamic data) {
    return PokemonDetailsEntity(
      abilities: AbilitiesAdapter.fromMapList(data['abilities']),
      types: TypesAdapter.fromMapList(data['types']),
      name: data['name'],
      image: '${AppConsts.pokemonImagesUrl}${data['id']}.png',
      id: data['id'],
      weight: data['weight'],
      height: data['height'],
    );
  }
}

class AbilitiesAdapter {
  static List<String> fromMapList(dynamic json) {
    List<String> abilitiesList = [];
    for (dynamic ability in json) {
      abilitiesList.add(ability['ability']['name']);
    }
    return abilitiesList;
  }
}

class TypesAdapter {
  static List<String> fromMapList(dynamic json) {
    List<String> typesList = [];
    for (dynamic type in json) {
      typesList.add(type['type']['name']);
    }
    return typesList;
  }
}