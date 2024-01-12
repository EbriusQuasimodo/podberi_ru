import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_error_card_widget.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/filters_page/presentation/debit_cards_filters/debit_cards_filters_page_controller.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/choice_chip_with_many_choice_item.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/choice_chip_with_one_choice_item.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/save_button_widget.dart';
import 'package:podberi_ru/features/filters_page/presentation/show_more_banks_page.dart';

import '../show_more_page.dart';
import 'credit_cards_filters_page_controller.dart';

class CreditCardsFiltersPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///страница с фильтрами
  const CreditCardsFiltersPage({super.key, required this.basicApiPageSettingsModel});

  @override
  ConsumerState<CreditCardsFiltersPage> createState() => _CreditCardsFiltersPageState();
}

class _CreditCardsFiltersPageState extends ConsumerState<CreditCardsFiltersPage> {

  final List<String> noPercentPeriodNamesList = [
    'Любой',
    'от 30 дней',
    'от 60 дней',
    'от 90 дней',
    'от 120 дней',
    'от 200 дней',
  ];
  final List<String> noPercentPeriodToApiNamesList = [
    '0',
    '30',
    '60',
    '90',
    '120',
    '200',
  ];
  final List<String> percentsNamesList = [
    'до 10 процентов',
    'до 30 процентов',
    'от 50 процентов',
  ];
  final List<String> percentsToApiNamesList = [
    '10',
    '30',
    '50',
  ];
TextEditingController creditLimit = TextEditingController();
  final List<String> additionalConditionsNamesList = [
    'Бесплатное обслуживание',
    'Без справок о доходах',
    'Снятие без комиссии',
    'Кэшбек рублями',
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
  String selectedNoPercentPeriod = '';
  String selectedPercents = '';
  List<String> selectedAdditionalConditions = [];

  @override
  void didChangeDependencies() {
    switch (widget.basicApiPageSettingsModel.whereFrom) {
      case 'homePage':
        if (ref
            .watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider.notifier)
            .state
            .isNotEmpty) {
          for (int i = 0;
              i <
                  ref
                      .watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider.notifier)
                      .state
                      .length;
              i++) {
            selectedNoPercentPeriod =ref
                .watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider.notifier)
                .state;
          }
        }

        if (ref
            .watch(creditCardsFilterPercentsFromHomePageStateProvider.notifier)
            .state.isNotEmpty) {
          selectedPercents =
              ref.watch(creditCardsFilterPercentsFromHomePageStateProvider.notifier).state;
        }
        if(ref.watch(creditCardsFilterAdditionalConditionsFromHomePageStateProvider.notifier).state.isNotEmpty){
          selectedAdditionalConditions = ref.watch(creditCardsFilterAdditionalConditionsFromHomePageStateProvider.notifier).state;
        }
        if(ref.watch(creditCardsFilterCreditLimitFromHomePageStateProvider.notifier).state !=0){
          creditLimit.text = ref.watch(creditCardsFilterCreditLimitFromHomePageStateProvider.notifier).state.toString();
        }
        break;
      case 'selectProductPage':
        if (ref
            .watch(creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider.notifier)
            .state
            .isNotEmpty) {
          for (int i = 0;
              i <
                  ref
                      .watch(creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider
                          .notifier)
                      .state
                      .length;
              i++) {
            selectedNoPercentPeriod=ref
                .watch(creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider.notifier)
                .state[i];
          }
        }
        if (ref
            .watch(creditCardsFilterPercentsFromSelectProductPageStateProvider.notifier)
            .state
            .isNotEmpty) {
          selectedPercents=
              ref.watch(creditCardsFilterPercentsFromSelectProductPageStateProvider.notifier).state;
        }
        if(ref.watch(creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider.notifier).state.isNotEmpty){
          selectedAdditionalConditions = ref.watch(creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider.notifier).state;
        }
        if(ref.watch(creditCardsFilterCreditLimitFromSelectProductPageStateProvider.notifier).state !=0){
          creditLimit.text = ref.watch(creditCardsFilterCreditLimitFromSelectProductPageStateProvider.notifier).state.toString();
        }
        break;
    }
    super.didChangeDependencies();
  }

  void saveFilters() {
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == "homePage") {
        ref.watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider.notifier).state =
            selectedNoPercentPeriod;
        ref.watch(creditCardsFilterPercentsFromHomePageStateProvider.notifier).state =
            selectedPercents;
        ref.watch(creditCardsFilterAdditionalConditionsFromHomePageStateProvider.notifier).state= selectedAdditionalConditions;
        //ref.watch(creditCardsFilterCreditLimitFromHomePageStateProvider.notifier).state = int.parse(creditLimit.text);
      }
      if (widget.basicApiPageSettingsModel.whereFrom == "selectProductPage") {
        ref.watch(creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider.notifier).state =
            selectedNoPercentPeriod;
        ref.watch(creditCardsFilterPercentsFromSelectProductPageStateProvider.notifier).state =
            selectedPercents;
        ref.watch(creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider.notifier).state= selectedAdditionalConditions;
        //ref.watch(creditCardsFilterCreditLimitFromSelectProductPageStateProvider.notifier).state = int.parse(creditLimit.text);
      }
    });
  }

  void clearFilters() {
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == "homePage") {
        ref.watch(creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider.notifier).state = '';
        ref.watch(creditCardsFilterPercentsFromSelectProductPageStateProvider.notifier).state = '';
        ref
            .watch(creditCardsFilterAdditionalConditionsFromHomePageStateProvider.notifier)
            .state = [];
        ref
            .watch(creditCardsFilterCreditLimitFromHomePageStateProvider.notifier)
            .state = 0;
      }
      if (widget.basicApiPageSettingsModel.whereFrom == "selectProductPage") {
        ref
            .watch(creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider.notifier)
            .state = '';
        ref
            .watch(creditCardsFilterPercentsFromSelectProductPageStateProvider.notifier)
            .state ='';
        ref
            .watch(creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider.notifier)
            .state = [];
        ref
            .watch(creditCardsFilterCreditLimitFromSelectProductPageStateProvider.notifier)
            .state = 0;
      }
      selectedNoPercentPeriod='';
      selectedPercents='';
      selectedAdditionalConditions.clear();
      creditLimit.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
