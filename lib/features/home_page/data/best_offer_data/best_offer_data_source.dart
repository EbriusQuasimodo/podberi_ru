import 'package:dio/dio.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

class BestOfferGetDataSource {
  BestOfferGetDataSource({required this.dio});
  final Dio dio;

  Future<List<ListProductModel>> fetch(String productType) async {
    List<ListProductModel> _listOfProductDetails = [];
    try {
      final re = await dio.get(
        '/$productType/?best_offer=true',
      );
      if(re.data !=null){
      re.data.forEach((e) {
        _listOfProductDetails.add(ListProductModel.fromJson(e));
      });}
      return _listOfProductDetails;
    } on DioException catch (error) {
      print(error);
      rethrow;
    }
  }
}
