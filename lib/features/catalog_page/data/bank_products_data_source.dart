import 'package:dio/dio.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

class BankProductsGetDataSource {
  BankProductsGetDataSource({
    required this.dio,
  });
  final Dio dio;

  Future<List<ListProductModel>> fetch(String productType) async {
    List<ListProductModel> _listOfProducts = [];
    try {
      final re = await dio.get(
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
