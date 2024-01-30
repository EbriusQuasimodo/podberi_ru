import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/details_page/zaimy/data/zaimy_details_repository.dart';

///получение деталей о займе, принимает в себя id
///вызывается из [zaimyDetailsRepositoryProvider]
class ZaimyDetailsGetDataSource {
  ZaimyDetailsGetDataSource({required this.dio});
  final Dio dio;

  Future<ListZaimyModel> fetch(String productType, String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {

    try {
      final re = await dio.get(
        '/zaimy/$id',
      );
      switch (re.statusCode) {
        case 200:
         
          return ListZaimyModel.fromJson(re.data);

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
