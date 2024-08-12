import 'dart:io';

import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/design_system/components/app_bar/app_bar_widget.dart';
import 'package:act_desafio_pokedex/app/shared/states/generic_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies_injection.dart';
import '../../design_system/components/buttons/floating_button_widget.dart';
import '../../design_system/components/loadings/loadings_widget.dart';
import '../../design_system/configs/app_fonts.dart';
import '../stores/home_store.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeStore store;
  List<PokemonEntity> pokemonsList = [];

  @override
  void initState() {
    super.initState();
    store = injector.get<HomeStore>();
    store.fetchData();
  }

  defaultMessage(String message, Color color) => Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 100),
          width: 250,
          child: Text(
            message,
            style: AppFonts.defaultFont(color: color),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          store: store,
        ),
        body: SizedBox(
          width: context.sizeOf.width,
          height: context.sizeOf.height,
          child: Observer(
            builder: (_) {
              if (store.state is DataFetchedState) {
                pokemonsList = (store.state as DataFetchedState).entities;
                if (pokemonsList.isEmpty) {
                  return defaultMessage('Não foi encontrado nenhum pockemon com esse nome.',Colors.cyan);
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 16);
                        },
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        controller: store.scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: pokemonsList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap:() => Platform.isIOS ? null : store.showKotlinDialog(pokemonsList[index]),
                            child: Card(
                              elevation: 2,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, top: 10),
                                    child: Text(
                                      pokemonsList[index].name,
                                      style: AppFonts.defaultFont(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(18),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          pokemonsList[index].image,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (store.state is ExceptionState) {
                return defaultMessage((store.state as ExceptionState).message, Colors.red);
              } else {
                return const Center(
                  child: LoadingWidget(
                    androidRadius: 4,
                    iosRadius: 14,
                  ),
                );
              }
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: false,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSlide(
              duration: const Duration(microseconds: 1000),
              offset: store.isButtonScrollVisible ? Offset.zero : const Offset(0, 2),
              child: FloatingButtonWidget(
                icon: Icons.arrow_downward_rounded,
                backgroundColor: Colors.cyan,
                iconColor: Colors.white,
                size: 33,
                action: store.callNextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
