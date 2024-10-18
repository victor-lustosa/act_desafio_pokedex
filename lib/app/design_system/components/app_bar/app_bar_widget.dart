import 'package:act_desafio_pokedex/app/design_system/configs/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../ui/stores/home_store.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_images.dart';
import '../search_bar/search_bar_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.store});

  final HomeStore store;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(160);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pokemons',
                style: AppFonts.defaultFont(
                  fontSize: 20,
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image.asset(
                width: 32,
                height: 32,
                AppImages.logoPokedex,
              )
            ],
          ),
          SearchBarWidget(
            controller: widget.store.searchController,
            searchAction: widget.store.onSearchAction,
            cleanAction: widget.store.onCleanAction,
            onChange: widget.store.onChange,
          ),
        ],
      ),
    );
  }
}
