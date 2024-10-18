import '../../design_system/configs/app_images.dart';

enum PokemonTypes{
  electric(AppImages.electricTag),
  normal(AppImages.normalTag),
  fire(AppImages.fireTag),
  water(AppImages.waterTag),
  grass(AppImages.grassTag),
  ice(AppImages.iceTag),
  fighting(AppImages.fightingTag),
  poison(AppImages.poisonTag),
  ground(AppImages.groundTag),
  flying(AppImages.flyingTag),
  psychic(AppImages.psychicTag),
  bug(AppImages.bugTag),
  rock(AppImages.rockTag),
  ghost(AppImages.ghostTag),
  dragon(AppImages.dragonTag),
  dark(AppImages.darkTag),
  steel(AppImages.steelTag),
  fairy(AppImages.fairyTag),
  unknown('');
  final String icon;
  const PokemonTypes(this.icon);
  static PokemonTypes fromType(String label) { // static parser method
    return values.firstWhere(
          (v) => v.name == label,
      orElse: () => PokemonTypes.unknown,
    );
  }
}