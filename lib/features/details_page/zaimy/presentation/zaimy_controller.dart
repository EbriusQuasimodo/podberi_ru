import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/details_page/zaimy/data/zaimy_details_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class ZaimyDetailsController extends AutoDisposeFamilyAsyncNotifier<ListZaimyModel, BasicApiPageSettingsModel> {
  ZaimyDetailsController();
  @override
  FutureOr<ListZaimyModel> build(BasicApiPageSettingsModel arg) async {
    final repoZaimyDetails = ref.read(zaimyDetailsRepositoryProvider);
    return await repoZaimyDetails.fetch(arg, ref);
  }
}

///контроллер для получения данных о деталях займа
final zaimyDetailsControllerProvider =
AutoDisposeAsyncNotifierProvider.family<ZaimyDetailsController, ListZaimyModel, BasicApiPageSettingsModel>(
  ZaimyDetailsController.new,
);
