import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/rko/comparison_rko_data.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/comparison_page/data/debit_cards_data/comparison_debit_cards_repository.dart';
import 'package:podberi_ru/features/comparison_page/data/zaimy_data/comparison_zaimy_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'comparison_page_controller.dart';

///контроллер списка сравнения
class ComparisonZaimyListController extends AutoDisposeAsyncNotifier<
    ZaimyModel> {
  ComparisonZaimyListController();

  String productTypeUrl = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<ZaimyModel> build() async {

    List<ComparisonZaimyData> productIdListZaimy = [];
    productTypeUrl = ref.watch(comparisonProductUrlStateProvider);

        await isar?.txn(() async {
          productIdListZaimy =
          (await isar?.comparisonZaimyDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListZaimy.length; i++) {
          productTypeUrl += '_id=${productIdListZaimy[i].id}&';
        }



    final comparisonRepo = ref.read(comparisonZaimyRepositoryProvider);

    return await comparisonRepo.fetch(productTypeUrl, ref);
  }
}

///контроллер для получения всех займов в сравнении
final comparisonZaimyListControllerProvider = AutoDisposeAsyncNotifierProvider<
    ComparisonZaimyListController, ZaimyModel>(
  ComparisonZaimyListController.new,
);