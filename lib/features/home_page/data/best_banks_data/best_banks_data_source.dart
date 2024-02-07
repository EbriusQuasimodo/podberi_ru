import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/features/home_page/data/best_banks_data/best_banks_repository.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/mini_list_of_banks_widgets/mini_list_of_banks_widget.dart';

///получение списка "лучших" (первых 6ти) банков, используется в [MiniListOfBanksWidget],
///вызывается через [bestBanksRepositoryProvider]
class BestBanksGetDataSource {
  BestBanksGetDataSource({required this.dio});

  final Dio dio;

  Future<BanksDetailsModel> fetch() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final re = await dio.get(
          '/banks?fetch=6&page=1',
        );
        switch (re.statusCode) {
          case 200:

            return BanksDetailsModel.fromJson(re.data);

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