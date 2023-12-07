import 'package:dio/dio.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ProductDetailsGetDataSource {
  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://62.109.21.134:8080',
      responseType: ResponseType.json,
    ),
  )..interceptors.add(PrettyDioLogger());

  Future<List<ListProductModel>> fetch(String productType, String id) async {
    List<ListProductModel> _listOfProductDetails = [];
    try {
      final re = await _dio.get(
        '/$productType/$id',
      );
      re.data.forEach((e) {
        _listOfProductDetails.add(ListProductModel.fromJson(e));
      });
      return _listOfProductDetails;
    } on DioException catch (error) {
      print(error);
      rethrow;
    }
  }
}
