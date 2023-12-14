import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/mini_list_of_banks_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/select_product_type_widgets/select_product_type_widget.dart';

///product type title which select on [SelectProductTypeWidget] used for title in [CatalogPage]
final productTypeTitleFromHomeStateProvider =
    StateProvider.autoDispose<String>((ref) {
  return '';
});

///product type url which select on [SelectProductTypeWidget] used for instance in api
final productTypeUrlFromHomeStateProvider =
    StateProvider.autoDispose<String>((ref) {
  return '';
});

///bank name which select on [MiniListOfBanksWidget] used for instance in api
final bankNameFromHomeStateProvider =
StateProvider.autoDispose<String>((ref) {
  return '';
});
///bank picture which select on [MiniListOfBanksWidget] used for instance in api
final bankPictureFromHomeStateProvider =
StateProvider.autoDispose<String>((ref) {
  return '';
});

final productTypeUrlFromHomeBanksStateProvider =
StateProvider.autoDispose<String>((ref) {
  return '';
});
