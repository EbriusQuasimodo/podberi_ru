import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';



class MiniZaimyWidget extends StatelessWidget {
  final VoidCallback onDelete;
  final ListZaimyModel zaimy;
  ///виджет дебетовки в сравнении , используется в [ProductComparisonWidget]
  const MiniZaimyWidget({super.key, required this.onDelete,  required this.zaimy});

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5, bottom: 24),
                  child: Text(
                    zaimy.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width < 400 ? 10 :12,
                        fontWeight: FontWeight.w500,
                        color: ThemeApp.mainWhite),
                  ),
                ),
              ],
            ),
          ),
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
