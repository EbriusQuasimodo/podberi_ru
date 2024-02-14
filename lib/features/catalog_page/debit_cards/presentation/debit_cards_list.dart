import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';

import 'debit_card_button_widget.dart';
import 'debit_cards_controller.dart';

class DebitCardsListWidget extends ConsumerStatefulWidget {
  final int itemsCount;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///list of debit cards. when press on card
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
  static const pageSize = 10;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: widget.itemsCount,
          (BuildContext context, int index) {
        page = index ~/ pageSize + 1;
        final indexInPage = index % pageSize;
        //print(page);
        widget.basicApiPageSettingsModel.page = page;
        return ref
            .watch(
                debitCardsControllerProvider(widget.basicApiPageSettingsModel))
            .when(data: (debitCards) {
          if (indexInPage >= debitCards.items.length) {
            return const SizedBox.shrink();
          } else {
            final debitCard = debitCards.items[indexInPage];
            return DebitCardWidgetWithButtons(
                onTapComparison: () {
                  setState(() {});
                },
                onTapFavorites: () async {

                  // await ref
                  //         .read(isarNotifierProvider.notifier)
                  //         .isItemDuplicateInFavorites(debitCard.id,
                  //             widget.basicApiPageSettingsModel.productTypeUrl!)
                  //     ? ref
                  //         .watch(favoritesDebitCardsListStateProvider.notifier)
                  //         .state
                  //         .removeWhere((element) => element.id == debitCard.id)
                  //     : ref
                  //         .watch(favoritesDebitCardsListStateProvider.notifier)
                  //         .state
                  //         .insert(0,debitCard);
                  //ref.invalidate(favoritesDebitCardsListControllerProvider);
                },
                basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
                productInfo: debitCard,
                productRating: '4.8');
          }
        }, error: (error, _) {
          return SizedBox.shrink();
        }, loading: () {
          return SizedBox.shrink();
        });
      }),
    );
  }
}