print(selectedNoPercentPeriod);
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
                      print(selectedNoPercentPeriod);
                      saveFilters();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 2, bottom: 82),
                  padding: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeApp.mainWhite,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      ChoiceChipWithOneChoiceItem(
                        length: noPercentPeriodNamesList.length,
                       itemsNames: noPercentPeriodNamesList,
                        filters: selectedNoPercentPeriod,
                       itemsToApiNames: noPercentPeriodToApiNamesList,
                        onTap: (){setState(() {

                        });},
                      ),
                      Container(
                        color: ThemeApp.darkestGrey,
                        height: 1,
                        width: double.infinity,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                        child: Text(
                          'Кредитный лимит',
                          style: TextStyle(
                              color: ThemeApp.backgroundBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                   ///todo: add text field
                      Container(
                        color: ThemeApp.darkestGrey,
                        height: 1,
                        width: double.infinity,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                        child: Text(
                          'Ставка в %',
                          style: TextStyle(
                              color: ThemeApp.backgroundBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      ChoiceChipWithOneChoiceItem(
                        length: percentsNamesList.length,
                        itemsNames: percentsNamesList,
                        filters: selectedPercents,
                        itemsToApiNames: percentsToApiNamesList,
                        onTap: (){setState(() {

                        });},
                      ),
                      Container(
                        color: ThemeApp.darkestGrey,
                        height: 1,
                        width: double.infinity,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                            child: Text(
                              'Доп. условия',
                              style: TextStyle(
                                  color: ThemeApp.backgroundBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 26, bottom: 15, right: 15),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return ShowMorePage(
                                              onTapSaveButton: () {
                                                saveFilters();
                                              },
                                              onTapTrashButton: () {
                                                clearFilters();
                                              },
                                              filters: selectedAdditionalConditions,
                                              providerName: widget
                                                  .basicApiPageSettingsModel
                                                  .whereFrom ==
                                                  'selectProductPage'
                                                  ? creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider
                                                  : creditCardsFilterAdditionalConditionsFromHomePageStateProvider,
                                              filtersNamesList: additionalConditionsNamesList);
                                        }));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 40, top: 5),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: ThemeApp.backgroundBlack,
                                      size: 14,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      ChoiceChipWithManyChoiceItem(
                        length: additionalConditionsNamesList.length < 6 ? additionalConditionsNamesList.length : 6,
                        itemsNames: additionalConditionsNamesList,
                        filters: selectedAdditionalConditions,
                      ),
                    ],
                  ),
                ),
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
  }
}
