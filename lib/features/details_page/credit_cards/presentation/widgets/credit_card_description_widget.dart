import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/web_view_widget.dart';

class CreditCardDescriptionWidget extends StatefulWidget {
  final ListCreditCardsModel productInfo;

  ///виджет с подробным описанием условий банковского продукта
  ///используется в [LoadDetailsPageByProductType]
  const CreditCardDescriptionWidget({
    super.key,
    required this.productInfo,
  });

  @override
  State<CreditCardDescriptionWidget> createState() =>
      _CreditCardDescriptionWidgetState();
}

class _CreditCardDescriptionWidgetState
    extends State<CreditCardDescriptionWidget> {
  bool showAll = false;

  Map<String, Style> htmlStyle() {
    return {
      "body": Style(
        margin: Margins.zero,
        padding: HtmlPaddings.zero,
        color: ThemeApp.backgroundBlack,
        fontSize: FontSize(13),
        fontWeight: FontWeight.w300,
      ),
      "p": Style(
        margin: Margins.zero,
        padding: HtmlPaddings.zero,
        color: ThemeApp.backgroundBlack,
        fontSize: FontSize(13),
        fontWeight: FontWeight.w300,
      ),
      "a": Style(
        textDecoration: TextDecoration.none,
      ),
      "br": Style(
        lineHeight: const LineHeight(0.1),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2, bottom: 72),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 30, bottom: 10, left: 15, right: 15),
                child: Text(
                  'Описание',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeApp.backgroundBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              height: 2,
              color: ThemeApp.grey,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 20),
              child: Text(
                'Оформление и получение карты',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: ThemeApp.backgroundBlack),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
              child: Html(
                data: widget.productInfo.descriptions!.execution,
                onLinkTap: (url, _, __) {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CustomWebViewPage(
                      url: url!,
                    );
                  }));
                },
                style: htmlStyle(),
              ),
            ),
            Container(
              height: 2,
              color: ThemeApp.grey,

            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 20),
              child: Text(
                'Безпроцентный период',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: ThemeApp.backgroundBlack),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
              child: Html(
                data: widget.productInfo.descriptions!.noPercent,
                onLinkTap: (url, _, __) {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CustomWebViewPage(
                      url: url!,
                    );
                  }));
                },
                style: htmlStyle(),
              ),
            ),
            showAll
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 2,
                        color: ThemeApp.grey,

                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 20),
                        child: Text(
                          'Тарифы и лимиты',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ThemeApp.backgroundBlack),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, left: 15, right: 15),
                        child: Html(
                          data: widget.productInfo.descriptions!.rates,
                          onLinkTap: (url, _, __) {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return CustomWebViewPage(
                                url: url!,
                              );
                            }));
                          },
                          style: htmlStyle(),
                        ),
                      ),
                      Container(
                        height: 2,
                        color: ThemeApp.grey,

                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 20),
                        child: Text(
                          'Дополнительные услуги',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ThemeApp.backgroundBlack),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, left: 15, right: 15),
                        child: Html(
                          data: widget.productInfo.descriptions!.addServices,
                          onLinkTap: (url, _, __) {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return CustomWebViewPage(
                                url: url!,
                              );
                            }));
                          },
                          style: htmlStyle(),
                        ),
                      ),
                      Container(
                        height: 2,
                        color: ThemeApp.grey,

                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 20),
                        child: Text(
                          'Снятие наличных',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ThemeApp.backgroundBlack),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, left: 15, right: 15),
                        child: Html(
                          data: widget.productInfo.descriptions!.cashWithdrawal,
                          onLinkTap: (url, _, __) {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return CustomWebViewPage(
                                url: url!,
                              );
                            }));
                          },
                          style: htmlStyle(),
                        ),
                      ),
                      Container(
                        height: 2,
                        color: ThemeApp.grey,

                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 20),
                        child: Text(
                          'Переводы',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ThemeApp.backgroundBlack),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, left: 15, right: 15),
                        child: Html(
                          data: widget.productInfo.descriptions!.transfers,
                          onLinkTap: (url, _, __) {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return CustomWebViewPage(
                                url: url!,
                              );
                            }));
                          },
                          style: htmlStyle(),
                        ),
                      ),
                      Container(
                        height: 2,
                        color: ThemeApp.grey,

                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 20),
                        child: Text(
                          'Рефинансирование',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ThemeApp.backgroundBlack),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, left: 15, right: 15),
                        child: Html(
                          data: widget.productInfo.descriptions!.refinancing,
                          onLinkTap: (url, _, __) {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return CustomWebViewPage(
                                url: url!,
                              );
                            }));
                          },
                          style: htmlStyle(),
                        ),
                      ),
                      Container(
                        height: 2,
                        color: ThemeApp.grey,

                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 20),
                        child: Text(
                          'Итог по карте',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ThemeApp.backgroundBlack),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, left: 15, right: 15),
                        child: Html(
                          data: widget.productInfo.descriptions!.result,
                          //doNotRenderTheseTags: {'br'},
                          onLinkTap: (url, _, __) {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return CustomWebViewPage(
                                url: url!,
                              );
                            }));
                          },
                          style: htmlStyle(),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 24),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        showAll = !showAll;
                      });
                    },
                    child: Text(
                      showAll ? 'Скрыть' : 'Показать все',
                      style: const TextStyle(
                          color: ThemeApp.backgroundBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
