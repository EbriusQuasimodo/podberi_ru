import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/credit_cards/presentation/credit_cards_controller.dart';

import 'credit_card_button_widget.dart';

class CreditCardsListWidget extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final int itemsCount;

  ///list of credit cards. when press on card - go to [LoadDetailsPageByProductType]
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
  static const pageSize = 10;
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: widget.itemsCount,
          (BuildContext context, int index) {
            page = index ~/ pageSize+1;
            final indexInPage = index % pageSize;
        return ref
            .watch(
                creditCardsControllerProvider(widget.basicApiPageSettingsModel..page=page))
            .when(data: (creditCards) {
          if (indexInPage >= creditCards.items.length) {
            return const SizedBox.shrink();
          } else {
            final creditCard = creditCards.items[indexInPage];
          return CreditCardWidgetWithButtons(
              onTap: () {
                setState(() {});
              },
              basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
              productInfo: creditCard,
              productRating: '4.8');}
        }, error: (error, _) {
          return SizedBox.shrink();
        }, loading: () {
          return SizedBox.shrink();
        });
      }),
    );
  }
}
