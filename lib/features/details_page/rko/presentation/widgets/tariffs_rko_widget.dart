import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/rko/presentation/widgets/rko_tariff_conditions_widget.dart';
import 'package:podberi_ru/features/web_view_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

class TariffsRkoWidget extends StatefulWidget {
  final ListRkoModel productInfo;

  const TariffsRkoWidget({
    super.key,
    required this.productInfo,
  });

  @override
  State<TariffsRkoWidget> createState() => _TariffsRkoWidgetState();
}

class _TariffsRkoWidgetState extends State<TariffsRkoWidget> {
  List<ExpandableItem> ratesList() {
    List<ExpandableItem> list = [];
    for (int i = 0; i < widget.productInfo.rates!.length; i++) {
      list.add(ExpandableItem(
          title: widget.productInfo.rates![i].name,
          productInfo: widget.productInfo.rates![i]));
    }
    return list;
  }

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SliverStack(
      insetOnOverlap: true,
      children: [
        SliverPositioned.fill(
          child: SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Container(
              margin: EdgeInsets.only(top: 2, bottom: MediaQuery.of(context).padding.bottom),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
            ),
          ),
        ),
        SliverContainer(
            padding: const EdgeInsets.only(top: 30),
            margin:  EdgeInsets.only(top: 2, bottom:MediaQuery.of(context).padding.bottom),
            //width: MediaQuery.of(context).size.width,
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
               [
                  ExpansionPanelList.radio(
                    expandedHeaderPadding: EdgeInsets.only(top: 0, bottom: 15),
                          elevation: 0,
                          dividerColor: ThemeApp.grey,
                          expandIconColor: ThemeApp.backgroundBlack,
                          initialOpenPanelValue: widget.productInfo.rates?[0].name,
                          children: widget.productInfo.rates!.map<ExpansionPanelRadio>((RkoRatesListModel item) {
                            return ExpansionPanelRadio(
                                value: item.name,
                                canTapOnHeader: true,
                                backgroundColor: ThemeApp.mainWhite,
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                  return ListTile(title: Text(item.name),);
                                },
                                body: Column(
                                  children: [

                                    RkoConditionsWidget(productInfo: widget.productInfo, rkoRatesListModel: item,),
                                 // Container(color: ThemeApp.grey, height: 2,)
                                  ],
                                ));
                          }).toList(),
                        ),

                 Padding(
                   padding: const EdgeInsets.only(right: 15, left: 15,top: 18, bottom: 30),
                   child: MaterialButton(
                     height: 50,
                     onPressed: () {
                       Navigator.of(context, rootNavigator: true).push(
                           MaterialPageRoute(builder: (BuildContext context) {
                             return CustomWebViewPage(
                               url: widget.productInfo.refLink,
                             );
                           }));
                     },
                     color: ThemeApp.mainBlue,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(14)),
                     child: const Text(
                       'Оформить',
                       style: TextStyle(
                           color: ThemeApp.mainWhite,
                           fontWeight: FontWeight.w600,
                           fontSize: 14),
                     ),
                   ),
                 ),
                ],
              ),
            )
                  // return ExpansionTile(
                  //
                  //   key: Key(index.toString()), //attention
                  //   initiallyExpanded: index == selected,
                  //   title: Text(
                  //     widget.productInfo.rates![index].name,
                  //   ),
                  //   children: [
                  //     Text(widget
                  //         .productInfo.rates![index].descriptions!.transferCommission)
                  //   ],
                  //
                  // );

        ),
      ],
    );
  }
}

class ExpandableItem {
  final String title;
  final RkoRatesListModel productInfo;
  bool isExpanded;

  ExpandableItem({
    required this.title,
    required this.productInfo,
    this.isExpanded = true,
  });
}

