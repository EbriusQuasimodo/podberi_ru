import 'package:flutter/material.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class BankProductCardWidgetWithoutButtons extends StatelessWidget {
  final String productRating;
  final VoidCallback onTap;
  final ListProductModel productInfo;

  const BankProductCardWidgetWithoutButtons({
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
        color: const Color(0xffFFBE0B),
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
              padding:
                  const EdgeInsets.only(top: 9, right: 7, left: 7, bottom: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ThemeApp.mainWhite,
              ),
              child: Image.network(
                'http://62.109.21.134:8080/picture/${productInfo.bankDetails?.picture}',
                height: 32,
                width: 36,
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            right: 86,
            child: Text(
              '${productInfo.bankDetails?.bankName}\n${productInfo.cardName}',
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
