import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/home_page/data/credit_cards_data/credit_cards_repository.dart';

///получение списка кредитных карт
///вызывается из [creditCardsRepositoryProvider]
class CreditCardsGetDataSource {
  CreditCardsGetDataSource({required this.dio});

  final Dio dio;

  Future<List<ListProductModel>> fetch() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      List<ListProductModel> _listOfBestCreditCards = [];
      try {
        final re = await dio.get(
          '/credit_cards',
        );
        switch (re.statusCode) {
          case 200:
            re.data.forEach((e) {
              _listOfBestCreditCards.add(ListProductModel.fromJson(e));
            });
            return _listOfBestCreditCards;

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
