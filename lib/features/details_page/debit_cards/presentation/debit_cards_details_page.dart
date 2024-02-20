import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/debit_cards/presentation/debit_cards_controller.dart';

import 'widgets/debit_card_conditions_widget.dart';
import 'widgets/debit_card_description_widget.dart';
import 'widgets/debit_card_preview_widget.dart';


class DebitCardsDetailsPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final ListDebitCardsModel detailsInfo;

  ///странциа деталей дебетовки
  const DebitCardsDetailsPage(
      {super.key,
      required this.basicApiPageSettingsModel,
      required this.detailsInfo});

  @override
  ConsumerState<DebitCardsDetailsPage> createState() =>
      _DebitCardsDetailsPageState();
}

class _DebitCardsDetailsPageState extends ConsumerState<DebitCardsDetailsPage> {
  late String productType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: ThemeApp.mainBlue,
        onRefresh: () => ref.refresh(debitCardsDetailsControllerProvider(
                widget.basicApiPageSettingsModel)
            .future),
        child: CustomScrollView(
        //  physics: new ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0,
              backgroundColor: ThemeApp.mainWhite,
              pinned: true,
              title: Text(widget.basicApiPageSettingsModel.pageName!),
            ),
            DebitCardPreviewWidget(
              basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
              productInfo: widget.detailsInfo,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeApp.mainWhite,
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 21, bottom: 22, left: 15, right: 15),
                  child: Text(
                    'Есть возможность кастомизации дизайна',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ThemeApp.mainBlue),
                  ),
                ),
              ),
            ),
            DebitCardConditionsWidget(
              productInfo: widget.detailsInfo,
              basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
            ),
            DebitCardDescriptionWidget(
              productInfo: widget.detailsInfo,
            ),
          ],
        ),
      ),
    );
  }
}
