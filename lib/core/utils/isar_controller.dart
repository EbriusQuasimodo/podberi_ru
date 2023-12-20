import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/rko/comparison_rko_data.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/rko/favorites_rko_data.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';

class IsarNotifier extends ChangeNotifier {
  final isar = Isar.getInstance();

  Future<bool> isItemDuplicateInComparison(
      ListProductModel productInfo, String productTypeUrl) async {
    int? count;
    switch (productTypeUrl) {
      case 'debit_cards':
        count = await isar?.comparisonDebitCardsDatas
            .filter()
            .idContains(productInfo.id)
            .count();
      case 'credit_cards':
        count = await isar?.comparisonCreditCardsDatas
            .filter()
            .idContains(productInfo.id)
            .count();
      case 'zaimy':
        count = await isar?.comparisonZaimyDatas
            .filter()
            .idContains(productInfo.id)
            .count();
      case 'rko':
        count = await isar?.comparisonRkoDatas
            .filter()
            .idContains(productInfo.id)
            .count();
    }
    return count! > 0;
  }

  Future<bool> isItemDuplicateInFavorites(
      ListProductModel productInfo, String productTypeUrl) async {
    int? count;
    switch (productTypeUrl) {
      case 'debit_cards':
        count = await isar?.favoritesDebitCardsDatas
            .filter()
            .idContains(productInfo.id)
            .count();
      case 'credit_cards':
        count = await isar?.favoritesCreditCardsDatas
            .filter()
            .idContains(productInfo.id)
            .count();
      case 'zaimy':
        count = await isar?.favoritesZaimyDatas
            .filter()
            .idContains(productInfo.id)
            .count();
      case 'rko':
        count = await isar?.favoritesRkoDatas
            .filter()
            .idContains(productInfo.id)
            .count();
    }
    return count! > 0;
  }
}

final isarNotifierProvider =
    ChangeNotifierProvider<IsarNotifier>((ref) => IsarNotifier());
