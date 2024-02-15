import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/debit_cards/presentation/debit_cards_controller.dart';
import 'package:podberi_ru/features/details_page/rko/presentation/widgets/bank_info_widget.dart';

import 'widgets/rko_preview_widget.dart';



class RkoDetailsPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final ListRkoModel detailsInfo;

  ///странциа деталей дебетовки
  const RkoDetailsPage(
      {super.key,
      required this.basicApiPageSettingsModel,
      required this.detailsInfo});

  @override
  ConsumerState<RkoDetailsPage> createState() =>
      _RkoDetailsPageState();
}

class _RkoDetailsPageState extends ConsumerState<RkoDetailsPage> {
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
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0,
              backgroundColor: ThemeApp.mainWhite,
              pinned: true,
              title: Text(widget.basicApiPageSettingsModel.pageName!),
            ),
            RkoPreviewWidget(
              basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
              productInfo: widget.detailsInfo,
            ),
           RkoBankInfoWidget(basicApiPageSettingsModel: widget.basicApiPageSettingsModel,)

          ],
        ),
      ),
    );
  }
}
