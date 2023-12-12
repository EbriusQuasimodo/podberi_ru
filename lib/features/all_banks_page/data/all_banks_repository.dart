import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

import 'all_banks_data_source.dart';


///repository for fetch best offer bank product
abstract class AllBanksRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class AllBanksRepository implements AllBanksRepositoryImpl {
  AllBanksRepository();

  @override
  Future<List<BankDetailsModel>> fetch(AutoDisposeAsyncNotifierProviderRef ref) async {
    final response =
    await GetIt.I<AllBanksGetDataSource>().fetch();
    return response;
  }
}

final allBanksRepositoryProvider =
Provider.autoDispose<AllBanksRepository>((ref) {
  final fetch = AllBanksRepository();
  return fetch;
});
