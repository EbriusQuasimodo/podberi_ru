import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
/// фильтр банков если мы зашли с главной страницы
final filterBanksFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр банков если мы зашли со странциы выбора типа продукта
final filterBanksFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр кэшбека если мы зашли с главной страницы
final filterCashBackFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр кэшбека если мы зашли со странциы выбора типа продукта
final filterCashBackFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр доставки если мы зашли с главной страницы
final filterDeliveryFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр доставки если мы зашли со странциы выбора типа продукта
final filterDeliveryFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр платежной системы если мы зашли с главной страницы
final filterPaySystemFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр платежной системы если мы зашли со странциы выбора типа продукта
final filterPaySystemFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр доп. условия если мы зашли с главной страницы
final filterAdditionalConditionsFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр доп. условия если мы зашли со странциы выбора типа продукта
final filterAdditionalConditionsFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});


final isFavoriteStateProviderController = ChangeNotifierProvider<IsFavoriteStateProviderController>((ref) {
  return IsFavoriteStateProviderController();
});
class IsFavoriteStateProviderController extends ChangeNotifier{
  final isar = Isar.getInstance();

}