class PokemonDetailEntity {
  final String name;
  final String image;
  final int id;
  final int weight;
  final int height;

  PokemonDetailEntity({
    required this.name,
    required this.image,
    required this.id,
    required this.weight,
    required this.height,
  });

  factory PokemonDetailEntity.empty() => PokemonDetailEntity(
        name: '',
        image: '',
        id: 0,
        weight: 0,
        height: 0,
      );
}
