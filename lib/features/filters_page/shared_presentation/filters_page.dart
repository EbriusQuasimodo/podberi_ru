import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/error_widgets/on_error_widget.dart';
import 'package:podberi_ru/features/filters_page/debit_cards/presentation/debit_cards_filters_page.dart';

import '../credit_cards/presentation/credit_cards_filters_page.dart';
import '../zaimy/presentation/zaimy_filters_page.dart';


class FiltersPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///страница с фильтрами
  const FiltersPage({super.key, required this.basicApiPageSettingsModel});

  @override
  ConsumerState<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends ConsumerState<FiltersPage> {

  @override
  Widget build(BuildContext context) {
    if (widget.basicApiPageSettingsModel.productTypeUrl ==  'debit_cards') {
     return DebitCardsFiltersPage(basicApiPageSettingsModel: widget.basicApiPageSettingsModel);
    }else if(widget.basicApiPageSettingsModel.productTypeUrl==  'credit_cards'){
      return CreditCardsFiltersPage(basicApiPageSettingsModel: widget.basicApiPageSettingsModel);
    }else if (widget.basicApiPageSettingsModel.productTypeUrl ==  'zaimy'){
      return ZaimyFiltersPage(basicApiPageSettingsModel: widget.basicApiPageSettingsModel);
    }else{
      return SliverFillRemaining(child: OnErrorWidget(error: NothingFoundException().message, onGoBackButtonTap: (){}, onRefreshButtonTap: (){}));

    }

  }
}