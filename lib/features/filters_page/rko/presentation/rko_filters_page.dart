import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/pagination_params_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/credit_cards/presentation/credit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/rko/presentation/rko_controller.dart';
import 'package:podberi_ru/features/filters_page/debit_cards/presentation/widgets/show_more_banks_page.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/choice_chip_with_many_choice_item.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/save_button_widget.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/show_more_page.dart';
import 'package:sliver_tools/sliver_tools.dart';


class RkoFiltersPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///страница с фильтрами
  const RkoFiltersPage(
      {super.key, required this.basicApiPageSettingsModel});

  @override
  ConsumerState<RkoFiltersPage> createState() =>
      _RkoFiltersPageState();
}

class _RkoFiltersPageState
    extends ConsumerState<RkoFiltersPage> {
  final List<String> additionalConditionsNamesList = [
    'Мобильное приложение',
    'Кэшбэк по карте',
    'Для ИП',
    'Для ООО',
    'Зарплатный проект',
    'Выпуск бизнес-карты',
    'Выпуск КЭП',
    'Онлайн-бухгалтерия',
    'Персональный менеджер',
    'Банковские гарантии',
    'Валютный счет',
    'Дистанционная поддержка',
    'Проверка контрагентов',
    'Для ИП и ООО',
  ];
  List<String> selectedAdditionalConditions = [];
  List<String> selectedBanks = [];
  @override
  void didChangeDependencies() {
    selectedBanks= widget.basicApiPageSettingsModel.filters.banks??[];
    selectedAdditionalConditions=widget.basicApiPageSettingsModel.filters.features ?? [];
    super.didChangeDependencies();
  }

  void saveFilters() {
    setState(() {

      widget.basicApiPageSettingsModel.filters.banks=selectedBanks;
      widget.basicApiPageSettingsModel.filters.features= selectedAdditionalConditions;
    });
  }

  void clearFilters() {
    setState(() {
      widget.basicApiPageSettingsModel.filters.banks?.clear();
      widget.basicApiPageSettingsModel.filters.features?.clear();
      selectedAdditionalConditions.clear();
      selectedBanks.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: CustomScrollView(
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

                    ///костыль благодаря которому обновляется экран кредиток если выбран фильтр в доп услугах)))
                    ref.invalidate(rkoControllerProvider);
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
                        // ref
                        //     .watch(creditCardsControllerProvider(
                        //         widget.basicApiPageSettingsModel))
                        //     .when(data: (creditCards) {
                        //   return Padding(
                        //     padding: EdgeInsets.only(top: 30, bottom: 20),
                        //     child: Center(
                        //       child: Text(
                        //         'Найдено по запросу (${creditCards.itemsCount})',
                        //         style: TextStyle(
                        //             color: ThemeApp.backgroundBlack,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w400),
                        //       ),
                        //     ),
                        //   );
                        // }, error: (error, _) {
                        //   return const Padding(
                        //     padding: EdgeInsets.only(top: 30, bottom: 20),
                        //     child: Center(
                        //       child: Text(
                        //         'Найдено по запросу (0)',
                        //         style: TextStyle(
                        //             color: ThemeApp.backgroundBlack,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w400),
                        //       ),
                        //     ),
                        //   );
                        // }, loading: () {
                        //   return CircularProgressIndicator();
                        // }),
                        //
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
