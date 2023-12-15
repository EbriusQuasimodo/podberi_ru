import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/select_product_type_page.dart';

class CatalogProductTypeCardWidget extends StatelessWidget {
  final String productName;
  final String imageAsset;
  final VoidCallback onTap;

  /// кнопка с выбором типа продукта (категории продукта), используется в [SelectProductTypePage]
  const CatalogProductTypeCardWidget(
      {super.key,
      required this.imageAsset,
      required this.productName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 100,
      color: ThemeApp.mainBlue,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: () {
        onTap();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 20),
            child: Text(
              productName,
              style: const TextStyle(
                  color: ThemeApp.mainWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Image.asset(imageAsset),
          )
        ],
      ),
    );
  }
}
