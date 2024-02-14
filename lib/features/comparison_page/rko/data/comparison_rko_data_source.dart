import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';

///получение рко  в сравнении, [productType] содержит в себе не только enum [ProductTypeEnum]
///но и id продуктов в сравнении
///вызывается из [comparisonRkoRepositoryProvider]
class ComparisonRkoGetDataSource {
  ComparisonRkoGetDataSource({
    required this.dio,
  });

  final Dio dio;

  Future<RkoModel> fetch(String productType) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {

      try {
        final re = await dio.get(
          '/$productType',
        );
        switch (re.statusCode) {
          case 200:
            return RkoModel.fromJson(re.data);

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
