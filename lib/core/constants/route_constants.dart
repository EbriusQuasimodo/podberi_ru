import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_page.dart';
import 'package:podberi_ru/features/catalog_page/shared_presentation/catalog_page.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_page.dart';

class RouteConstants {
  ///главная страница [HomePage]
  static const String home = '/home';

  ///страница со списокм всех банков [AllBanksPage]
  static const String allBanks = '/allBanks';

  ///страница выбора типа продукта (дебетовка, кредитка и т.д) [SelectProductTypePage]
  static const String selectProduct = '/selectProduct';

  ///страница каталога (в нижнем баре ее нет,
  ///но на нее можно попасть через главну, выбор продукта и банки [CatalogPage]
  static const String catalog = '/catalog';

  ///страница деталей (в нижнем баре ее нет,
  ///но на нее можно попасть через каталог избранное и сравнение [LoadDetailsPageByProductType]
  static const String details = '/details';

  ///страница избранного [FavoritesPage]
  static const String favorites = '/favorites';

  ///промокодов временно не будет ( планируется добавить после релиза мвп)
  //
  // ///страница выбора категории промокодов [SelectCategoryPromoCodesPage]
  // static const String selectCategoryPromocodes = '/selectCategoryPromocodes';
  //
  // ///страница промокодов [PromoCodesPage]
  // static const String promocodes = '/promocodes';
  // ///страница деталей промокода [PromoCodesDetailsPage]
  // static const String promocodesDetails = '/promocodesDetails';

  ///страница сравнения [ComparisonPage]
  static const String comparison = '/comparison';
}
