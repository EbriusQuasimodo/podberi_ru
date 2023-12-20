import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/features/comparison_page/data/comparison_repository.dart';

///получение всех продуктов в сравнении, [productType] содержит в себе не только enum [ProductTypeEnum]
///но и id продуктов в сравнении
///вызывается из [comparisonRepositoryProvider]
class ComparisonGetDataSource {
  ComparisonGetDataSource({
    required this.dio,
  });

  final Dio dio;

  Future<List<ListProductModel>> fetch(String productType) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      List<ListProductModel> _listOfComparison = [];

      try {
        final re = await dio.get(
          '/$productType',
        );
        print(re.realUri);
        switch (re.statusCode) {
          case 200:
            re.data.forEach((e) {
              _listOfComparison.add(ListProductModel.fromJson(e));
            });
            return _listOfComparison;

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
