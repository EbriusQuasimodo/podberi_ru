import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/choice_chip_item.dart';

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
    'ВТБ банк'
  ];
  List<String> selectedBanks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Фильтры'),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 2, bottom: 72),
              padding: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
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
                  Padding(
                    padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                    child: Text(
                      'Банк',
                      style: TextStyle(
                          color: ThemeApp.backgroundBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  ChoiceChipItem(itmesNames: bankNamesList, filters: selectedBanks),
                  Container(
                    color: ThemeApp.darkestGrey,
                    height: 1,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                    child: Text(
                      'Кэшбек',
                      style: TextStyle(
                          color: ThemeApp.backgroundBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  ChoiceChipItem(itmesNames: bankNamesList, filters: selectedBanks),
                  Container(
                    color: ThemeApp.darkestGrey,
                    height: 1,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                    child: Text(
                      'Доставка',
                      style: TextStyle(
                          color: ThemeApp.backgroundBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  ChoiceChipItem(itmesNames: bankNamesList, filters: selectedBanks),
                  Container(
                    color: ThemeApp.darkestGrey,
                    height: 1,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                    child: Text(
                      'Платежная система',
                      style: TextStyle(
                          color: ThemeApp.backgroundBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  ChoiceChipItem(itmesNames: bankNamesList, filters: selectedBanks),
                  Container(
                    color: ThemeApp.darkestGrey,
                    height: 1,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 26, bottom: 15, left: 15),
                    child: Text(
                      'Доп. условия',
                      style: TextStyle(
                          color: ThemeApp.backgroundBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  ChoiceChipItem(itmesNames: bankNamesList, filters: selectedBanks),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
