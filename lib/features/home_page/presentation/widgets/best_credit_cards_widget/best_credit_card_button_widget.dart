import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';

class BestCreditCardButtonWidget extends StatelessWidget {
  final String productRating;
  final VoidCallback onTap;
  final ListCreditCardsModel productInfo;
  ///карточка продукта без кнопок добавления в избранное и сравнение
  const BestCreditCardButtonWidget({
    super.key,
    required this.productInfo,
    required this.onTap,
    required this.productRating,
  });

  List<Widget> list() {
    var list = <Widget>[];

    for (int i = 0; i < 4; i++) {
      list.add(
        Text(
          "${productInfo.features[i]}",
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: ThemeApp.mainWhite,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:Color(int.parse(
            '0xff${productInfo.bankDetails?.color}')),
      ),
      width: 280,
      height: 190,
      margin: const EdgeInsets.only(right: 3, left: 3),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              height: 50,width: 50,
              padding:
              const EdgeInsets.only(top: 9, right: 7, left: 7, bottom: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ThemeApp.mainWhite,
              ),
              child: Image.network(
                '${Urls.api.files}/${productInfo.bankDetails?.logo}',

                fit: BoxFit.cover,
                errorBuilder: (BuildContext context,
                    Object exception, StackTrace? stackTrace) {
                  return SvgPicture.asset(
                    'assets/icons/image_not_found_icon.svg',
                    color: ThemeApp.mainWhite,
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            right: 86,
            child: Text(
              '${productInfo.bankDetails?.bankName}\n${productInfo.name}',
              maxLines: 3,
              style: const TextStyle(
                  color: ThemeApp.mainWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          productInfo.features.isNotEmpty
              ? Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: list(),
            ),
          )
              : const SizedBox.shrink(),
          Positioned(
              right: 16,
              bottom: 16,
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: ThemeApp.mainWhite,
                    size: 20,
                  ),
                  Text(
                    productRating,
                    style: const TextStyle(
                        color: ThemeApp.mainWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )
                ],
              )),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  onTap();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
