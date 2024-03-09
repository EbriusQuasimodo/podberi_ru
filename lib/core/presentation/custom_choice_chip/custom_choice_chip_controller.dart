import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

final customChoiceChipControllerProvider = StateNotifierProvider.autoDispose<
    CustomChoiceChipControllerNotifier, String>(CustomChoiceChipControllerNotifier.new);
class CustomChoiceChipControllerNotifier extends StateNotifier<String>{
  CustomChoiceChipControllerNotifier(this.ref) : super('');
  final Ref ref;
  changeCategory(String whereFrom, String element){
    if (whereFrom == 'allBanksPage') {
      switch (element) {
        case 'Дебетовые карты':
          ref
              .read(
              productTypeUrlFromAllBanksStateProvider.notifier)
              .state = 'debit_cards';

          break;
        case 'Кредитные карты':
          ref
              .read(
              productTypeUrlFromAllBanksStateProvider.notifier)
              .state = 'credit_cards';

          break;
        case 'РКО':
          ref
              .read(
              productTypeUrlFromAllBanksStateProvider.notifier)
              .state = 'rko';

          break;
        case 'Микрозаймы':
          ref
              .read(
              productTypeUrlFromAllBanksStateProvider.notifier)
              .state = 'zaimy';

          break;
      }
    }
    if (whereFrom == 'homePageBanks') {
      switch (element) {
        case 'Дебетовые карты':
          ref
              .read(
              productTypeUrlFromHomeBanksStateProvider.notifier)
              .state = 'debit_cards';

          break;
        case 'Кредитные карты':
          ref
              .read(
              productTypeUrlFromHomeBanksStateProvider.notifier)
              .state = 'credit_cards';

          break;
        case 'РКО':
          ref
              .read(
              productTypeUrlFromHomeBanksStateProvider.notifier)
              .state = 'rko';

          break;
        case 'Микрозаймы':
          ref
              .read(
              productTypeUrlFromHomeBanksStateProvider.notifier)
              .state = 'zaimy';

          break;
      }
    } else if (whereFrom == 'favorites') {
      switch (element) {
        case 'Дебетовые карты':
          ref.read(favoritesProductUrlStateProvider.notifier).state =
          'debit_cards';

          break;
        case 'Кредитные карты':
          ref.read(favoritesProductUrlStateProvider.notifier).state =
          'credit_cards';

          break;
        case 'РКО':
          ref.read(favoritesProductUrlStateProvider.notifier).state =
          'rko';

          break;
        case 'Микрозаймы':
          ref.read(favoritesProductUrlStateProvider.notifier).state =
          'zaimy';

          break;
      }
    } else if (whereFrom == 'comparison') {
      switch (element) {
        case 'Дебетовые карты':
          ref.read(comparisonProductUrlStateProvider.notifier).state =
          'debit_cards';

          break;
        case 'Кредитные карты':
          ref.read(comparisonProductUrlStateProvider.notifier).state =
          'credit_cards';

          break;
        case 'Микрозаймы':
          ref.read(comparisonProductUrlStateProvider.notifier).state =
          'zaimy';

          break;
      }
    }
  }
}