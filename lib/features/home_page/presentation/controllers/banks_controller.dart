import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/home_page/data/banks_data/banks_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class BanksController extends AutoDisposeAsyncNotifier<BanksDetailsModel> {
  BanksController();
  @override
  FutureOr<BanksDetailsModel> build() async {
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
AutoDisposeAsyncNotifierProvider<BanksController, BanksDetailsModel>(
  BanksController.new,
);