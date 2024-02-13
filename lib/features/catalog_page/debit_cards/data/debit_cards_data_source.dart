import 'dart:async';

import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';

///получение всех банковских продуктов [productType] содержит в себе не только enum [ProductTypeEnum]
///но и фильтры, имя банка, сортировку и тд
///вызывается из [debitCardsRepositoryProvider]
class DebitCardsGetDataSource {
  DebitCardsGetDataSource({
    required this.dio,
  });

  final Dio dio;

  Future<DebitCardsModel> fetch(String urlWithParams) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final re = await dio.get(
          '/$urlWithParams',

        );
        print(re.realUri);
        switch (re.statusCode) {

          case 200:
            return DebitCardsModel.fromJson(re.data);

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
