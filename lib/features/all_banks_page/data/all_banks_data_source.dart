import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/all_banks_page/data/all_banks_repository.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_page.dart';
import 'package:podberi_ru/features/filters_page/presentation/filters_page.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/mini_list_of_banks_widget.dart';

///получение списка всех банков, используется в [MiniListOfBanksWidget], [AllBanksPage] и [FiltersPage]
///вызывается через [allBanksRepositoryProvider]
class AllBanksGetDataSource {
  AllBanksGetDataSource({required this.dio});

  final Dio dio;

  Future<List<BankDetailsModel>> fetch() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      List<BankDetailsModel> _listOfAllBanks = [];
      try {
        final re = await dio.get(
          '/banks',
        );
        switch (re.statusCode) {
          case 200:
            re.data.forEach((e) {
              _listOfAllBanks.add(BankDetailsModel.fromJson(e));
            });
            return _listOfAllBanks;

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