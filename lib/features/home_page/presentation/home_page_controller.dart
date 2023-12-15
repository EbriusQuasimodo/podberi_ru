import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/mini_list_of_banks_widget.dart';

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
///url типа продукта с главной страницы
final productTypeUrlFromHomeBanksStateProvider =
StateProvider.autoDispose<String>((ref) {
  return '';
});
