import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/details_page/credit_cards/data/credit_cards_details_repository.dart';

///получение деталей о кредитке, принимает в себя id
///вызывается из [creditCardsDetailsRepositoryProvider]
class CreditCardsDetailsGetDataSource {
  CreditCardsDetailsGetDataSource({required this.dio});
  final Dio dio;

  Future<ListCreditCardsModel> fetch(String productType, String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {

    try {
      final re = await dio.get(
        '/credit_cards/$id',
      );
      switch (re.statusCode) {
        case 200:

          return ListCreditCardsModel.fromJson(re.data);

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
