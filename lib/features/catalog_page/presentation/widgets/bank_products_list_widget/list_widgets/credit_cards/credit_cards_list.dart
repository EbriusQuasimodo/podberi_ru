import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/credit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/debit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_products_list_widget/on_error_widget.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';

import 'credit_card_button_widget.dart';

class CreditCardsListWidget extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final int itemsCount;

  ///list of debit cards. when press on card - go to [DetailsPage]
  const CreditCardsListWidget({
    super.key,
    required this.basicApiPageSettingsModel,
    required this.itemsCount,
  });

  @override
  ConsumerState<CreditCardsListWidget> createState() =>
      _CreditCardsListWidgetState();
}

class _CreditCardsListWidgetState extends ConsumerState<CreditCardsListWidget> {
  final isar = Isar.getInstance();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: widget.itemsCount,
          (BuildContext context, int index) {
        return ref
            .watch(
                creditCardsControllerProvider(widget.basicApiPageSettingsModel))
            .when(data: (creditCards) {
          return CreditCardWidgetWithButtons(
              onTap: () {
                setState(() {});
              },
              basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
              productInfo: creditCards.items[index],
              productRating: '4.8');
        }, error: (error, _) {
          return OnErrorWidget(
              error: error.toString(),
              onGoBackButtonTap: () {
                ref.watch(goRouterProvider).pop();
              },
              onRefreshButtonTap: () {
                ref.refresh(debitCardsControllerProvider(
                    widget.basicApiPageSettingsModel));
              });
        }, loading: () {
          return const SliverFillRemaining(
            child: CustomLoadingCardWidget(
              bottomPadding: 72,
            ),
          );
        });
      }),
    );
  }
}
