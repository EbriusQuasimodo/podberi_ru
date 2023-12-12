import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/all_banks_page/data/all_banks_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final bankNameFromAllBanksStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final bankPictureFromAllBanksStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});



class AllBanksController extends AutoDisposeAsyncNotifier<List<BankDetailsModel>> {
  AllBanksController();
  @override
  FutureOr<List<BankDetailsModel>> build() async {
    final eventRepo = ref.read(allBanksRepositoryProvider);
    return await eventRepo.fetch(ref);
  }

  fetchBanksData() async {
    state = const AsyncLoading();
    final eventRepo = ref.read(allBanksRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return await eventRepo.fetch( ref);
    });
  }
}

final allBanksControllerProvider =
AutoDisposeAsyncNotifierProvider<AllBanksController, List<BankDetailsModel>>(
  AllBanksController.new,
);