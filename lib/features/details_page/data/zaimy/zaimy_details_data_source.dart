import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';

///получение деталей о займе, принимает в себя тип продукта(катеогорию) и его id
///используется в [LoadDetailsPageByProductType]
///вызывается из [zaimyDetailsRepositoryProvider]
class ZaimyDetailsGetDataSource {
  ZaimyDetailsGetDataSource({required this.dio});
  final Dio dio;

  Future<List<ListZaimyModel>> fetch(String productType, String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
    List<ListZaimyModel> _listOfZaimyDetails = [];
    try {
      final re = await dio.get(
        '/zaimy/$id',
      );
      switch (re.statusCode) {
        case 200:
          re.data.forEach((e) {
            _listOfZaimyDetails.add(ListZaimyModel.fromJson(e));
          });
          return _listOfZaimyDetails;

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