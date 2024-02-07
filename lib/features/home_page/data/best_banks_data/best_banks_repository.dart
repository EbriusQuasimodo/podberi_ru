import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/features/home_page/presentation/controllers/best_banks_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/mini_list_of_banks_widgets/mini_list_of_banks_widget.dart';

import 'best_banks_data_source.dart';

abstract class BestBanksRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class BestBanksRepository implements BestBanksRepositoryImpl {
  BestBanksRepository();

  @override
  Future<BanksDetailsModel> fetch(
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<BestBanksGetDataSource>().fetch();
    return response;
  }
}

/// репозиторий для получения списка "лучших" (первых 6ти) банков, используется в [MiniListOfBanksWidget],
/// вызывается через [bestBanksControllerProvider]
final bestBanksRepositoryProvider =
    Provider.autoDispose<BestBanksRepository>((ref) {
  final fetch = BestBanksRepository();
  return fetch;
});
