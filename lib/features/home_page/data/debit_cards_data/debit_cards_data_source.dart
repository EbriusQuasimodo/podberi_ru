import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/home_page/data/debit_cards_data/debit_cards_repository.dart';

///получение дебетовых карт
///вызывается из [debitCardsRepositoryProvider]
class DebitCardsGetDataSource {
  DebitCardsGetDataSource({required this.dio});

  final Dio dio;

  Future<ProductModel> fetch() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final re = await dio.get(
          '/debit_cards',
        );
        switch (re.statusCode) {
          case 200:
            return ProductModel.fromJson(re.data);

          case 404:
            throw PageNotFoundException().message;
          case 204:
            throw PageNotFoundException().message;
          default:
            throw UnknownServerException().message;
        }
      } on DioException catch (_) {
        throw TimeOutException().message;
      }
    } else {
      throw NoInternetConnectionException().message;
    }
  }
}
