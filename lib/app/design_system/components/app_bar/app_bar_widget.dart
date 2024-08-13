import 'package:act_desafio_pokedex/app/design_system/configs/app_fonts.dart';
import 'package:flutter/Material.dart';

import '../../../ui/stores/home_store.dart';
import '../search_bar/search_bar_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.store});

  final HomeStore store;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(130);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Lista de Pokemons',
          style: AppFonts.defaultFont(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 15,
            bottom: 10,
          ),
          child: SearchBarWidget(
            controller: widget.store.searchController,
            action: widget.store.onAction,
            onChange: widget.store.onChange,
          ),
        ),
      ],
    );
  }
}
