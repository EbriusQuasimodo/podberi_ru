import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/page_controllers/debit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/page_controllers/zaimy_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_products_list_widget/list_widgets/zaimy/zaimy_button_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';


class ZaimyListWidget extends ConsumerStatefulWidget {
  final int itemsCount;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///list of zaimy. when press on card - go to [LoadDetailsPageByProductType]
  const ZaimyListWidget({
    super.key,
    required this.basicApiPageSettingsModel,
    required this.itemsCount,
  });

  @override
  ConsumerState<ZaimyListWidget> createState() =>
      _ZaimyListWidgetState();
}

class _ZaimyListWidgetState extends ConsumerState<ZaimyListWidget> {
  final isar = Isar.getInstance();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: widget.itemsCount,(BuildContext context, int index) {
        return ref
            .watch(zaimyControllerProvider(
            widget.basicApiPageSettingsModel))
            .when(data: (zaimyCards) {
          return ZaimyWidgetWithButtons(
              onTap: () {
                setState(() {});
              },
              basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
              productInfo: zaimyCards.items[index],
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
