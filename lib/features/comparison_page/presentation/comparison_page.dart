import 'package:flutter/material.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/comparison_page/presentation/widgets/comparison_data_table_widgets/comparison_data_table_widget.dart';
import 'package:podberi_ru/features/comparison_page/presentation/widgets/product_comparison_widgets/product_comparison_widget.dart';


class ComparisonPage extends StatefulWidget {
  const ComparisonPage({super.key});

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'Микрозаймы',
    'РКО'
  ];
  List<String> comparisonList = ['Тинькофф', 'Сбербанк', 'ВТБ', 'Газпромбанк'];

  List<String> selectedBankProducts = [];
  final _controllerBestOffers = PageController(
    viewportFraction: 0.9,
  );
  final _controllerSecondPageView = PageController(
    viewportFraction: 0.9,
  );

  double currentPageOnFirstPageView = 0;
  double currentPageOnSecondPageView = 0;

  @override
  void initState() {
    secondProductDescription = comparisonList[0];
    firstProductDescription = comparisonList[0];
    _controllerSecondPageView.addListener(() {
      setState(() {
        currentPageOnSecondPageView =
            _controllerSecondPageView.page!.toDouble();
        secondProductDescription =
            comparisonList[currentPageOnSecondPageView.toInt()];
      });
    });
    _controllerBestOffers.addListener(() {
      setState(() {
        currentPageOnFirstPageView = _controllerBestOffers.page!.toDouble();
        firstProductDescription =
            comparisonList[currentPageOnFirstPageView.toInt()];
      });
    });
    super.initState();
  }

  String firstProductDescription = '';
  String secondProductDescription = '';

  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 15)
    ]; //sized box is a padding on start

    for (var element in bankProductsNamesList) {
      list.add(CustomChoiceChip(
        onTap: () {
          setState(() {});
        },
        element: element,
        selectedBankProducts: selectedBankProducts,
        bankProductsNamesList: bankProductsNamesList,
      ));
    }
    list.add(const SizedBox(
      width: 15,
    )); //add padding on end

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Сравнение'),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 18, bottom: 18),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: list(),
                    )),
              ),
            ),
          ),
          ProductComparisonWidget(
              onDeleteInFirstList: () {
                setState(() {});
              },
              comparisonList: comparisonList,
              controllerBestOffers: _controllerBestOffers,
              controllerSecondPageView: _controllerSecondPageView,
              currentPageOnFirstPageView: currentPageOnFirstPageView,
              currentPageOnSecondPageView: currentPageOnSecondPageView,
              onDeleteInSecondList: () {
                setState(() {});
              }),
          ComparisonDataTableWidget(
              firstProductDescription: firstProductDescription,
              secondProductDescription: secondProductDescription),
        ],
      ),
    );
  }
}
