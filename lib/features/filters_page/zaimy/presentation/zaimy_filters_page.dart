import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/page_controllers/zaimy_controller.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/choice_chip_with_many_choice_item.dart';
import 'package:podberi_ru/features/filters_page/shared_presentation/shared_widgets/save_button_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
    'Не важно',
    'от 30 дней',
    'от 60 дней',
    'от 90 дней',
    'от 120 дней',
    'от 200 дней',
  ];
  final _formKey = GlobalKey<FormState>();
  List<String> selectedTerm = [];
  TextEditingController selectedSum = TextEditingController();
  double selectedPercents = 0;

  @override
  void didChangeDependencies() {
    switch (widget.basicApiPageSettingsModel.whereFrom) {
      case 'homePage':
        selectedTerm.add(
            ref.watch(zaimyFilterTermFromHomePageStateProvider.notifier).state);

        selectedSum.text = ref
            .watch(zaimyFilterSumFromHomePageStateProvider.notifier)
            .state
            .toString();

        selectedPercents =
            ref.watch(zaimyFilterPercentsFromHomePageStateProvider).toDouble();

        break;
      case 'selectProductPage':
        selectedTerm.add(ref
            .watch(zaimyFilterTermFromSelectProductPageStateProvider.notifier)
            .state);

        selectedSum.text = ref
            .watch(zaimyFilterSumFromSelectProductPageStateProvider.notifier)
            .state
            .toString();

        selectedPercents = ref
            .watch(zaimyFilterPercentsFromSelectProductPageStateProvider)
            .toDouble();

        break;
    }
    super.didChangeDependencies();
  }

  void saveFilters() {
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == "homePage") {
        if (selectedTerm.isNotEmpty) {
          ref.watch(zaimyFilterTermFromHomePageStateProvider.notifier).state =
              selectedTerm.first;
        } else {
          ref.watch(zaimyFilterTermFromHomePageStateProvider.notifier).state =
              '';
        }
        if (selectedSum.text.isNotEmpty) {
          ref.watch(zaimyFilterSumFromHomePageStateProvider.notifier).state =
              int.parse(selectedSum.text);
        } else {
          ref.watch(zaimyFilterSumFromHomePageStateProvider.notifier).state =
              0;
        }

        ref.watch(zaimyFilterPercentsFromHomePageStateProvider.notifier).state =
            selectedPercents.round();
      }
      if (widget.basicApiPageSettingsModel.whereFrom == "selectProductPage") {
        if (selectedTerm.isNotEmpty) {
          ref
              .watch(zaimyFilterTermFromSelectProductPageStateProvider.notifier)
              .state = selectedTerm.first;
        } else {
          ref
              .watch(zaimyFilterTermFromSelectProductPageStateProvider.notifier)
              .state = '';
        }
        if (selectedSum.text.isNotEmpty) {
          ref
              .watch(zaimyFilterSumFromSelectProductPageStateProvider.notifier)
              .state = int.parse(selectedSum.text);
        } else {
          ref
              .watch(zaimyFilterSumFromSelectProductPageStateProvider.notifier)
              .state = 0;
        }

        ref
            .watch(
                zaimyFilterPercentsFromSelectProductPageStateProvider.notifier)
            .state = selectedPercents.round();
      }
    });
  }

  void clearFilters() {
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == "homePage") {
        ref.watch(zaimyFilterTermFromHomePageStateProvider.notifier).state = '';
        ref.watch(zaimyFilterSumFromHomePageStateProvider.notifier).state = 0;
        ref.watch(zaimyFilterPercentsFromHomePageStateProvider.notifier).state =
            0;
      }
      if (widget.basicApiPageSettingsModel.whereFrom == "selectProductPage") {
        ref
            .watch(zaimyFilterTermFromSelectProductPageStateProvider.notifier)
            .state = '';
        ref
            .watch(zaimyFilterSumFromSelectProductPageStateProvider.notifier)
            .state = 0;
        ref
            .watch(
                zaimyFilterPercentsFromSelectProductPageStateProvider.notifier)
            .state = 0;
      }
      selectedTerm.clear();
      selectedSum.clear();
      selectedPercents = 0;
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
                    ///костыль благодаря которому обновляется экран займов если выбран фильтр в доп услугах)))
                    ref.refresh(zaimyControllerProvider(
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
                              selectedTerm.clear();
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
                            'Сумма займа',
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
                                controller: selectedSum,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  fillColor: ThemeApp.grey,
                                  filled: true,
                                  counterText: '',
                                  counterStyle: TextStyle(fontSize: 0),
                                  labelText: 'Введите сумму займа',
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
