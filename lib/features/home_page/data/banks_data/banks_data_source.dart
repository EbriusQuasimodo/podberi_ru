import 'package:dio/dio.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

class BanksGetDataSource {
  BanksGetDataSource({required this.dio});
  final Dio dio;

  Future<List<BankDetailsModel>> fetch() async {
    List<BankDetailsModel> _listOfProductDetails = [];
    try {
      final re = await dio.get(
        '/banks',
      );
      if(re.data !=null){
        re.data.forEach((e) {
          _listOfProductDetails.add(BankDetailsModel.fromJson(e));
        });}
      return _listOfProductDetails;
    } on DioException catch (error) {
      print(error);
      rethrow;
    }
  }
}