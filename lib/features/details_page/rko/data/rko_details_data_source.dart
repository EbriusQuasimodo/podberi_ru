import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';

///получение деталей о рко, принимает в себя id
///вызывается из [rkoDetailsRepositoryProvider]
class RkoDetailsGetDataSource {
  RkoDetailsGetDataSource({required this.dio});
  final Dio dio;

  Future<ListRkoModel> fetch(String productType, String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {

    try {
      final re = await dio.get(
        '/rko/$id',
      );
      switch (re.statusCode) {
        case 200:
          return ListRkoModel.fromJson(re.data);

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
