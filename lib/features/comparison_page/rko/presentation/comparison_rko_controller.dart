import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/rko/comparison_rko_data.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/data/comparison_debit_cards_repository.dart';
import 'package:podberi_ru/features/comparison_page/rko/data/comparison_rko_repository.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class ComparisonRkoListController
    extends AutoDisposeAsyncNotifier<RkoModel> {
  ComparisonRkoListController();

  String productTypeWithQuery = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<RkoModel> build() async {
    int firstPageNum = 0;
    int secondPageNum =0;
    ref.listen(comparisonFirstRkoPageNumStateProvider, (previous, next) {

      firstPageNum = next;
    });
    ref.listen(comparisonSecondRkoPageNumStateProvider, (previous, next) {

      secondPageNum = next;
    });

    List<ComparisonRkoData> productIdListRko = [];
    productTypeWithQuery = ref.read(comparisonProductUrlStateProvider);
    await isar?.txn(() async {
      productIdListRko =
          (await isar?.comparisonRkoDatas.where().findAll())!;
    });
    productTypeWithQuery += '?';
    for (int i = 0; i < productIdListRko.length; i++) {
      productTypeWithQuery += '_id=${productIdListRko[i].id}&';
    }
    productTypeWithQuery =
        productTypeWithQuery.substring(0, productTypeWithQuery.length - 1);
    final comparisonRkoRepo =
        ref.read(comparisonRkoRepositoryProvider);

    return await comparisonRkoRepo.fetch(
        productTypeWithQuery, firstPageNum, secondPageNum, ref);
  }
}

///контроллер для получения всех дебетовок в сравнении
final comparisonRkoListControllerProvider =
    AutoDisposeAsyncNotifierProvider<ComparisonRkoListController,
        RkoModel>(
  ComparisonRkoListController.new,
);
