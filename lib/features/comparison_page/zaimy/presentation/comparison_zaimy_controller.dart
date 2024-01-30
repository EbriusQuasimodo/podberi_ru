import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/zaimy/data/comparison_zaimy_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class ComparisonZaimyListController
    extends AutoDisposeAsyncNotifier<ZaimyModel> {
  ComparisonZaimyListController();

  String productTypeWithQuery = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<ZaimyModel> build() async {
    List<ComparisonZaimyData> productIdListZaimy = [];
    productTypeWithQuery = ref.read(comparisonProductUrlStateProvider);

    await isar?.txn(() async {
      productIdListZaimy =
          (await isar?.comparisonZaimyDatas.where().findAll())!;
    });
    productTypeWithQuery += '?';
    for (int i = 0; i < productIdListZaimy.length; i++) {
      productTypeWithQuery += '_id=${productIdListZaimy[i].id}&';
    }

    productTypeWithQuery =
        productTypeWithQuery.substring(0, productTypeWithQuery.length - 1);

    final comparisonZaimyRepo = ref.read(comparisonZaimyRepositoryProvider);

    return await comparisonZaimyRepo.fetch(productTypeWithQuery, ref);
  }
}

///контроллер для получения всех займов в сравнении
final comparisonZaimyListControllerProvider =
    AutoDisposeAsyncNotifierProvider<ComparisonZaimyListController, ZaimyModel>(
  ComparisonZaimyListController.new,
);
