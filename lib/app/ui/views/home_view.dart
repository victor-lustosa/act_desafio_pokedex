import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:act_desafio_pokedex/app/core/domain/entities/pokemon_entity.dart';
import 'package:act_desafio_pokedex/app/shared/states/generic_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies_injection.dart';
import '../../design_system/components/loadings/loadings_widget.dart';
import '../../design_system/components/search_bar/search_bar_widget.dart';
import '../../design_system/configs/app_fonts.dart';
import '../stores/home_store.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = injector.get<HomeStore>();
    store.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: context.sizeOf.width,
          height: context.sizeOf.height,
          child: Observer(
            builder: (_) {
              if (store.state is DataFetchedState) {
                List<PokemonEntity> pokemonsList = (store.state as DataFetchedState).entities;
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 13),
                      child: SearchBarWidget(
                        controller: store.searchController,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 16);
                        },
                        padding:const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: pokemonsList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(18),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    pokemonsList[index].image,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      pokemonsList[index].name,
                                      style: AppFonts.defaultFont(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
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
                return Center(
                  child: Text(
                    (store.state as ExceptionState).message,
                    style: AppFonts.defaultFont(color: Colors.red),
                  ),
                );
              } else {
                return const Center(child: LoadingWidget(
                  androidRadius: 4,
                  iosRadius: 14,
                ),);
              }
            },
          ),
        ),
      ),
    );
  }
}
