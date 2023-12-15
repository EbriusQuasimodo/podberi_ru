import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/home_page/data/banks_data/banks_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class BanksController extends AutoDisposeAsyncNotifier<List<BankDetailsModel>> {
  BanksController();
  @override
  FutureOr<List<BankDetailsModel>> build() async {
    final eventRepo = ref.read(banksRepositoryProvider);
    return await eventRepo.fetch(ref);
  }

  fetchBanksData() async {
    state = const AsyncLoading();
    final eventRepo = ref.read(banksRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return await eventRepo.fetch( ref);
    });
  }
}
///todo возможно стоит убрать и брать из апи [AllBanksGetDataSource]
final banksControllerProvider =
AutoDisposeAsyncNotifierProvider<BanksController, List<BankDetailsModel>>(
  BanksController.new,
);