
import '../../configs/app_consts.dart';
import '../../domain/entities/pokemon_entity.dart';

class PokemonAdapter {

  static final PokemonAdapter _singleton = PokemonAdapter._internal();

  factory PokemonAdapter() {
    return _singleton;
  }

  PokemonAdapter._internal();

   List<PokemonEntity> fromMapList(dynamic data) {
    List<PokemonEntity> list = [];
    if(data['results'] == null){
      return [
        PokemonEntity(
        name: data['name'],
        url: '',
        image: '${AppConsts.pokemonImagesUrl}${data['id']}.png',
      ),];
    }else{
      for (dynamic entity in data['results']) {
        String url = entity['url'].substring(34);
        List<String> paths = url.split('/');
        list.add(
          PokemonEntity(
            name: entity['name'],
            url: entity['url'],
            image: '${AppConsts.pokemonImagesUrl}${paths[0]}.png',
          ),
        );
      }
    }
    return list;
  }
}
