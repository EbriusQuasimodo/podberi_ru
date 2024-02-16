import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:podberi_ru/core/domain/zaimy_model/zaimy_model.dart';

import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/zaimy/presentation/zaimy_details_page.dart';
import 'package:podberi_ru/features/web_view_widget.dart';

class ZaimyDescriptionWidget extends StatelessWidget {
  final ListZaimyModel productInfo;

  ///виджет с подробным описанием условий займа
  ///используется в [ZaimyDetailsPage]
  const ZaimyDescriptionWidget({
    super.key,
    required this.productInfo,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2, bottom: kBottomNavigationBarHeight+3),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: 30, bottom: 10, left: 15, right: 15),
              child: Text(
                'Условия',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ThemeApp.backgroundBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
              child: Html(
                data: productInfo.allConditionsLink,
                onLinkTap: (url, _, __) {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CustomWebViewPage(
                      url: url!,
                    );
                  }));
                },
                style: {
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
                  )
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
