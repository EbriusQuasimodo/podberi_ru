import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/details_page/data/product_details_repository.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';

///получение деталей о банковском продукте, принимает в себя тип продукта(катеогорию) и его id
///используется в [DetailsPage]
///вызывается из [productDetailsRepositoryProvider]
class ProductDetailsGetDataSource {
  ProductDetailsGetDataSource({required this.dio});
  final Dio dio;

  Future<List<ListDebitCardsModel>> fetch(String productType, String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
    List<ListDebitCardsModel> _listOfProductDetails = [];
    try {
      final re = await dio.get(
        '/$productType/$id',
      );
      switch (re.statusCode) {
        case 200:
          re.data.forEach((e) {
            _listOfProductDetails.add(ListDebitCardsModel.fromJson(e));
          });
          return _listOfProductDetails;

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
