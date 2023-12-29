import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/favorites_page/data/debit_cards/favorites_debit_cards_repository.dart';

///получение всех избранных продуктов, [productType] содержит в себе не только enum [ProductTypeEnum]
///но и id избранных продуктов
///вызывается из [favoritesCreditCardsRepositoryProvider]
class FavoritesCreditCardsGetDataSource {
  FavoritesCreditCardsGetDataSource({
    required this.dio,
  });

  final Dio dio;

  Future<CreditCardsModel> fetch(String productType) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {

      try {
        final re = await dio.get(
          '/$productType',
        );
        print(re.realUri);
        switch (re.statusCode) {
          case 200:
            return CreditCardsModel.fromJson(re.data);

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
