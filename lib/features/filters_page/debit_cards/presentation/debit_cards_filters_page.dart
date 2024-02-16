import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/domain/pagination_params_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/debit_cards/presentation/debit_cards_controller.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/choice_chip_with_many_choice_item.dart';
import 'package:podberi_ru/features/filters_page/debit_cards/presentation/widgets/show_more_banks_page.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/save_button_widget.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/show_more_page.dart';

import 'package:sliver_tools/sliver_tools.dart';


class DebitCardsFiltersPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///страница с фильтрами
  const DebitCardsFiltersPage(
      {super.key, required this.basicApiPageSettingsModel});

  @override
  ConsumerState<DebitCardsFiltersPage> createState() =>
      _DebitCardsFiltersPageState();
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
    selectedAdditionalConditions=widget.basicApiPageSettingsModel.filters.features ??[];
    selectedBanks= widget.basicApiPageSettingsModel.filters.banks??[];
    selectedPaySystem= widget.basicApiPageSettingsModel.filters.paySystem??[];
    super.didChangeDependencies();
  }

  void saveFilters() {
    setState(() {
      widget.basicApiPageSettingsModel.filters.features=selectedAdditionalConditions;
      widget.basicApiPageSettingsModel.filters.banks=selectedBanks;
      widget.basicApiPageSettingsModel.filters.paySystem=selectedPaySystem;
    });
  }

  void clearFilters() {
    setState(() {
      widget.basicApiPageSettingsModel.filters.features?.clear();
      widget.basicApiPageSettingsModel.filters.banks?.clear();
      widget.basicApiPageSettingsModel.filters.paySystem?.clear();
      selectedBanks.clear();
      //  selectedCashBack.clear();
      selectedPaySystem.clear();
      selectedAdditionalConditions.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(allBanksControllerProvider(PaginationParamsModel(fetch: 20, page: 1)).future),
        child: CustomScrollView(
          physics: new ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0,
              backgroundColor: ThemeApp.mainWhite,
              pinned: true,
              title: const Text('Фильтры'),
              leading: IconButton(
                  onPressed: ()  {
                    saveFilters();
                    Navigator.of(context).pop();
                    ///костыль благодаря которому обновляется экран дебетовок если выбран фильтр в доп услугах)))
                    ref.refresh(debitCardsControllerProvider( widget.basicApiPageSettingsModel));
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
                        ref.watch(allBanksControllerProvider(PaginationParamsModel(fetch: 6, page: 1))).when(
                          data: (allBanks) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                            itemCount: allBanks.itemsCount);
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
                                  length: allBanks.items.length < 6
                                      ? allBanks.items.length
                                      : 6,
                                  banksList: allBanks.items,
                                  filters: selectedBanks,
                                  onTap: () {
                                    setState(() {});
                                  },
                                ),
                              ],
                            );
                          },
                          error: (error, _) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 26, bottom: 15, left: 15, right: 20),
                                  child: Text(
                                    'Банк',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: ThemeApp.backgroundBlack,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15, right: 20),
                                  child: Text(
                                    'Не удалось загрузить список всех банков',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: ThemeApp.darkestGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 15, left: 15, right: 20),
                                  child: Text(
                                    error.toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        color: ThemeApp.backgroundBlack,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            );
                          },
                          loading: () {
                            return const CustomLoadingCardWidget(
                              bottomPadding: 2,
                            );
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
                          padding:
                              EdgeInsets.only(top: 26, bottom: 15, left: 15),
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
                            setState(() {});
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
                                      top: 26, bottom: 15, left: 15, right: 20),
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
                          length: additionalConditionsNamesList.length < 6
                              ? additionalConditionsNamesList.length
                              : 6,
                          itemsNames: additionalConditionsNamesList,
                          filters: selectedAdditionalConditions,
                          onTap: () {
                            setState(() {});
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SaveButtonWidget(
        onTapSaveButton: () {
          saveFilters();
        },
        onTapTrashButton: () {
          clearFilters();
        },
      ),
    );
  }
}
