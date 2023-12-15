import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';

import 'all_banks_data_source.dart';

abstract class AllBanksRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class AllBanksRepository implements AllBanksRepositoryImpl {
  AllBanksRepository();

  @override
  Future<List<BankDetailsModel>> fetch(
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<AllBanksGetDataSource>().fetch();
    return response;
  }
}

/// репозиторий для получения списка всех банков, используется в [MiniListOfBanksWidget], [AllBanksPage] и [FiltersPage]
/// вызывается через [allBanksControllerProvider]
final allBanksRepositoryProvider =
    Provider.autoDispose<AllBanksRepository>((ref) {
  final fetch = AllBanksRepository();
  return fetch;
});
