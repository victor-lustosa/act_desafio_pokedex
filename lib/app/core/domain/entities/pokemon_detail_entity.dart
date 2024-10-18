class PokemonDetailsEntity {
  final String name;
  final String image;
  final int id;
  final int weight;
  final int height;
  final List<String> abilities;
  final List<String> types;

  PokemonDetailsEntity({
    required this.abilities,
    required this.types,
    required this.name,
    required this.image,
    required this.id,
    required this.weight,
    required this.height,
  });

  factory PokemonDetailsEntity.empty() => PokemonDetailsEntity(
        abilities: [],
        types: [],
        name: '',
        image: '',
        id: 0,
        weight: 0,
        height: 0,
      );
}
