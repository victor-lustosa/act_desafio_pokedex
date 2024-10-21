import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_detail_entity.dart';
import 'package:act_desafio_pokedex/app/design_system/configs/app_colors.dart';
import 'package:act_desafio_pokedex/app/shared/views_exceptions/default_error_message_exception.dart';
import 'package:act_desafio_pokedex/app/ui/stores/pokemon_details_store.dart';
import 'package:act_desafio_pokedex/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/di/dependencies_injection.dart';
import '../../core/domain/entities/pokemon_entity.dart';
import '../../design_system/components/loadings/loadings_widget.dart';
import '../../design_system/components/top_bar/top_bar_widget.dart';
import '../../design_system/configs/app_fonts.dart';
import '../../shared/enums/types_enum.dart';
import '../../shared/states/generic_states.dart';

class PokemonDetailsView extends StatefulWidget {
  const PokemonDetailsView({super.key, this.entity});

  final PokemonEntity? entity;

  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  late final PokemonDetailsStore store;
  PokemonDetailsEntity? pokemonDetailsEntity = PokemonDetailsEntity.empty();

  @override
  void initState() {
    super.initState();
    store = injector.get<PokemonDetailsStore>();
    if(widget.entity != null){
      store.getDetails(widget.entity!);
    } else {
      Modular.to.navigate(MainModule.homeRoute);
    }
  }

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
              Observer(
                builder: (context) {
                  if (store.state is DataFetchedState) {
                    pokemonDetailsEntity =
                        (store.state as DataFetchedState).entities;
                    if (pokemonDetailsEntity == null) {
                      return DefaultErrorMessageException(
                          message: 'Ops! Houve um erro ao buscar o pokemon.');
                    }
                    return Column(
                      children: [
                        Container(
                          width: context.sizeOf.width,
                          margin: EdgeInsets.only(left: 24, right: 24, bottom: 40),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x19071095),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 24,
                                      top: 20,
                                    ),
                                    child: Text(
                                      pokemonDetailsEntity!.name,
                                      style: AppFonts.defaultFont(
                                        color: AppColors.cardTitle,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 221,
                                margin: EdgeInsets.only(top: 48),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(
                                      pokemonDetailsEntity!.image,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 130,
                                margin: EdgeInsets.only(bottom: 48, top: 48),

                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 16),
                                      child: Text(
                                        'Tipo',
                                        style: AppFonts.defaultFont(
                                          color: Color.fromRGBO(0, 0, 0, 0.7),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount:
                                            pokemonDetailsEntity!.types.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(height: 6);
                                        },
                                        itemBuilder: (context, index) {
                                          return Image.asset(
                                              height: 25,
                                              width: 84,
                                              PokemonTypes.fromType(
                                                      pokemonDetailsEntity!
                                                          .types[index])
                                                  .icon);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 240,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(bottom: 24,left: 24),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 24),
                                      child: Text(
                                        'Habilidade',
                                        style: AppFonts.defaultFont(
                                          color: Color.fromRGBO(0, 0, 0, 0.7),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: pokemonDetailsEntity!
                                            .abilities.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(height: 6);
                                        },
                                        itemBuilder: (context, index) {
                                          return Text(
                                            softWrap: true,
                                            pokemonDetailsEntity!
                                                .abilities[index],
                                            style: AppFonts.defaultFont(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.9),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 130,
                                margin: EdgeInsets.only(bottom: 24,right: 24),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 24),
                                      child: Text(
                                        'Altura',
                                        style: AppFonts.defaultFont(
                                          color: Color.fromRGBO(0, 0, 0, 0.7),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${pokemonDetailsEntity!.height/10} m',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 130,
                                margin: EdgeInsets.only(bottom: 48,right: 24),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 24),
                                      child: Text(
                                        'Peso',
                                        style: AppFonts.defaultFont(
                                          color: Color.fromRGBO(0, 0, 0, 0.7),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${pokemonDetailsEntity!.weight/10} kg',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (store.state is ExceptionState) {
                    return DefaultErrorMessageException(
                        message: (store.state as ExceptionState).message);
                  } else {
                    return SizedBox(
                      width: context.sizeOf.width,
                      height: context.sizeOf.height / 1.5,
                      child: const Center(
                        child: LoadingWidget(
                          androidRadius: 4,
                          iosRadius: 14,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );

  }

}
