import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/details_page/presentation/controllers/debit_cards_controller.dart';
import 'zaimy_conditions_widget.dart';
import 'zaimy_preview_widget.dart';

class ZaimyDetailsPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final ListZaimyModel detailsInfo;

  ///странциа деталей банковского продукта
  const ZaimyDetailsPage(
      {super.key,
      required this.basicApiPageSettingsModel,
      required this.detailsInfo});

  @override
  ConsumerState<ZaimyDetailsPage> createState() =>
      _ZaimyDetailsPageState();
}

class _ZaimyDetailsPageState extends ConsumerState<ZaimyDetailsPage> {
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
            ZaimyPreviewWidget(
              onFavoritesOrComparisonTap: () {
                setState(() {});
              },
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
            ZaimyConditionsWidget(
              productInfo: widget.detailsInfo,
              basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
            ),
            ///todo: пока что непонятно будет ли описание у микрозаймов
            // ZaimyDescriptionWidget(
            //   productInfo: widget.detailsInfo,
            // ),
          ],
        ),
      ),
    );
  }
}
