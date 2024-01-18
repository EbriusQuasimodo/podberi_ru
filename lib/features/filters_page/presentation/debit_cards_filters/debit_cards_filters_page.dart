import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_error_card_widget.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/filters_page/presentation/debit_cards_filters/debit_cards_filters_page_controller.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/choice_chip_with_many_choice_item.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/save_button_widget.dart';
import 'package:podberi_ru/features/filters_page/presentation/show_more_banks_page.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../show_more_page.dart';

class DebitCardsFiltersPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///страница с фильтрами
  const DebitCardsFiltersPage({super.key, required this.basicApiPageSettingsModel});

  @override
  ConsumerState<DebitCardsFiltersPage> createState() => _DebitCardsFiltersPageState();
}

class _DebitCardsFiltersPageState extends ConsumerState<DebitCardsFiltersPage> {
///todo разобраться с кэшбеком (нет поля по которому я могу фильтроваться)
//   final List<String> cashBackNamesList = [
//     'Баллы', //баллов
//     'Рубли', //рублей
//     'Не важно',
//     'Мили', //милей
//   ];

  final List<String> paySystemNamesList = [
    'Не важно',
    'МИР',
    'Mastercard',
    'VISA',
    'Union Pay',
  ];
  final List<String> additionalConditionsNamesList = [
    'Бесплатное обслуживание',
    'Виртуальная карта',
    'Моментальный выпуск',
    'Бесконтактная оплата',
    'Доступно с 14 лет',
    'Детская карта',
    'Samsung Pay',
    'Mir Pay',
    'Выпуск за день',
    'Выпуск допкарты',
    'Рассрочка на покупки',
    'Снятие наличных везде',
    'Мультивалютная карта',
  ];
  List<String> selectedBanks = [];
  //List<String> selectedCashBack = [];
  List<String> selectedPaySystem = [];
  List<String> selectedAdditionalConditions = [];

  @override
  void didChangeDependencies() {
    switch (widget.basicApiPageSettingsModel.whereFrom) {
      case 'homePage':
        if (ref
            .watch(debitCardsFilterBanksFromHomePageStateProvider.notifier)
            .state
            .isNotEmpty) {

            selectedBanks = ref
                .watch(debitCardsFilterBanksFromHomePageStateProvider.notifier)
                .state;

        }
        // if (ref
        //     .watch(debitCardsFilterCashBackFromHomePageStateProvider.notifier)
        //     .state
        //     .isNotEmpty) {
        //   selectedCashBack = ref.watch(debitCardsFilterCashBackFromHomePageStateProvider);
        // }
        if (ref
            .watch(debitCardsFilterPaySystemFromHomePageStateProvider.notifier)
            .state
            .isNotEmpty) {
          selectedPaySystem =
              ref.watch(debitCardsFilterPaySystemFromHomePageStateProvider);
        }
        if(ref.watch(debitCardsFilterAdditionalConditionsFromHomePageStateProvider.notifier).state.isNotEmpty){
          selectedAdditionalConditions = ref.watch(debitCardsFilterAdditionalConditionsFromHomePageStateProvider);
        }
        break;
      case 'selectProductPage':
        if (ref
            .watch(debitCardsFilterBanksFromSelectProductPageStateProvider.notifier)
            .state
            .isNotEmpty) {

            selectedBanks =ref
                .watch(debitCardsFilterBanksFromSelectProductPageStateProvider.notifier)
                .state;
        }
        // if (ref
        //     .watch(debitCardsFilterCashBackFromSelectProductPageStateProvider.notifier)
        //     .state
        //     .isNotEmpty) {
        //   selectedCashBack =
        //       ref.watch(debitCardsFilterCashBackFromSelectProductPageStateProvider);
        // }
        if (ref
            .watch(debitCardsFilterPaySystemFromSelectProductPageStateProvider.notifier)
            .state
            .isNotEmpty) {
          selectedPaySystem =
              ref.watch(debitCardsFilterPaySystemFromSelectProductPageStateProvider);
        }
        if(ref.watch(debitCardsFilterAdditionalConditionsFromSelectProductPageStateProvider.notifier).state.isNotEmpty){
          selectedAdditionalConditions = ref.watch(debitCardsFilterAdditionalConditionsFromSelectProductPageStateProvider);
        }
        break;
    }
    super.didChangeDependencies();
  }

