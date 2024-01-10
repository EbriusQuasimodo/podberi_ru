import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_products_list_widget/list_widgets/zaimy/zaimy_list.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'list_widgets/credit_cards/credit_cards_list.dart';
import 'list_widgets/debit_cards/debit_cards_list.dart';

class BankProductsListWidget extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final int itemsCount;

  ///list of banks products. when press on card - go to [DetailsPage]
  BankProductsListWidget({
    super.key,
    required this.basicApiPageSettingsModel,
    required this.itemsCount,
  });

  @override
  ConsumerState<BankProductsListWidget> createState() =>
      _BankProductsListWidgetState();
}

class _BankProductsListWidgetState
    extends ConsumerState<BankProductsListWidget> {
  final isar = Isar.getInstance();

  Widget listOfProducts() {
    if (widget.basicApiPageSettingsModel.productTypeUrl == 'debit_cards') {
      return DebitCardsListWidget(
          basicApiPageSettingsModel: widget.basicApiPageSettingsModel, itemsCount: widget.itemsCount,);
    } else if (widget.basicApiPageSettingsModel.productTypeUrl ==
        'credit_cards') {
      return CreditCardsListWidget(
        basicApiPageSettingsModel: widget.basicApiPageSettingsModel,itemsCount: widget.itemsCount,
      );
    } else if (widget.basicApiPageSettingsModel.productTypeUrl ==
        'zaimy') {
      return ZaimyListWidget(
          basicApiPageSettingsModel: widget.basicApiPageSettingsModel,itemsCount: widget.itemsCount,);
    }else{
      return OnErrorWidget(error: NothingFoundException().message, onGoBackButtonTap: (){}, onRefreshButtonTap: (){});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverStack(
      insetOnOverlap: true,
      children: [
        SliverPositioned.fill(
          child: SliverFillRemaining(
            fillOverscroll: true,
            child: Container(
              height: MediaQuery.of(context).size.height - 72,
              margin: const EdgeInsets.only(top: 2, bottom: 72),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
            ),
          ),
        ),
        SliverContainer(
          margin: const EdgeInsets.only(top: 2, bottom: 72),
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeApp.mainWhite,
            ),
            child: widget.basicApiPageSettingsModel.whereFrom ==
                        AppRoute.allBanksPage.name ||
                    widget.basicApiPageSettingsModel.whereFrom ==
                        'homePageBanks'
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    child: Text(
                      'Найдено (${widget.itemsCount} шт.)',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: ThemeApp.darkestGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
          ),
          sliver: SliverPadding(
              padding: EdgeInsets.only(
                top: widget.basicApiPageSettingsModel.whereFrom ==
                            AppRoute.allBanksPage.name ||
                        widget.basicApiPageSettingsModel.whereFrom ==
                            'homePageBanks'
                    ? 15
                    : 47,
                right: 15,
                left: 15,
                bottom: 5,
              ),
              sliver: listOfProducts()),
        ),
      ],
    );
  }
}
