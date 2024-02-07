import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/features/home_page/data/best_banks_data/best_banks_data_source.dart';
import 'package:podberi_ru/features/home_page/data/best_banks_data/best_banks_repository.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/mini_list_of_banks_widgets/mini_list_of_banks_widget.dart';

class BestBanksController extends AutoDisposeAsyncNotifier<BanksDetailsModel> {
  BestBanksController();
  @override
  FutureOr<BanksDetailsModel> build() async {
    final bestBanksRepo = ref.read(bestBanksRepositoryProvider);
    return await bestBanksRepo.fetch(ref);
  }
}

///контроллер для "лучших" (первых 6ти) банков, вызывает получение данных о всех банках в [BestBanksGetDataSource]
///используется в [MiniListOfBanksWidget]
final bestBanksControllerProvider =
AutoDisposeAsyncNotifierProvider<BestBanksController, BanksDetailsModel>(
  BestBanksController.new,
);