import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/features/all_banks_page/data/all_banks_data_source.dart';
import 'package:podberi_ru/features/all_banks_page/data/all_banks_repository.dart';
import 'package:podberi_ru/core/domain/pagination_params_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final bankNameFromAllBanksStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final bankPictureFromAllBanksStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final productTypeUrlFromAllBanksStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

class AllBanksController extends AutoDisposeFamilyAsyncNotifier<BanksDetailsModel, PaginationParamsModel> {
  AllBanksController();
  @override
  FutureOr<BanksDetailsModel> build(PaginationParamsModel arg) async {
    final eventRepo = ref.read(allBanksRepositoryProvider);
    return await eventRepo.fetch(arg.page, arg.fetch);
  }
}

///контроллер для страницы всех банков, вызывает получение данных о всех банках в [AllBanksGetDataSource]
///используется в [MiniListOfBanksWidget], [AllBanksPage] и [FiltersPage]
final allBanksControllerProvider =
AutoDisposeAsyncNotifierProvider.family<AllBanksController, BanksDetailsModel, PaginationParamsModel>(
  AllBanksController.new,
);