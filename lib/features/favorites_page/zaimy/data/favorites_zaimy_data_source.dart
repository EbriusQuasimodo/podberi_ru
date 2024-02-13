import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/core/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/favorites_page/zaimy/data/favorites_zaimy_repository.dart';

///получение всех займов в избранном, [productType] содержит в себе не только enum [ProductTypeEnum]
///но и id
///вызывается из [favoritesZaimyRepositoryProvider]
class FavoritesZaimyGetDataSource {
  FavoritesZaimyGetDataSource({
    required this.dio,
  });

  final Dio dio;

  Future<ZaimyModel> fetch(String productTypeWithQuery) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {

      try {
        final re = await dio.get(
          '/$productTypeWithQuery',
        );
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
