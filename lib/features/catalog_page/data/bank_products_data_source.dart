import 'package:dio/dio.dart';
import 'package:podberi_ru/features/catalog_page/domain/bank_products_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BankProductsGetDataSource {
  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://62.109.21.134:8080',
      responseType: ResponseType.json,
    ),
  )..interceptors.add(PrettyDioLogger());

  Future<List<ListProductModel>> fetch(String productType) async {
    List<ListProductModel> _listOfProducts = [];
    try {
      final re = await _dio.get(
        '/$productType',
      );
      re.data.forEach((e) {
        _listOfProducts.add(ListProductModel.fromJson(e));
      });
      return _listOfProducts;
    } on DioException catch (error) {
      print(error);
      rethrow;
    }
  }
}
