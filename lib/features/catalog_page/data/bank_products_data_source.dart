import 'dart:async';

import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class BankProductsGetDataSource {
  BankProductsGetDataSource({
    required this.dio,
  });

  final Dio dio;

  Future<List<ListProductModel>> fetch(String productType) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      List<ListProductModel> _listOfProducts = [];
      try {
        final re = await dio.get(
          '/$productType',
        );
print(re.realUri);
        switch (re.statusCode) {
          case 200:
            re.data.forEach((e) {
              _listOfProducts.add(ListProductModel.fromJson(e));
            });
            return _listOfProducts;

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
