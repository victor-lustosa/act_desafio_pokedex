import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:act_desafio_pokedex/app/ui/components/search_not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies_injection.dart';
import '../../core/domain/entities/pokemon_entity.dart';
import '../../design_system/components/app_bar/app_bar_widget.dart';
import '../../design_system/components/buttons/floating_button_widget.dart';
import '../../design_system/components/loadings/loadings_widget.dart';
import '../../design_system/configs/app_colors.dart';
import '../../design_system/configs/app_fonts.dart';
import '../../shared/states/generic_states.dart';
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
      child: GestureDetector(
        onTap: () {
          if (View.of(context).viewInsets.bottom > 0.0) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          }
        },
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
                    return SearchNotFoundWidget();
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 16);
                          },
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            bottom: 20,
                          ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          controller: store.scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: pokemonsList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () =>
                                  store.showDialog(pokemonsList[index]),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x19071095),
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 16,
                                            top: 10,
                                          ),
                                          child: Text(
                                            pokemonsList[index].name,
                                            style: AppFonts.defaultFont(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 120,
                                      width: 120,
                                      margin: EdgeInsets.only(bottom: 6),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
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
                  return defaultMessage(
                      (store.state as ExceptionState).message, Colors.red);
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          resizeToAvoidBottomInset: false,
          floatingActionButton: Observer(builder: (context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedSlide(
                    duration: const Duration(milliseconds: 100),
                    offset: store.isPreviousButtonVisible
                        ? Offset.zero
                        : const Offset(0, 2),
                    child: FloatingButtonWidget(
                      heroTag: 'previous',
                      icon: Icons.arrow_back_rounded,
                      backgroundColor: AppColors.secondaryBlue,
                      iconColor: Colors.white,
                      size: 32,
                      action: store.callPreviousPage,
                    ),
                  ),
                  AnimatedSlide(
                    duration: const Duration(milliseconds: 100),
                    offset: store.isNextButtonVisible
                        ? Offset.zero
                        : const Offset(0, 2),
                    child: FloatingButtonWidget(
                      heroTag: 'next',
                      icon: Icons.arrow_forward_rounded,
                      backgroundColor: AppColors.secondaryBlue,
                      iconColor: Colors.white,
                      size: 32,
                      action: store.callNextPage,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
