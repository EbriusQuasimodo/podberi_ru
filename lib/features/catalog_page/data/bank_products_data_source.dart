import 'dart:async';

import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/features/catalog_page/data/bank_products_repository.dart';

///получение всех банковских продуктов [productType] содержит в себе не только enum [ProductTypeEnum]
///но и фильтры, имя банка, сортировку и тд
///вызывается из [bankProductsRepositoryProvider]
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
        switch (re.statusCode) {
          case 200:
            re.data.forEach((e) {
              _listOfProducts.add(ListProductModel.fromJson(e));
            });
            return _listOfProducts;

          case 404:
            throw PageNotFoundException().message;
          case 204:
            throw NothingFoundException().message;
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
