import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/presentation/product_card_widget_with_buttons.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'РКО'
  ];

  List<String> selectedBankProducts = [];

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[const SizedBox(width: 15)];

    for (var element in bankProductsNamesList) {
      list.add(
        Padding(
            padding: const EdgeInsets.only(left: 3, right: 3),
            child: ChoiceChip(
              label: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(element),
                  ),
                  selectedBankProducts.contains(element)
                      ? SvgPicture.asset('assets/icons/delete_icon.svg')
                      : const SizedBox.shrink(),
                ],
              ),
              labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: selectedBankProducts.contains(element)
                      ? ThemeApp.mainWhite
                      : ThemeApp.backgroundBlack),
              selected: selectedBankProducts.contains(element),
              selectedColor: ThemeApp.mainBlue,
              backgroundColor: ThemeApp.grey,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(14),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
              onSelected: (bool value) {
                setState(() {
                  if (value) {
                    if (!selectedBankProducts.contains(element)) {
                      selectedBankProducts.clear();
                      selectedBankProducts.add(element);
                    }
                  } else {
                    selectedBankProducts.removeWhere((String name) {
                      return name == element;
                    });
                  }
                });
              },
            )),
      );
    }
    list.add(const SizedBox(
      width: 15,
    ));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Избранное'),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 2)),
          SliverStack(
            insetOnOverlap: true,
            children: [
              SliverPositioned.fill(
                child: SliverFillRemaining(
                  child: Container(
                    //height: double.infinity,
                    margin: const EdgeInsets.only(top: 2, bottom: 72),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ThemeApp.mainWhite,
                    ),
                  ),
                ),
              ),
              SliverContainer(
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeApp.mainWhite,
                  ),
                  child: Container(
                    alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(top: 30),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: list,
                          )),
                    ),
                ),

                sliver: SliverPadding(
                  padding:
                      EdgeInsets.only(top: 90, right: 15, left: 15, bottom: 15),
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: 2,
                          (context, index) => const ProductCardWidgetWithButtons(
                              productName: 'Тинькофф Black',
                              productShortDescription:
                                  'На остаток - до 5%\nБесплатное обслуживание\nСнятие без % - 500 000 руб.\nДоставка 1-2 дня\nБез овердрафта',
                              productRating: '4.8',
                              bankLogoIconPath:
                                  'assets/icons/tinkoff_logo_icon.svg'))),
                ),
              ),
            ],
          ),
          SliverPadding(padding: EdgeInsets.only(top: 2)),
        ],
      ),
    );
  }
}
