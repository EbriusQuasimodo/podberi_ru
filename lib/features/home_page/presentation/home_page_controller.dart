import 'package:flutter_riverpod/flutter_riverpod.dart';
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
