import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';

class PokemonAdapter {

  static final PokemonAdapter _singleton = PokemonAdapter._internal();

  factory PokemonAdapter() {
    return _singleton;
  }

  PokemonAdapter._internal();

   List<PokemonEntity> fromMapList(dynamic data) {
    List<PokemonEntity> list = [];
    for (dynamic entity in data['results']) {
      list.add(
        PokemonEntity(
          name: entity['name'],
          url: entity['url'],
        ),
      );
    }
    return list;
  }
}
