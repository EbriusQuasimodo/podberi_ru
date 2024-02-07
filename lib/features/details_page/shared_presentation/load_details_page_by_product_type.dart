import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/error_widgets/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/details_page/credit_cards/presentation/credit_cards_details_controller.dart';
import 'package:podberi_ru/features/details_page/debit_cards/presentation/debit_cards_controller.dart';
import 'package:podberi_ru/features/details_page/zaimy/presentation/zaimy_controller.dart';

import '../credit_cards/presentation/credit_cards_details_page.dart';
import '../debit_cards/presentation/debit_cards_details_page.dart';
import '../zaimy/presentation/zaimy_details_page.dart';

class LoadDetailsPageByProductType extends ConsumerWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  ///виджет для загрузки страницы деталей по выбранному типу продукта
  const LoadDetailsPageByProductType({super.key, required this.basicApiPageSettingsModel,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (basicApiPageSettingsModel.productTypeUrl == 'debit_cards') {
      return ref
          .watch(debitCardsDetailsControllerProvider(basicApiPageSettingsModel))
          .when(data: (debitCards) {
        return DebitCardsDetailsPage(
          detailsInfo: debitCards, basicApiPageSettingsModel: basicApiPageSettingsModel,

        );
      }, error: (error, _) {
        return OnErrorWidget(
            error: error.toString(),
            onGoBackButtonTap: () {
              ref.watch(goRouterProvider).pop();
            },
            onRefreshButtonTap: () {
              ref.refresh(debitCardsDetailsControllerProvider(basicApiPageSettingsModel));
            });
      }, loading: () {
        return const CustomLoadingCardWidget(
          bottomPadding: 72,
        );
      });
    }else if(basicApiPageSettingsModel.productTypeUrl =='credit_cards'){
      return ref
          .watch(creditCardsDetailsControllerProvider(basicApiPageSettingsModel))
          .when(data: (creditCards) {
        return CreditCardsDetailsPage(
          detailsInfo: creditCards, basicApiPageSettingsModel: basicApiPageSettingsModel,

        );
      }, error: (error, _) {
        return OnErrorWidget(
            error: error.toString(),
            onGoBackButtonTap: () {
              ref.watch(goRouterProvider).pop();
            },
            onRefreshButtonTap: () {
              ref.refresh(creditCardsDetailsControllerProvider(basicApiPageSettingsModel));
            });
      }, loading: () {
        return const CustomLoadingCardWidget(
          bottomPadding: 72,
        );
      });
    }else if (basicApiPageSettingsModel.productTypeUrl =='zaimy'){
      return ref
          .watch(zaimyDetailsControllerProvider(basicApiPageSettingsModel))
          .when(data: (zaimy) {
        return ZaimyDetailsPage(
          detailsInfo: zaimy, basicApiPageSettingsModel: basicApiPageSettingsModel,

        );
      }, error: (error, _) {
        return OnErrorWidget(
            error: error.toString(),
            onGoBackButtonTap: () {
              ref.watch(goRouterProvider).pop();
            },
            onRefreshButtonTap: () {
              ref.refresh(zaimyDetailsControllerProvider(basicApiPageSettingsModel));
            });
      }, loading: () {
        return const CustomLoadingCardWidget(
          bottomPadding: 72,
        );
      });
    }else{
      return OnErrorWidget(error: NothingFoundException().message, onGoBackButtonTap: (){}, onRefreshButtonTap: (){});

    }

  }
}