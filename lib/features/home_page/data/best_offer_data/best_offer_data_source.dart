import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/home_page/data/best_offer_data/best_offer_repository.dart';

///получение списка лучших предложений
///вызывается из [bestOfferRepositoryProvider]
class BestOfferGetDataSource {
  BestOfferGetDataSource({required this.dio});

  final Dio dio;

  Future<List<ListProductModel>> fetch(String productType) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      List<ListProductModel> _listOfBestOffers = [];
      try {
        final re = await dio.get(
          '/$productType/?best_offer=true',
        );
        switch (re.statusCode) {
          case 200:
            re.data.forEach((e) {
              _listOfBestOffers.add(ListProductModel.fromJson(e));
            });
            return _listOfBestOffers;

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
