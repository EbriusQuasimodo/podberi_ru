import 'package:flutter/material.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class ConditionsWidget extends StatelessWidget {
  final ListProductModel productInfo;
  const ConditionsWidget({super.key, required this.productInfo,});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
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
              padding: EdgeInsets.only(
                  top: 30, bottom: 20, left: 15, right: 15),
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
              padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
              child: Text(
                productInfo.total,
                 textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: ThemeApp.backgroundBlack,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
