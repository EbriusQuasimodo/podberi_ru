import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/choice_chip_item.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/show_more_page.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
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
    'Бонусы/Баллы',
    'Не важно',
    'Рублями'
  ];
  final List<String> deliveryNamesList = [
    'Любая',
    'Курьером',
    'По почте',
    'В отделе'
  ];
  final List<String> paySystemNamesList = ['Любая', 'МИР', 'MastrCard', 'VISA'];
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Фильтры'),
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
                        padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                        child: Text(
                          'Банк',
                          style: TextStyle(
                              color: ThemeApp.backgroundBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 26, bottom: 15, right: 15),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return ShowMorePage(
                                    filters: selectedBanks,
                                    itemsNames: bankNamesList);
                              }));
                            },
                            child: Text(
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
                      itemsNames: bankNamesList, filters: selectedBanks),
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
                    length: cashBackNamesList.length,
                      itemsNames: cashBackNamesList, filters: selectedCashBack),
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
                    length: deliveryNamesList.length,
                      itemsNames: deliveryNamesList, filters: selectedDelivery),
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
                      filters: selectedPaySystem),
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
                      filters: selectedAdditionalConditions),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: ThemeApp.mainWhite,
        ),
        height: 80,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: MaterialButton(
                  height: 50,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Применить',
                    style: TextStyle(
                        color: ThemeApp.mainWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  color: ThemeApp.mainBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 15, bottom: 15),
              child: Material(
                borderRadius: BorderRadius.circular(14),
                color: ThemeApp.grey,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() {
                      selectedBanks.clear();
                      selectedCashBack.clear();
                      selectedDelivery.clear();
                      selectedPaySystem.clear();
                      selectedAdditionalConditions.clear();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: SvgPicture.asset(
                      'assets/icons/trash_icon.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ),
              // MaterialButton(
              //   height: 50,
              //   onPressed: () {},
              //   child: SvgPicture.asset('assets/icons/trash_icon.svg'),
              //   color: ThemeApp.grey,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(14)),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
