import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/catalog_page/sorting/debit_cards/debit_cards_sort_controller.dart';
import 'package:podberi_ru/features/catalog_page/sorting/credit_cards/credit_cards_sort_bottom_sheet_widget.dart';
import 'package:podberi_ru/features/catalog_page/sorting/debit_cards/debit_cards_sort_bottom_sheet_widget.dart';
import 'package:podberi_ru/features/catalog_page/sorting/zaimy/zaimy_sort_bottom_sheet_widget.dart';

import 'rko/rko_sort_bottom_sheet_widget.dart';

class LoadSortByProductType extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  const LoadSortByProductType({
    super.key,
    required this.basicApiPageSettingsModel,
  });

  @override
  ConsumerState<LoadSortByProductType> createState() =>
      _LoadSortByProductTypeState();
}

class _LoadSortByProductTypeState extends ConsumerState<LoadSortByProductType> {
  String selectedSort = '';

  @override
  Widget build(BuildContext context) {
    if (widget.basicApiPageSettingsModel.whereFrom == AppRoute.homePage.name) {
      selectedSort = ref.watch(sortFromHomePageStateProvider);
    } else if (widget.basicApiPageSettingsModel.whereFrom ==
        AppRoute.selectProductPage.name) {
      selectedSort = ref.watch(sortFromSelectProductPageStateProvider);
    }

    if (widget.basicApiPageSettingsModel.productTypeUrl == 'debit_cards') {
      return DebitCardsSortBottomSheetWidget(
        selectedSort: selectedSort,
        basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
      );
    } else if (widget.basicApiPageSettingsModel.productTypeUrl ==
        'credit_cards') {
      return CreditCardsSortBottomSheetWidget(
          basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
          selectedSort: selectedSort);
    } else if (widget.basicApiPageSettingsModel.productTypeUrl == 'zaimy') {
      return ZaimySortBottomSheetWidget(
          basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
          selectedSort: selectedSort);
    } else {
      return RkoSortBottomSheetWidget(
          basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
          selectedSort: selectedSort);
    }
  }
}
