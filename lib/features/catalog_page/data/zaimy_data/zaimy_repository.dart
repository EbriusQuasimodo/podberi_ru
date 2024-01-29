import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';

import 'zaimy_data_source.dart';

abstract class ZaimyRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class ZaimyRepository implements ZaimyRepositoryImpl {
  ZaimyRepository();

  @override
  Future<ZaimyModel> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<ZaimyGetDataSource>().fetch(arg);

    return response;
  }
}

///репозиторий для получения всех банковских продуктов здесь формируется uri для запроса (productType),
///он наполняется типом продукта и фильтрами
///вызывается из [zaimyControllerProvider]
final zaimyRepositoryProvider = Provider.autoDispose<ZaimyRepository>((ref) {
  final fetch = ZaimyRepository();
  return fetch;
});
