import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/debit_cards_controller.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';

import 'debit_card_button_widget.dart';

class DebitCardsListWidget extends ConsumerStatefulWidget {
  final int itemsCount;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///list of debit cards. when press on card - go to [LoadDetailsPageByProductType]
  const DebitCardsListWidget({
    super.key,
    required this.basicApiPageSettingsModel,
    required this.itemsCount,
  });

  @override
  ConsumerState<DebitCardsListWidget> createState() =>
      _DebitCardsListWidgetState();
}

class _DebitCardsListWidgetState extends ConsumerState<DebitCardsListWidget> {
  final isar = Isar.getInstance();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: widget.itemsCount,(BuildContext context, int index) {
        return ref
            .watch(debitCardsControllerProvider(
                widget.basicApiPageSettingsModel))
            .when(data: (debitCards) {
          return DebitCardWidgetWithButtons(
              onTap: () {
                setState(() {});
              },
              basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
              productInfo: debitCards.items[index],
              productRating: '4.8');
        }, error: (error, _) {
          return SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: OnErrorWidget(
                error: error.toString(),
                onGoBackButtonTap: () {
                  ref.watch(goRouterProvider).pop();
                },
                onRefreshButtonTap: () {
                  ref.refresh(debitCardsControllerProvider(
                      widget.basicApiPageSettingsModel));
                }),
          );
        }, loading: () {
         return  const SliverFillRemaining(
            child: CustomLoadingCardWidget(
              bottomPadding: 72,
            ),
          );
        });
      }),
    );
  }
}
