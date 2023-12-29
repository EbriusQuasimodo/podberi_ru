import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';

///получение всех избранных продуктов, [productType] содержит в себе не только enum [ProductTypeEnum]
///но и id избранных продуктов
///вызывается из [favoritesZaimyRepositoryProvider]
class FavoritesZaimyGetDataSource {
  FavoritesZaimyGetDataSource({
    required this.dio,
  });

  final Dio dio;

  Future<ZaimyModel> fetch(String productType) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {

      try {
        final re = await dio.get(
          '/$productType',
        );
        print(re.realUri);
        switch (re.statusCode) {
          case 200:
            return ZaimyModel.fromJson(re.data);

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
