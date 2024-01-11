import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';

///получение деталей о кредитке, принимает в себя тип продукта(катеогорию) и его id
///используется в [LoadDetailsPageByProductType]
///вызывается из [creditCardsDetailsRepositoryProvider]
class CreditCardsDetailsGetDataSource {
  CreditCardsDetailsGetDataSource({required this.dio});
  final Dio dio;

  Future<List<ListCreditCardsModel>> fetch(String productType, String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
    List<ListCreditCardsModel> _listOfCreditCardsDetails = [];
    try {
      final re = await dio.get(
        '/credit_cards/$id',
      );
      print(re.realUri);
      switch (re.statusCode) {
        case 200:
          re.data.forEach((e) {
            _listOfCreditCardsDetails.add(ListCreditCardsModel.fromJson(e));
          });
          return _listOfCreditCardsDetails;

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
