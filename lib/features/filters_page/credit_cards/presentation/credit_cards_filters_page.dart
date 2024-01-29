import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/page_controllers/credit_cards_controller.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/choice_chip_with_many_choice_item.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/save_button_widget.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/show_more_page.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'credit_cards_filters_page_controller.dart';

class CreditCardsFiltersPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///страница с фильтрами
  const CreditCardsFiltersPage(
      {super.key, required this.basicApiPageSettingsModel});

  @override
  ConsumerState<CreditCardsFiltersPage> createState() =>
      _CreditCardsFiltersPageState();
}

class _CreditCardsFiltersPageState
    extends ConsumerState<CreditCardsFiltersPage> {
  final List<String> noPercentPeriodNamesList = [
    'Не важно',
    'от 30 дней',
    'от 60 дней',
    'от 90 дней',
    'от 120 дней',
    'от 200 дней',
  ];

  final List<String> additionalConditionsNamesList = [
    'Бесплатное обслуживание',
    'Без справок о доходах',
    'Снятие без комиссии',
    'Кэшбэк рублями',
    'Бесконтактная оплата',
    'Виртуальная карта',
    'Samsung Pay',
    'Mir Pay',
    'Бесплатные уведомления',
    'Кэшбек милями',
    'Кэшбек баллами',
    'Моментальный выпуск',
    'Выпуск за день',
    'Выпуск допкарты',
    'Процент на остаток',
    'Карта рассрочки',
  ];
  List<String> selectedNoPercentPeriod = [];
  double selectedPercents = 0;
  List<String> selectedAdditionalConditions = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController selectedCreditLimit = TextEditingController();

  @override
  void didChangeDependencies() {
    switch (widget.basicApiPageSettingsModel.whereFrom) {
      case 'homePage':
        print(ref
            .watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider
                .notifier)
            .state);
        selectedNoPercentPeriod.add(ref
            .watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider
                .notifier)
            .state);

        selectedPercents = ref
            .watch(creditCardsFilterPercentsFromHomePageStateProvider.notifier)
            .state
            .toDouble();

        selectedAdditionalConditions = ref
            .watch(
                creditCardsFilterAdditionalConditionsFromHomePageStateProvider
                    .notifier)
            .state;

        selectedCreditLimit.text = ref
            .watch(
                creditCardsFilterCreditLimitFromHomePageStateProvider.notifier)
            .state
            .toString();

        break;
      case 'selectProductPage':
        selectedNoPercentPeriod.add(ref
            .watch(
                creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider
                    .notifier)
            .state);

        selectedPercents = ref
            .watch(creditCardsFilterPercentsFromSelectProductPageStateProvider
                .notifier)
            .state
            .toDouble();

        selectedAdditionalConditions = ref
            .watch(
                creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider
                    .notifier)
            .state;

        selectedCreditLimit.text = ref
            .watch(
                creditCardsFilterCreditLimitFromSelectProductPageStateProvider
                    .notifier)
            .state
            .toString();

        break;
    }
    super.didChangeDependencies();
  }

  void saveFilters() {
    print('sadjkfjklas');
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == "homePage") {
        if (selectedNoPercentPeriod.isNotEmpty) {
          ref
              .watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider
                  .notifier)
              .state = selectedNoPercentPeriod.first;
        } else {
          ref
              .watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider
                  .notifier)
              .state = '';
        }
        if (selectedPercents != 0) {
          ref
              .watch(
                  creditCardsFilterPercentsFromHomePageStateProvider.notifier)
              .state = selectedPercents.round();
        } else {
          ref
              .watch(
                  creditCardsFilterPercentsFromHomePageStateProvider.notifier)
              .state = 0;
        }
        if (selectedCreditLimit.text.isNotEmpty) {
          ref
              .watch(creditCardsFilterCreditLimitFromHomePageStateProvider
                  .notifier)
              .state = int.parse(selectedCreditLimit.text);
        } else {
          ref
              .watch(creditCardsFilterCreditLimitFromHomePageStateProvider
                  .notifier)
              .state = 0;
        }
        ref
            .watch(
                creditCardsFilterAdditionalConditionsFromHomePageStateProvider
                    .notifier)
            .state = selectedAdditionalConditions;
      }
      if (widget.basicApiPageSettingsModel.whereFrom == "selectProductPage") {
        if (selectedNoPercentPeriod.isNotEmpty) {
          ref
              .watch(
                  creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider
                      .notifier)
              .state = selectedNoPercentPeriod.first;
        } else {
          ref
              .watch(
                  creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider
                      .notifier)
              .state = '';
        }
        if (selectedPercents != 0) {
          ref
              .watch(creditCardsFilterPercentsFromSelectProductPageStateProvider
                  .notifier)
              .state = selectedPercents.round();
        } else {
          ref
              .watch(creditCardsFilterPercentsFromSelectProductPageStateProvider
                  .notifier)
              .state = 0;
        }
        if (selectedCreditLimit.text.isNotEmpty) {
          ref
              .watch(
                  creditCardsFilterCreditLimitFromSelectProductPageStateProvider
                      .notifier)
              .state = int.parse(selectedCreditLimit.text);
        } else {
          ref
              .watch(
                  creditCardsFilterCreditLimitFromSelectProductPageStateProvider
                      .notifier)
              .state = 0;
        }

        ref
            .watch(
                creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider
                    .notifier)
            .state = selectedAdditionalConditions;
      }
    });
  }

  void clearFilters() {
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == "homePage") {
        ref
            .watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider
                .notifier)
            .state = '';
        ref
            .watch(creditCardsFilterPercentsFromHomePageStateProvider.notifier)
            .state = 0;
        ref
            .watch(
                creditCardsFilterAdditionalConditionsFromHomePageStateProvider
                    .notifier)
            .state
            .clear();
        ref
            .watch(
                creditCardsFilterCreditLimitFromHomePageStateProvider.notifier)
            .state = 0;
      }
      if (widget.basicApiPageSettingsModel.whereFrom == "selectProductPage") {
        ref
            .watch(
                creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider
                    .notifier)
            .state = '';
        ref
            .watch(creditCardsFilterPercentsFromSelectProductPageStateProvider
                .notifier)
            .state = 0;
        ref
            .watch(
                creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider
                    .notifier)
            .state
            .clear();
        ref
            .watch(
                creditCardsFilterCreditLimitFromSelectProductPageStateProvider
                    .notifier)
            .state = 0;
      }
      selectedNoPercentPeriod.clear();
      selectedPercents = 0;
      selectedAdditionalConditions.clear();
      selectedCreditLimit.clear();
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
                    ref.refresh(creditCardsControllerProvider(
                        widget.basicApiPageSettingsModel));
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

                        const Padding(
                          padding:
                              EdgeInsets.only(top: 26, bottom: 15, left: 15),
                          child: Text(
                            'Льготный период',
                            style: TextStyle(
                                color: ThemeApp.backgroundBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        ChoiceChipWithManyChoiceItem(
                          length: noPercentPeriodNamesList.length,
                          itemsNames: noPercentPeriodNamesList,
                          filters: selectedNoPercentPeriod,
                          onTap: () {
                            setState(() {
                              selectedNoPercentPeriod.clear();
                            });
                          },
                        ),
                        Container(
                          color: ThemeApp.darkestGrey,
                          height: 1,
                          width: double.infinity,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 26, bottom: 15, left: 15),
                          child: Text(
                            'Кредитный лимит',
                            style: TextStyle(
                                color: ThemeApp.backgroundBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 26, left: 15, right: 15),
                          child: Form(
                            key: _formKey,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(14),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                                controller: selectedCreditLimit,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  fillColor: ThemeApp.grey,
                                  filled: true,
                                  counterText: '',
                                  counterStyle: TextStyle(fontSize: 0),
                                  labelText: 'Введите кредитный лимит',
                                  labelStyle: TextStyle(
                                      color: ThemeApp.darkestGrey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: ThemeApp.darkestGrey,
                          height: 1,
                          width: double.infinity,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 26, bottom: 15, left: 15),
                          child: Text(
                            'Ставка в %',
                            style: TextStyle(
                                color: ThemeApp.backgroundBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ThemeApp.grey,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 20, right: 15, left: 15),
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 26),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  "Выбранная ставка около ${selectedPercents.round().toString()} %",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: ThemeApp.backgroundBlack,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Slider(
                                  inactiveColor: ThemeApp.darkGrey,
                                  activeColor: ThemeApp.darkestGrey,
                                  thumbColor: ThemeApp.darkestGrey,
                                  value: selectedPercents,
                                  max: 100,
                                  label: selectedPercents.round().toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedPercents = value;
                                    });
                                  }),
                            ],
                          ),
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
