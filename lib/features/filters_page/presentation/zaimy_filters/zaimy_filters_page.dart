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

import '../show_more_page.dart';
import 'zaimy_filters_page_controller.dart';

class ZaimyFiltersPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///страница с фильтрами
  const ZaimyFiltersPage({super.key, required this.basicApiPageSettingsModel});

  @override
  ConsumerState<ZaimyFiltersPage> createState() => _ZaimyFiltersPageState();
}

class _ZaimyFiltersPageState extends ConsumerState<ZaimyFiltersPage> {
  final List<String> termNamesList = [
    'Тинькофф банк',
    'Газпромбанк',
    'Сбербанк',
    'ВТБ банк',
    'Альфа банк',
    'Росбанк',
    'МТС банк',
    'Райфайзен Банк',
    'Россельхозбанк',
    'Банк Уралсиб',
  ];
  final List<String> sumNamesList = [
    'Баллы',
    'Рубли',
    'Не важно',
    'Мили',
  ];
  final List<String> percentsNamesList = [
    'Любая',
    'МИР',
    'MasterCard',
    'VISA',
    'Union Pay',
  ];

  List<String> selectedTerm = [];
  TextEditingController selectedSum = TextEditingController();
  List<String> selectedPercents = [];

  @override
  void didChangeDependencies() {
    switch (widget.basicApiPageSettingsModel.whereFrom) {
      case 'homePage':
        if (ref
            .watch(zaimyFilterTermFromHomePageStateProvider.notifier)
            .state
            .isNotEmpty) {
          for (int i = 0;
              i <
                  ref
                      .watch(zaimyFilterTermFromHomePageStateProvider.notifier)
                      .state
                      .length;
              i++) {
            selectedTerm.add(ref
                .watch(zaimyFilterTermFromHomePageStateProvider.notifier)
                .state[i]);
          }
        }
        if (ref
            .watch(zaimyFilterSumFromHomePageStateProvider.notifier)
            .state != 0) {
          selectedSum.text = ref.watch(zaimyFilterSumFromHomePageStateProvider.notifier).state.toString();
        }
        if (ref
            .watch(zaimyFilterPercentsFromHomePageStateProvider.notifier)
            .state
            .isNotEmpty) {
          selectedPercents =
              ref.watch(zaimyFilterPercentsFromHomePageStateProvider);
        }
        break;
      case 'selectProductPage':
        if (ref
            .watch(zaimyFilterTermFromSelectProductPageStateProvider.notifier)
            .state
            .isNotEmpty) {
          for (int i = 0;
              i <
                  ref
                      .watch(zaimyFilterTermFromSelectProductPageStateProvider
                          .notifier)
                      .state
                      .length;
              i++) {
            selectedTerm.add(ref
                .watch(zaimyFilterTermFromSelectProductPageStateProvider.notifier)
                .state[i]);
          }
        }
        if (ref
            .watch(zaimyFilterSumFromSelectProductPageStateProvider.notifier)
            .state != 0) {
          selectedSum.text =
              ref.watch(zaimyFilterSumFromSelectProductPageStateProvider.notifier).state.toString();
        }
        if (ref
            .watch(zaimyFilterPercentsFromSelectProductPageStateProvider.notifier)
            .state
            .isNotEmpty) {
          selectedPercents =
              ref.watch(zaimyFilterPercentsFromSelectProductPageStateProvider);
        }
        break;
    }
    super.didChangeDependencies();
  }

  void saveFilters() {
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == "homePage") {
        ref.watch(zaimyFilterTermFromHomePageStateProvider.notifier).state =
            selectedTerm;
        // ref.watch(zaimyFilterSumFromHomePageStateProvider.notifier).state =
        //     selectedSum as int;

        ref.watch(zaimyFilterPercentsFromHomePageStateProvider.notifier).state =
            selectedPercents;
      }
      if (widget.basicApiPageSettingsModel.whereFrom == "selectProductPage") {
        ref
            .watch(zaimyFilterTermFromSelectProductPageStateProvider.notifier)
            .state = selectedTerm;

        // ref
        //     .watch(zaimyFilterSumFromSelectProductPageStateProvider.notifier)
        //     .state = selectedSum.text as int;

        ref
            .watch(zaimyFilterPercentsFromSelectProductPageStateProvider.notifier)
            .state = selectedPercents;
      }
    });
  }

  void clearFilters() {
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == "homePage") {
        ref.watch(zaimyFilterTermFromHomePageStateProvider.notifier).state = [];
        ref.watch(zaimyFilterSumFromHomePageStateProvider.notifier).state = 0;
        ref.watch(zaimyFilterPercentsFromHomePageStateProvider.notifier).state = [];
      }
      if (widget.basicApiPageSettingsModel.whereFrom == "selectProductPage") {
        ref
            .watch(zaimyFilterTermFromSelectProductPageStateProvider.notifier)
            .state = [];
        ref
            .watch(zaimyFilterSumFromSelectProductPageStateProvider.notifier)
            .state = 0;
        ref
            .watch(zaimyFilterPercentsFromSelectProductPageStateProvider.notifier)
            .state = [];
      }
      selectedTerm.clear();
      selectedSum.clear();
      selectedPercents.clear();
    });
  }

  @override
  Widget build(BuildContext context) {

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
                              'Срок займа',
                              style: TextStyle(
                                  color: ThemeApp.backgroundBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),

                      ChoiceChipWithManyChoiceItem(
                        length: termNamesList.length,
                        itemsNames: termNamesList,
                        filters: selectedTerm,
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
                      const Padding(
                        padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                        child: Text(
                          'Сумма займа',
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
                      ChoiceChipWithManyChoiceItem(
                        length: percentsNamesList.length,
                        itemsNames: percentsNamesList,
                        filters: selectedPercents,
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
