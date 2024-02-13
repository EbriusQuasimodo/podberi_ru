import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'widgets/zaimy_conditions_widget.dart';
import 'widgets/zaimy_preview_widget.dart';
import 'zaimy_controller.dart';

class ZaimyDetailsPage extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final ListZaimyModel detailsInfo;

  ///странциа деталей займа
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
        onRefresh: () => ref.refresh(zaimyDetailsControllerProvider(
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
