import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/details_page/data/zaimy/zaimy_details_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class ZaimyDetailsController extends AutoDisposeFamilyAsyncNotifier<List<ListZaimyModel>, BasicApiPageSettingsModel> {
  ZaimyDetailsController();
  @override
  FutureOr<List<ListZaimyModel>> build(BasicApiPageSettingsModel arg) async {
    final repoZaimyDetails = ref.read(zaimyDetailsRepositoryProvider);
    return await repoZaimyDetails.fetch(arg, ref);
  }
}

///контроллер для получения данных о деталях кредитки,
///используется в [LoadDetailsPageByProductType]
final zaimyDetailsControllerProvider =
AutoDisposeAsyncNotifierProvider.family<ZaimyDetailsController, List<ListZaimyModel>, BasicApiPageSettingsModel>(
  ZaimyDetailsController.new,
);
