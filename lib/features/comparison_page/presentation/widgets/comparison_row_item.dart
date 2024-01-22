import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/web_view_widget.dart';

class ComparisonRowItemWidget extends StatefulWidget {
  final String rowName;
  final String firstProductDescription;
  final String secondProductDescription;
  final bool isTextWithHtmlTags;

  ///строчка в таблице сравнения, используется в [ComparisonDataTableWidget]
  const ComparisonRowItemWidget({
    super.key,
    required this.rowName,
    required this.firstProductDescription,
    required this.secondProductDescription,
    required this.isTextWithHtmlTags,
  });

  @override
  State<ComparisonRowItemWidget> createState() =>
      _ComparisonRowItemWidgetState();
}

class _ComparisonRowItemWidgetState extends State<ComparisonRowItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Text(
            widget.rowName,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: ThemeApp.backgroundBlack,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          color: ThemeApp.grey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.isTextWithHtmlTags
                  ? Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 7.5, left: 15),
                          child: Html(
                            data: widget.firstProductDescription,
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
                              )
                            },
                          )))
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 7.5),
                        child: Text(
                          widget.firstProductDescription,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ThemeApp.backgroundBlack,
                          ),
                        ),
                      ),
                    ),
              widget.secondProductDescription != ''
                  ? widget.isTextWithHtmlTags
                      ? Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(right: 15,left: 7.5),
                              child: Html(
                                data: widget.secondProductDescription,
                                onLinkTap: (url, _, __) {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(MaterialPageRoute(
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
                                  )
                                },
                              )))
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15,left: 7.5),
                            child: Text(
                              widget.secondProductDescription,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: ThemeApp.backgroundBlack,
                              ),
                            ),
                          ),
                        )
                  : const SizedBox.shrink(),
            ],
          ),
        )
      ],
    );
  }
}
