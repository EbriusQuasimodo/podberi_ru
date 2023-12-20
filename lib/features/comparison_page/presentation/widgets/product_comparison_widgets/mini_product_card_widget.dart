import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/comparison_page/presentation/widgets/product_comparison_widgets/product_comparison_widget.dart';

import '../../../../../core/domain/bank_products_model/bank_products_model.dart';


class MiniProductCardWidget extends StatelessWidget {
  final VoidCallback onDelete;
  final ListProductModel comparisonList;
  ///виджет с продуктов в сравнении, используется в [ProductComparisonWidget]
  const MiniProductCardWidget({super.key, required this.onDelete,  required this.comparisonList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffFFBE0B), borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(right: 3, left: 3),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ThemeApp.mainWhite,
            ),
            margin: const EdgeInsets.only(top: 15, left: 15, right: 6, bottom: 15),
            padding: const EdgeInsets.only(
                top: 10.5, bottom: 11.5, right: 8.63, left: 9.16),
            child: SvgPicture.asset(
              'assets/icons/tinkoff_logo_icon.svg',
              height: 37.921,
              width: 42.208,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 6, right: 5, top: 24),
                child: Text(
                  'bank name',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ThemeApp.mainWhite),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 15, right: 5, bottom: 24),
                child: Text(
                  comparisonList.cardName,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ThemeApp.mainWhite),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: MaterialButton(
              padding: EdgeInsets.zero,
              minWidth: 50,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                onDelete();
              },
              child: SvgPicture.asset(
                'assets/icons/trash_icon.svg',
                color: ThemeApp.mainWhite,
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
