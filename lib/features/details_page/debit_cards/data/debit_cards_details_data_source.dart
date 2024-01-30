import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/details_page/debit_cards/data/debit_cards_details_repository.dart';

///получение деталей о дебетовке, принимает в себя id
///вызывается из [debitCardsDetailsRepositoryProvider]
class DebitCardsDetailsGetDataSource {
  DebitCardsDetailsGetDataSource({required this.dio});
  final Dio dio;

  Future<ListDebitCardsModel> fetch(String productType, String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {

    try {
      final re = await dio.get(
        '/debit_cards/$id',
      );
      switch (re.statusCode) {
        case 200:
          return ListDebitCardsModel.fromJson(re.data);

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
