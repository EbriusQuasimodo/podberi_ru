import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/rko/favorites_rko_data.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/features/favorites_page/data/favorites_data_source.dart';
import 'package:podberi_ru/features/home_page/data/best_offer_data/best_offer_data_source.dart';
import 'package:podberi_ru/features/home_page/data/credit_cards_data/credit_cards_data_source.dart';
import 'package:podberi_ru/features/home_page/data/debit_cards_data/debit_cards_data_source.dart';

import 'core/constants/urls.dart';
import 'core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'core/utils/comparison/rko/comparison_rko_data.dart';
import 'core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'features/all_banks_page/data/all_banks_data_source.dart';
import 'features/catalog_page/data/bank_products_data_source.dart';
import 'features/comparison_page/data/comparison_data_source.dart';
import 'features/details_page/data/product_details_data_source.dart';
import 'features/home_page/data/banks_data/banks_data_source.dart';
import 'internal/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  await Isar.open(
    [
      FavoritesDebitCardsDataSchema,
      FavoritesCreditCardsDataSchema,
      FavoritesRkoDataSchema,
      FavoritesZaimyDataSchema,
      ComparisonDebitCardsDataSchema,
      ComparisonCreditCardsDataSchema,
      ComparisonZaimyDataSchema,
      ComparisonRkoDataSchema,
    ],
    inspector: true,
    directory: dir.path,
  );
  late Alice alice;
  alice = Alice(
    showNotification: true,
    showInspectorOnShake: true,
    maxCallsCount: 1000,
  );
  late Dio dio;
  dio = Dio(
    BaseOptions(
      baseUrl: Urls.srv,
      responseType: ResponseType.json,
    ),
  )..interceptors.add(alice.getDioInterceptor());
  GetIt.I.registerLazySingleton(() => alice);
  GetIt.I.registerLazySingleton(() => BankProductsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => ProductDetailsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => BestOfferGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => CreditCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => DebitCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => BanksGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => AllBanksGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => FavoritesGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => ComparisonGetDataSource(dio: dio));
  runApp(const ProviderScope(child: App()));
}
