import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/comparison_page/presentation/widgets/mini_product_card_widget.dart';

class ComparisonPage extends StatefulWidget {
  const ComparisonPage({super.key});

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'РКО'
  ];
  List<int> comparisonList =[1,2,3,4];

  List<String> selectedBankProducts = [];
  final _controllerBestOffers = PageController(
    viewportFraction: 0.9,
  );

  double currentPage = 0;

  @override
  void initState() {
    _controllerBestOffers.addListener(() {
      setState(() {
        currentPage = _controllerBestOffers.page!.toDouble();
      });
    });
    super.initState();
  }
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
          SliverAppBar(
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
                      children: list,
                    )),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 30, left: 15, right: 15),
                    child: Text(
                      'Продукты в сравнении',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ThemeApp.backgroundBlack),
                    ),
                  ),
                  SizedBox(
                    height:80,
                    child: PageView(
                        physics: const BouncingScrollPhysics(),
                        controller: _controllerBestOffers,
                        children: List.generate(comparisonList.length, (index) => MiniProductCardWidget(onDelete: (){
                          setState(() {
                            comparisonList.removeAt(index);
                          });
                        },))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        comparisonList.length,
                            (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4),
                            alignment: Alignment.centerLeft,
                            height: currentPage == index ? 10 : 8,
                            width: currentPage == index ? 10 : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPage == index
                                  ? ThemeApp.backgroundBlack
                                  : ThemeApp.darkestGrey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
