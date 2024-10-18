import 'package:act_desafio_pokedex/app/design_system/components/top_bar/top_bar_widget.dart';
import 'package:act_desafio_pokedex/app/design_system/configs/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../ui/stores/home_store.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_images.dart';
import '../buttons/icon_button_widget.dart';
import '../search_bar/search_bar_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {super.key,
      this.isTitleVisible,
      this.isBackButtonVisible,
      required this.store});

  final HomeStore store;
  final bool? isBackButtonVisible;
  final bool? isTitleVisible;

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
          TopBarWidget(
            topBarLabels: ['title', 'logo'],
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
