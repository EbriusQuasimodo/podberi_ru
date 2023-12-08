import 'package:dio/dio.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

class CreditCardsGetDataSource {
  CreditCardsGetDataSource({required this.dio});
  final Dio dio;

  Future<List<ListProductModel>> fetch() async {
    List<ListProductModel> _listOfProductDetails = [];
    try {
      final re = await dio.get(
        '/credit_cards',
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