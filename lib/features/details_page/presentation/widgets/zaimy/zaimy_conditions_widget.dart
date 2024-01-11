import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';

class ZaimyConditionsWidget extends StatelessWidget {
  final ListZaimyModel productInfo;

  ///виджет с подробным описанием условий банковского продукта
  ///используется в [LoadDetailsPageByProductType]
  const ZaimyConditionsWidget({
    super.key,
    required this.productInfo,
  });

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
                style: {
                  "product_description": Style(
                    color: ThemeApp.backgroundBlack,
                    fontSize: FontSize(12),
                    fontWeight: FontWeight.w400,
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
