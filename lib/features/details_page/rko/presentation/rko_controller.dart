import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/features/details_page/rko/data/rko_details_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class RkoDetailsController extends AutoDisposeFamilyAsyncNotifier<
    ListRkoModel, BasicApiPageSettingsModel> {
  RkoDetailsController();

  @override
  FutureOr<ListRkoModel> build(BasicApiPageSettingsModel arg) async {
    final rkoDetailsRepo = ref.read(rkoDetailsRepositoryProvider);
    return await rkoDetailsRepo.fetch(arg, ref);
  }
}

///контроллер для получения данных о деталях дебетовки
final rkoDetailsControllerProvider =
    AutoDisposeAsyncNotifierProvider.family<RkoDetailsController,
        ListRkoModel, BasicApiPageSettingsModel>(
      RkoDetailsController.new,
);