  void saveFilters() {
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == "homePage") {
        ref.watch(debitCardsFilterBanksFromHomePageStateProvider.notifier).state =
            selectedBanks;
        // ref.watch(debitCardsFilterCashBackFromHomePageStateProvider.notifier).state =
        //     selectedCashBack;

        ref.watch(debitCardsFilterPaySystemFromHomePageStateProvider.notifier).state =
            selectedPaySystem;
      }
      ref
          .watch(
          debitCardsFilterAdditionalConditionsFromHomePageStateProvider
              .notifier)
          .state = selectedAdditionalConditions;
      if (widget.basicApiPageSettingsModel.whereFrom == "selectProductPage") {
        ref
            .watch(debitCardsFilterBanksFromSelectProductPageStateProvider.notifier)
            .state = selectedBanks;

        // ref
        //     .watch(debitCardsFilterCashBackFromSelectProductPageStateProvider.notifier)
        //     .state = selectedCashBack;

        ref
            .watch(debitCardsFilterPaySystemFromSelectProductPageStateProvider.notifier)
            .state = selectedPaySystem;
        ref
            .watch(
            debitCardsFilterAdditionalConditionsFromSelectProductPageStateProvider
                .notifier)
            .state = selectedAdditionalConditions;
      }
    });
  }

  void clearFilters() {
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == "homePage") {
        ref.watch(debitCardsFilterBanksFromHomePageStateProvider.notifier).state = [];
        ref.watch(debitCardsFilterCashBackFromHomePageStateProvider.notifier).state = [];
        ref.watch(debitCardsFilterPaySystemFromHomePageStateProvider.notifier).state = [];
        ref.watch(debitCardsFilterAdditionalConditionsFromHomePageStateProvider.notifier).state =[];
      }
      if (widget.basicApiPageSettingsModel.whereFrom == "selectProductPage") {
        ref
            .watch(debitCardsFilterBanksFromSelectProductPageStateProvider.notifier)
            .state = [];
        ref
            .watch(debitCardsFilterCashBackFromSelectProductPageStateProvider.notifier)
            .state = [];
        ref
            .watch(debitCardsFilterPaySystemFromSelectProductPageStateProvider.notifier)
            .state = [];
        ref.watch(debitCardsFilterAdditionalConditionsFromSelectProductPageStateProvider.notifier).state =[];
      }
      selectedBanks.clear();
    //  selectedCashBack.clear();
      selectedPaySystem.clear();
      selectedAdditionalConditions.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(allBanksControllerProvider).when(
      data: (allBanks) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                scrolledUnderElevation: 0,
                backgroundColor: ThemeApp.mainWhite,
                pinned: true,
                title: const Text('Фильтры'),
                leading: IconButton(
                    onPressed: () {
                      saveFilters();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
              SliverStack(
                insetOnOverlap: true,
                children: [
                  SliverPositioned.fill(
                    child: SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: true,
                      child: Container(
                        margin: const EdgeInsets.only(top: 2, bottom: 82),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ThemeApp.mainWhite,
                        ),
                      ),
                    ),
                  ),
                  SliverContainer(
                    margin: const EdgeInsets.only(top: 2, bottom: 82),
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeApp.mainWhite,
                      ),
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          // const Padding(
                          //   padding: EdgeInsets.only(top: 30, bottom: 20),
                          //   child: Center(
                          //     child: Text(
                          //       'Найдено по запросу (2)',
                          //       style: TextStyle(
                          //           color: ThemeApp.backgroundBlack,
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.w400),
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   color: ThemeApp.darkestGrey,
                          //   height: 1,
                          //   width: double.infinity,
                          // ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return ShowMoreBanksPage(
                                          onTapSaveButton: () {
                                            saveFilters();
                                          },
                                          onTapTrashButton: () {
                                            clearFilters();
                                          },
                                          filters: selectedBanks,
                                          providerName: widget
                                              .basicApiPageSettingsModel
                                              .whereFrom ==
                                              'selectProductPage'
                                              ? debitCardsFilterBanksFromSelectProductPageStateProvider
                                              : debitCardsFilterBanksFromHomePageStateProvider,
                                          banksList: allBanks.items);
                                    }));
                              },
                              child: const Row(
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.only(top: 26, bottom: 15, left: 15, right: 20),
                                    child: Text(
                                      'Банк',
                                      style: TextStyle(
                                          color: ThemeApp.backgroundBlack,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 26, bottom: 15, right: 15),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: ThemeApp.backgroundBlack,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ChoiceChipWithManyChoiceItem(
                            length: allBanks.items.length < 6 ? allBanks.items.length : 6,
                            banksList: allBanks.items,
                            filters: selectedBanks,
                            onTap: () {
                              setState(() {
                              });
                            },
                          ),
                          Container(
                            color: ThemeApp.darkestGrey,
                            height: 1,
                            width: double.infinity,
                          ),
                          // const Padding(
                          //   padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                          //   child: Text(
                          //     'Кэшбек',
                          //     style: TextStyle(
                          //         color: ThemeApp.backgroundBlack,
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 14),
                          //   ),
                          // ),
                          // ChoiceChipWithManyChoiceItem(
                          //     onTap: () {
                          //       setState(() {
                          //       });
                          //     },
                          //     length: cashBackNamesList.length,
                          //     itemsNames: cashBackNamesList,
                          //     filters: selectedCashBack),
                          // Container(
                          //   color: ThemeApp.darkestGrey,
                          //   height: 1,
                          //   width: double.infinity,
                          // ),
                          const Padding(
                            padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                            child: Text(
                              'Платежная система',
                              style: TextStyle(
                                  color: ThemeApp.backgroundBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                          ChoiceChipWithManyChoiceItem(
                            length: paySystemNamesList.length,
                            itemsNames: paySystemNamesList,
                            filters: selectedPaySystem,
                            onTap: () {
                              setState(() {
                              });
                            },
                          ),
                          Container(
                            color: ThemeApp.darkestGrey,
                            height: 1,
                            width: double.infinity,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return ShowMorePage(
                                              onTapSaveButton: () {
                                                saveFilters();
                                              },
                                              onTapTrashButton: () {
                                                clearFilters();
                                              },
                                              filters: selectedAdditionalConditions,
                                              filtersNamesList:
                                              additionalConditionsNamesList);
                                        }));
                              },
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 26,
                                        bottom: 15,
                                        left: 15,
                                        right: 20),
                                    child: Text(
                                      'Доп. условия',
                                      style: TextStyle(
                                          color: ThemeApp.backgroundBlack,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 26, bottom: 15, right: 15),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: ThemeApp.backgroundBlack,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ChoiceChipWithManyChoiceItem(
                            length: additionalConditionsNamesList.length < 6 ? additionalConditionsNamesList.length : 6,
                            itemsNames: additionalConditionsNamesList,
                            filters: selectedAdditionalConditions,
                            onTap: () {
                              setState(() {
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                  ),
                ],
              ),

            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SaveButtonWidget(
            onTapSaveButton: () {
              saveFilters();
            },
            onTapTrashButton: () {
              clearFilters();
            },
          ),
        );
      },
      error: (error, _) {
        return Scaffold(
            body: CustomScrollView(slivers: [
          SliverFillRemaining(
              child: CustomErrorPageWidget(
            buttonName: 'Вернуться',
            onTap: () {
              Navigator.of(context).pop();
            },
            error: error.toString(),
            bottomPadding: 2,
          ))
        ]));
      },
      loading: () {
        return const Scaffold(
            body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
                child: CustomLoadingCardWidget(
              bottomPadding: 2,
            )),
          ],
        ));
      },
    );
  }
}