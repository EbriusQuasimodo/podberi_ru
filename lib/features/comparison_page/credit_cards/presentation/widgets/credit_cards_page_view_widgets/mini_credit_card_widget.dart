import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class MiniCreditCardWidget extends StatelessWidget {
  final VoidCallback onDelete;
  final ListCreditCardsModel creditCard;

  ///виджет дебетовки в сравнении , используется в [ProductComparisonWidget]
  const MiniCreditCardWidget(
      {super.key, required this.onDelete, required this.creditCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(int.parse(
              '0xff${creditCard.bankDetails?.color}')),
          borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(right: 3, left: 3),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ThemeApp.mainWhite,
            ),
            margin:
                const EdgeInsets.only(top: 15, left: 15, right: 6, bottom: 15),
            padding: const EdgeInsets.only(
                top: 10.5, bottom: 11.5, right: 8.63, left: 9.16),
            child: Image.network(
              '${Urls.api.files}/${creditCard.bankDetails?.icon}',
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return SvgPicture.asset(
                  'assets/icons/photo_not_found.svg',
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, bottom: 6, right: 5, top: 24),
                  child: Text(
                    creditCard.bankDetails!.bankName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width < 400 ? 12 :14,
                        fontWeight: FontWeight.w700,
                        color: ThemeApp.mainWhite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5, bottom: 24),
                  child: Text(
                    creditCard.name,
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
         // const Spacer(),
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
