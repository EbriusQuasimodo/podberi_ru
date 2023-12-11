import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class BestOffersCardWidget extends ConsumerWidget {
  final ListProductModel bestOffer;
  const BestOffersCardWidget({super.key, required this.bestOffer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeApp.backgroundBlack,
      ),
      width: double.infinity,
height: 220,
      margin: const EdgeInsets.only(right: 3, left: 3),
      child: Stack(
        children: [
          Positioned(
            bottom: -50,
            right: -50,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15/360),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network('${Urls.api.files}/${bestOffer.picture}', width: 261, height: 165,),
              ),
            ),
          ),
           Positioned(
            left: 20,
            top: 20,
            right: 20,
            child: Text(
              "${bestOffer.bankDetails?.bankName} ${bestOffer.cardName}",
              maxLines: 3,
              style: const TextStyle(
                  color: ThemeApp.mainWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
           Positioned(
            left: 20,
            bottom: 20,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  ///todo: нужно как-то получать тип продукта чтобы на странице деталей делать запрос по определенному типу продукта
                  // ref.watch(goRouterProvider).push(RouteConstants.details,
                  //     extra: DetailsParameters(
                  //         id: bestOffer.id,
                  //         productType: whereFrom,
                  //         bankName: productInfo?.bankDetails?.bankName,
                  //         bankLogoPath: productInfo?.bankDetails?.picture));
                },
                child: const Text(
                  'ПОДРОБНЕЕ',
                  style: TextStyle(color: ThemeApp.mainWhite, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
