import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/presentation/custom_error_card_widget.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/filters_page/presentation/filters_page_controller.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/choice_chip_item.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/save_button_widget.dart';
import 'package:podberi_ru/features/filters_page/presentation/show_more_page.dart';

class FiltersPage extends ConsumerStatefulWidget {
  final String whereFrom;

  const FiltersPage({super.key, required this.whereFrom});

  @override
  ConsumerState<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends ConsumerState<FiltersPage> {
  final List<String> bankNamesList = [
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
  final List<String> cashBackNamesList = [
    'Баллы',
    'Рубли',
    'Не важно',
    'Мили',
  ];
  final List<String> deliveryNamesList = [
    'Любая',
    'Курьером',
    'По почте',
    'В отделе'
  ];
  final List<String> paySystemNamesList = ['Любая', 'МИР', 'MasterCard', 'VISA'];
  final List<String> additionalConditionsNamesList = [
    'Бесплатное обслуживание',
    'С процентом на остаток',
    'Еще условие',
    'И еще условия'
  ];
  List<String> selectedBanks = [];
  List<String> selectedCashBack = [];
  List<String> selectedDelivery = [];
  List<String> selectedPaySystem = [];
  List<String> selectedAdditionalConditions = [];
  @override
  void didChangeDependencies() {
    switch (widget.whereFrom){
      case 'homePage':
        if(ref.watch(filterBanksFromHomePageStateProvider.notifier).state.isNotEmpty){
          for(int i = 0; i<ref.watch(filterBanksFromHomePageStateProvider.notifier).state.length; i++){
            selectedBanks.add(ref.watch(filterBanksFromHomePageStateProvider.notifier).state[i]);
          }
        }
        if(ref.watch(filterCashBackFromHomePageStateProvider.notifier).state.isNotEmpty){
          selectedCashBack = ref.watch(filterCashBackFromHomePageStateProvider);
        }
        if(ref.watch(filterPaySystemFromHomePageStateProvider.notifier).state.isNotEmpty){
          selectedPaySystem = ref.watch(filterPaySystemFromHomePageStateProvider);
        }
        break;
      case 'selectProductPage':
        if(ref.watch(filterBanksFromSelectProductPageStateProvider.notifier).state.isNotEmpty){
          for(int i = 0; i<ref.watch(filterBanksFromSelectProductPageStateProvider.notifier).state.length; i++){
            selectedBanks.add(ref.watch(filterBanksFromSelectProductPageStateProvider.notifier).state[i]);
          }
        }
        if(ref.watch(filterCashBackFromSelectProductPageStateProvider.notifier).state.isNotEmpty){
          selectedCashBack = ref.watch(filterCashBackFromSelectProductPageStateProvider);
        }
        if(ref.watch(filterPaySystemFromSelectProductPageStateProvider.notifier).state.isNotEmpty){
          selectedPaySystem = ref.watch(filterPaySystemFromSelectProductPageStateProvider);
        }
        break;
    }
    super.didChangeDependencies();
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
                title: Text('Фильтры'),
                leading: IconButton(
                    onPressed: () {
                      //setState(() {
                        if (widget.whereFrom == "homePage") {
                          ref
                              .watch(
                              filterBanksFromHomePageStateProvider.notifier)
                              .state = selectedBanks;
                          ref
                              .watch(
                              filterCashBackFromHomePageStateProvider.notifier)
                              .state = selectedCashBack;

                          ref
                              .watch(filterPaySystemFromHomePageStateProvider
                              .notifier)
                              .state = selectedPaySystem;
                        }
                        if (widget.whereFrom == "selectProductPage") {
                          ref
                              .watch(filterBanksFromSelectProductPageStateProvider
                              .notifier)
                              .state = selectedBanks;

                          ref
                              .watch(filterCashBackFromSelectProductPageStateProvider
                              .notifier)
                              .state = selectedCashBack;

                          ref
                              .watch(filterPaySystemFromSelectProductPageStateProvider
                              .notifier)
                              .state = selectedPaySystem;
                        }
                    //  });


                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
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
                      const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 20),
                        child: Center(
                          child: Text(
                            'Найдено по запросу (2)',
                            style: TextStyle(
                                color: ThemeApp.backgroundBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Container(
                        color: ThemeApp.darkestGrey,
                        height: 1,
                        width: double.infinity,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 26, bottom: 15, left: 15),
                            child: Text(
                              'Банк',
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
                                      onTapSetState: (){
                                        setState(() {

                                        });
                                      },
                                       filters: selectedBanks,
                                        providerName: widget.whereFrom == 'selectProductPage' ?filterBanksFromSelectProductPageStateProvider : filterBanksFromHomePageStateProvider,
                                        banksList: allBanks);
                                  }));
                                },
                                child: const Text(
                                  'Показать все',
                                  style: TextStyle(
                                      color: ThemeApp.darkestGrey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ChoiceChipItem(
                          length: 6,
                          banksList: allBanks,
                        filters: selectedBanks,
                        providerName: widget.whereFrom == 'selectProductPage' ?filterBanksFromSelectProductPageStateProvider : filterBanksFromHomePageStateProvider,
                      ),
                      Container(
                        color: ThemeApp.darkestGrey,
                        height: 1,
                        width: double.infinity,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                        child: Text(
                          'Кэшбек',
                          style: TextStyle(
                              color: ThemeApp.backgroundBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      ChoiceChipItem(
                          providerName: widget.whereFrom == 'selectProductPage' ?filterCashBackFromSelectProductPageStateProvider : filterCashBackFromHomePageStateProvider,

                          length: cashBackNamesList.length,
                          itemsNames: cashBackNamesList,
                          filters: selectedCashBack),
                      Container(
                        color: ThemeApp.darkestGrey,
                        height: 1,
                        width: double.infinity,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                        child: Text(
                          'Доставка',
                          style: TextStyle(
                              color: ThemeApp.backgroundBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      ChoiceChipItem(
                          providerName: widget.whereFrom == 'selectProductPage' ?filterDeliveryFromSelectProductPageStateProvider : filterDeliveryFromHomePageStateProvider,

                          length: deliveryNamesList.length,
                          itemsNames: deliveryNamesList,
                          filters: selectedDelivery),
                      Container(
                        color: ThemeApp.darkestGrey,
                        height: 1,
                        width: double.infinity,
                      ),
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
                      ChoiceChipItem(
                          length: paySystemNamesList.length,
                          itemsNames: paySystemNamesList,
                          filters: selectedPaySystem,
                        providerName: widget.whereFrom == 'selectProductPage' ?filterPaySystemFromSelectProductPageStateProvider : filterPaySystemFromHomePageStateProvider,
                      ),
                      Container(
                        color: ThemeApp.darkestGrey,
                        height: 1,
                        width: double.infinity,
                      ),
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
                      ChoiceChipItem(
                          length: additionalConditionsNamesList.length,
                          itemsNames: additionalConditionsNamesList,
                          filters: selectedAdditionalConditions,
                        providerName: widget.whereFrom == 'selectProductPage' ?filterAdditionalConditionsFromSelectProductPageStateProvider : filterAdditionalConditionsFromHomePageStateProvider,
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
            onTap: () {
              setState(() {
                if (widget.whereFrom == "homePage") {
                  ref
                      .watch(
                      filterBanksFromHomePageStateProvider.notifier)
                      .state =[];
                }
                if (widget.whereFrom == "selectProductPage") {
                  ref
                      .watch(filterBanksFromSelectProductPageStateProvider
                      .notifier)
                      .state = [];
                }
                selectedBanks.clear();
                selectedCashBack.clear();
                selectedDelivery.clear();
                selectedPaySystem.clear();
                selectedAdditionalConditions.clear();
              });
            },
          ),
        );
      },
      error: (error, _) {
        return Scaffold(
            body: CustomScrollView(slivers: [
          SliverFillRemaining(
              child: CustomErrorPageWidget(
            error: error.toString(),
            bottomPadding: 72,
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
