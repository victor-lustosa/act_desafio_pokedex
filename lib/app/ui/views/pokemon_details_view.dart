import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:act_desafio_pokedex/app/design_system/configs/app_colors.dart';
import 'package:flutter/material.dart';

import '../../design_system/components/app_bar/app_bar_widget.dart';
import '../../design_system/components/top_bar/top_bar_widget.dart';

class PokemonDetailsView extends StatefulWidget {
  const PokemonDetailsView({super.key});

  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 40,
                  bottom: 24,
                ),
                child: TopBarWidget(
                  topBarLabels: ['backButton', 'logo'],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: context.sizeOf.width,
                    height: 600,
                    margin: EdgeInsets.only(left: 24, right: 24),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x19071095),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text("dsfsd"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
