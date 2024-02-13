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
import 'package:podberi_ru/features/catalog_page/credit_cards/data/credit_cards_data_source.dart';
import 'package:podberi_ru/features/favorites_page/zaimy/data/favorites_zaimy_data_source.dart';
import 'package:podberi_ru/features/home_page/data/best_offer_data/best_offer_data_source.dart';

import 'core/constants/urls.dart';
import 'core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'core/utils/comparison/rko/comparison_rko_data.dart';
import 'core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'features/all_banks_page/data/all_banks_data_source.dart';
import 'features/catalog_page/debit_cards/data/debit_cards_data_source.dart';
import 'features/catalog_page/zaimy/data/zaimy_data_source.dart';
import 'features/comparison_page/credit_cards/data/comparison_credit_cards_data_source.dart';
import 'features/comparison_page/debit_cards/data/comparison_debit_cards_data_source.dart';
import 'features/comparison_page/zaimy/data/comparison_zaimy_data_source.dart';
import 'features/details_page/credit_cards/data/credit_cards_details_data_source.dart';
import 'features/details_page/debit_cards/data/debit_cards_details_data_source.dart';
import 'features/details_page/zaimy/data/zaimy_details_data_source.dart';
import 'features/favorites_page/credit_cards/data/favorites_credit_cards_data_source.dart';
import 'features/favorites_page/debit_cards/data/favorites_debit_cards_data_source.dart';
import 'features/home_page/data/best_banks_data/best_banks_data_source.dart';
import 'features/home_page/data/best_credit_cards_data/best_credit_cards_data_source.dart';
import 'features/home_page/data/best_debit_cards_data/best_debit_cards_data_source.dart';
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
  GetIt.I.registerLazySingleton(() => DebitCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => CreditCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => ZaimyGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => DebitCardsDetailsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => CreditCardsDetailsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => ZaimyDetailsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => BestOfferGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => BestCreditCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => BestDebitCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => AllBanksGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => BestBanksGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => FavoritesDebitCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => FavoritesCreditCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => FavoritesZaimyGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => ComparisonDebitCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => ComparisonCreditCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => ComparisonZaimyGetDataSource(dio: dio));
  runApp(const ProviderScope(child: App()));
}
