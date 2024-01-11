import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/details_page/data/debit_cards/debit_cards_details_repository.dart';

///получение деталей о дебетовке, принимает в себя тип продукта(катеогорию) и его id
///используется в [LoadDetailsPageByProductType]
///вызывается из [debitCardsDetailsRepositoryProvider]
class DebitCardsDetailsGetDataSource {
  DebitCardsDetailsGetDataSource({required this.dio});
  final Dio dio;

  Future<List<ListDebitCardsModel>> fetch(String productType, String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
    List<ListDebitCardsModel> _listOfDebitCardsDetails = [];
    try {
      final re = await dio.get(
        '/debit_cards/$id',
      );
      switch (re.statusCode) {
        case 200:
          re.data.forEach((e) {
            _listOfDebitCardsDetails.add(ListDebitCardsModel.fromJson(e));
          });
          return _listOfDebitCardsDetails;

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
