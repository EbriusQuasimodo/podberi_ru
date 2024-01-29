import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/debit_cards/presentation/widgets/debit_card_conditions_widget.dart';
import 'package:podberi_ru/features/web_view_widget.dart';

class RowDescriptionWidget extends StatelessWidget {
  final String rowName;
  final String rowDescription;
  final bool isTextWithHtmlTags;

  ///виджет ряда в таблице с основной информацией о банковском продукте, используется в [DebitCardConditionsWidget]
  const RowDescriptionWidget({
    super.key,
    required this.rowDescription,
    required this.rowName,
    required this.isTextWithHtmlTags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  rowName,
                  style: const TextStyle(
                    fontSize: 13,
                    color: ThemeApp.backgroundBlack,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            isTextWithHtmlTags
                ? Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Html(
                          data: rowDescription,
                          onLinkTap: (url, _, __) {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return CustomWebViewPage(
                                url: url!,
                              );
                            }));
                          },
                          style: {
                            "body": Style(
                              textAlign: TextAlign.justify,
                              margin: Margins.zero,
                              padding: HtmlPaddings.zero,
                              color: ThemeApp.backgroundBlack,
                              fontSize: FontSize(13),
                              fontWeight: FontWeight.w300,
                            ),
                            "p": Style(
                              textAlign: TextAlign.justify,
                              margin: Margins.zero,
                              padding: HtmlPaddings.zero,
                              color: ThemeApp.backgroundBlack,
                              fontSize: FontSize(13),
                              fontWeight: FontWeight.w300,
                            ),
                            "a": Style(
                              textAlign: TextAlign.justify,
                              textDecoration: TextDecoration.none,
                            ),
                            'li': Style(
                              padding: HtmlPaddings.zero,
                              fontSize: FontSize(12),
                            ),
                            'ol, ul,': Style(
                              margin: Margins.only(top:0, right: 15),
                              padding: HtmlPaddings.zero,
                              fontSize: FontSize(12),
                              listStylePosition:
                              ListStylePosition.outside,
                            ),
                          },
                        )))
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        rowDescription,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 13,
                          color: ThemeApp.backgroundBlack,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
         Container(
          height: 2,
          color: ThemeApp.grey,
          margin: const EdgeInsets.only(top: 12, bottom: 12),
        ),
      ],
    );
  }
}
