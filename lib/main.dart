import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/home_page/data/best_offer_data/best_offer_data_source.dart';
import 'package:podberi_ru/features/home_page/data/credit_cards_data/credit_cards_data_source.dart';
import 'package:podberi_ru/features/home_page/data/debit_cards_data/debit_cards_data_source.dart';

import 'features/catalog_page/data/bank_products_data_source.dart';
import 'features/details_page/data/product_details_data_source.dart';
import 'internal/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late Alice alice;
  alice = Alice(
    showNotification: true,
    showInspectorOnShake: true,
    maxCallsCount: 1000,
  );
  late Dio dio;
  dio = Dio(
    BaseOptions(
      baseUrl: 'http://62.109.21.134:8080',
      responseType: ResponseType.json,
    ),
  )
    ..interceptors.add(alice.getDioInterceptor());
  GetIt.I.registerLazySingleton(() => alice);
  GetIt.I.registerLazySingleton(() => BankProductsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => ProductDetailsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => BestOfferGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => CreditCardsGetDataSource(dio: dio));
  GetIt.I.registerLazySingleton(() => DebitCardsGetDataSource(dio: dio));
  runApp(const ProviderScope(child: App()));
}
