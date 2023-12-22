import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

import 'banks_data_source.dart';


///repository for fetch best offer bank product
abstract class BanksRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class BanksRepository implements BanksRepositoryImpl {
  BanksRepository();

  @override
  Future<ProductModel> fetch(AutoDisposeAsyncNotifierProviderRef ref) async {
    final response =
    await GetIt.I<BanksGetDataSource>().fetch();
    return response;
  }
}

final banksRepositoryProvider =
Provider.autoDispose<BanksRepository>((ref) {
  final fetch = BanksRepository();
  return fetch;
});
