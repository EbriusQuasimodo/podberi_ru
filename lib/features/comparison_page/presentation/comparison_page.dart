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
  final List<String> bankProductsNamesListFilter = [
    'Дебетовые карты',
    'Кредитные карты',
    'Микрозаймы',
    'РКО'
  ];
  List<String> comparisonList = ['Тинькофф', 'Сбербанк', 'ВТБ', 'Газпромбанк'];

  List<String> selectedBankProductsFilter = ['Дебетовые карты'];
  final controllerBestOffers = PageController(
    viewportFraction: 0.9,
  );
  final controllerSecondPageView = PageController(
    viewportFraction: 0.9,
  );

  double currentPageOnFirstPageView = 0;
  double currentPageOnSecondPageView = 0;

  @override
  void initState() {
    secondProductDescription = comparisonList[0];
    firstProductDescription = comparisonList[0];
    controllerSecondPageView.addListener(() {
      setState(() {
        currentPageOnSecondPageView = controllerSecondPageView.page!.toDouble();
        secondProductDescription =
            comparisonList[currentPageOnSecondPageView.toInt()];
      });
      print(currentPageOnSecondPageView);
    });

    controllerBestOffers.addListener(() {

      setState(() {
        currentPageOnFirstPageView = controllerBestOffers.page!.toDouble();
        firstProductDescription =
            comparisonList[currentPageOnFirstPageView.toInt()];
      });
      print(currentPageOnFirstPageView);
    });
    super.initState();
  }

  @override
  void dispose() {
    controllerSecondPageView.dispose();
    controllerBestOffers.dispose();
    super.dispose();
  }

  String firstProductDescription = '';
  String secondProductDescription = '';

  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 15)
    ]; //sized box is a padding on start

    for (var element in bankProductsNamesListFilter) {
      list.add(CustomChoiceChip(
        productType: '',
        onTap: () {
          setState(() {});
        },
        element: element,
        selectedBankProducts: selectedBankProductsFilter,
        bankProductsNamesList: bankProductsNamesListFilter,
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
          comparisonList.isNotEmpty
              ? SliverToBoxAdapter(
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
                )
              : const SliverToBoxAdapter(child: SizedBox()),
          comparisonList.isNotEmpty
              ? ProductComparisonWidget(
                  onDeleteInFirstList: () {
                    setState(() {
                      if(comparisonList.length ==1){
                      secondProductDescription='';}
                    });
                  },
                  comparisonList: comparisonList,
                  controllerBestOffers: controllerBestOffers,
                  controllerSecondPageView: controllerSecondPageView,
                  currentPageOnFirstPageView: currentPageOnFirstPageView,
                  currentPageOnSecondPageView: currentPageOnSecondPageView,
                  onDeleteInSecondList: () {
                    setState(() { if(comparisonList.length ==1){
                      secondProductDescription='';}});
                  })
              : SliverFillRemaining(
                  child: Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 72),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ThemeApp.mainWhite,
                    ),
                    child: Column(
                      children: [
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(right: 15, left: 15),
                          child: Text(
                            'У вас пока нет продуктов в сравнении',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: ThemeApp.backgroundBlack),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 17,
                          ),
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width - 30,
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            padding: const EdgeInsets.only(
                                top: 17, bottom: 16, left: 75, right: 75),
                            onPressed: () {},
                            color: ThemeApp.mainBlue,
                            child: const Text(
                              'В каталог',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: ThemeApp.mainWhite,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          comparisonList.isNotEmpty
              ? ComparisonDataTableWidget(
                  firstProductDescription: firstProductDescription,
                  secondProductDescription: secondProductDescription)
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
