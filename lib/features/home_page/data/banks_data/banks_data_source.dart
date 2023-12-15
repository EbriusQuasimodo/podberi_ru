
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/all_banks_page/data/all_banks_data_source.dart';

///todo возможно стоит убрать и брать из апи [AllBanksGetDataSource]
class BanksGetDataSource {
  BanksGetDataSource({required this.dio});

  final Dio dio;

  Future<List<BankDetailsModel>> fetch() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      List<BankDetailsModel> _listOfBanks = [];
      try {
        final re = await dio.get(
          '/banks',
        );
        switch (re.statusCode) {
          case 200:
            re.data.forEach((e) {
              _listOfBanks.add(BankDetailsModel.fromJson(e));
            });
            return _listOfBanks;

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
