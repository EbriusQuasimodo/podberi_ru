import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

class ProductDetailsGetDataSource {
  ProductDetailsGetDataSource({required this.dio});
  final Dio dio;

  Future<List<ListProductModel>> fetch(String productType, String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
    List<ListProductModel> _listOfProductDetails = [];
    try {
      final re = await dio.get(
        '/$productType/$id',
      );
      switch (re.statusCode) {
        case 200:
          re.data.forEach((e) {
            _listOfProductDetails.add(ListProductModel.fromJson(e));
          });
          return _listOfProductDetails;

        case 404:
          throw PageNotFoundException().message;
        case 204:
          throw PageNotFoundException().message;
        default:
          throw UnknownException().message;
      }
    } on DioException catch (_) {
      throw TimeOutException().message;
    }
    } else {
      throw NoInternetConnectionException().message;
    }
  }
}
