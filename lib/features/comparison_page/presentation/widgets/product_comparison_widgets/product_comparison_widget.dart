import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/presentation/expandable_page_view.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/rko/comparison_rko_data.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/comparison_page/presentation/comparison_page.dart';
import 'package:podberi_ru/features/comparison_page/presentation/comparison_page_controller.dart';

import 'mini_product_card_widget.dart';

class ProductComparisonWidget extends ConsumerStatefulWidget {
  final List<ListProductModel> comparisonList;
  final VoidCallback onDeleteInFirstList;
  final VoidCallback onDeleteInSecondList;
  final VoidCallback onScrollPageViews;

  ///виджет карточки с продуктами в сранении, используется в [ComparisonPage]
  ProductComparisonWidget({
    super.key,
    required this.onDeleteInFirstList,
    required this.comparisonList,
    required this.onDeleteInSecondList,
    required this.onScrollPageViews,
  });

  @override
  ConsumerState<ProductComparisonWidget> createState() =>
      _ProductComparisonWidgetState();
}

class _ProductComparisonWidgetState
    extends ConsumerState<ProductComparisonWidget> {
  final controllerBestOffers = PageController(
    viewportFraction: 0.9,
  );
  final controllerSecondPageView = PageController(
    viewportFraction: 0.9,
  );

  double currentPageOnFirstPageView = 0;
  double currentPageOnSecondPageView = 0;

  @override
  void didChangeDependencies() {
    controllerSecondPageView.addListener(() {
      currentPageOnSecondPageView = controllerSecondPageView.page!.toDouble();
      ref
              .watch(comparisonSecondProductDescriptionStateController.notifier)
              .state =
          widget.comparisonList[currentPageOnSecondPageView.toInt()].cardName;
      setState(() {});
      widget.onScrollPageViews();
    });

    controllerBestOffers.addListener(() {
      currentPageOnFirstPageView = controllerBestOffers.page!.toDouble();
      ref.watch(comparisonFirstProductDescriptionStateProvider.notifier).state =
          widget.comparisonList[currentPageOnFirstPageView.toInt()].cardName;
      setState(() {});
      widget.onScrollPageViews();
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controllerSecondPageView.dispose();
    controllerBestOffers.dispose();
    super.dispose();
  }

  final isar = Isar.getInstance();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
              child: Text(
                'Продукты в сравнении',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ThemeApp.backgroundBlack),
              ),
            ),
            CustomExpandablePageView(
              pageController: controllerBestOffers,
              children: List.generate(widget.comparisonList.length, (index) {
                return MiniProductCardWidget(
                  comparisonList: widget.comparisonList[index],
                  onDelete: () async {
                    switch (ref.watch(comparisonProductUrlStateProvider)) {
                      case 'debit_cards':
                        ComparisonDebitCardsData comparisonDebitCardsData =
                            ComparisonDebitCardsData()
                              ..id = widget.comparisonList[index].id;

                        await isar?.writeTxn(() async =>
                            await ref
                                .watch(isarNotifierProvider.notifier)
                                .isItemDuplicateInComparison(
                              widget.comparisonList[index],
                              ref.watch(
                                  comparisonProductUrlStateProvider),
                            )
                                ? await isar?.comparisonDebitCardsDatas
                                    .filter()
                                    .idEqualTo(widget.comparisonList[index].id)
                                    .deleteAll()
                                : await isar?.comparisonDebitCardsDatas
                                    .put(comparisonDebitCardsData));
                      case 'credit_cards':
                        ComparisonCreditCardsData comparisonCreditCardsData =
                            ComparisonCreditCardsData()
                              ..id = widget.comparisonList[index].id;
                        await isar?.writeTxn(() async =>
                            await ref
                                .watch(isarNotifierProvider.notifier)
                                .isItemDuplicateInComparison(
                              widget.comparisonList[index],
                              ref.watch(
                                  comparisonProductUrlStateProvider),
                            )
                                ? await isar?.comparisonCreditCardsDatas
                                    .filter()
                                    .idEqualTo(widget.comparisonList[index].id)
                                    .deleteAll()
                                : await isar?.comparisonCreditCardsDatas
                                    .put(comparisonCreditCardsData));
                      case 'zaimy':
                        ComparisonZaimyData comparisonZaimyData =
                            ComparisonZaimyData()
                              ..id = widget.comparisonList[index].id;
                        await isar?.writeTxn(() async =>
                            await ref
                                .watch(isarNotifierProvider.notifier)
                                .isItemDuplicateInComparison(
                              widget.comparisonList[index],
                              ref.watch(
                                  comparisonProductUrlStateProvider),
                            )
                                ? await isar?.comparisonZaimyDatas
                                    .filter()
                                    .idEqualTo(widget.comparisonList[index].id)
                                    .deleteAll()
                                : await isar?.comparisonZaimyDatas
                                    .put(comparisonZaimyData));
                      case 'rko':
                        ComparisonRkoData comparisonRkoData =
                            ComparisonRkoData()
                              ..id = widget.comparisonList[index].id;
                        await isar?.writeTxn(() async =>
                            await ref
                                .watch(isarNotifierProvider.notifier)
                                .isItemDuplicateInComparison(
                              widget.comparisonList[index],
                              ref.watch(
                                  comparisonProductUrlStateProvider),
                            )
                                ? await isar?.comparisonRkoDatas
                                    .filter()
                                    .idEqualTo(widget.comparisonList[index].id)
                                    .deleteAll()
                                : await isar?.comparisonRkoDatas
                                    .put(comparisonRkoData));
                    }
                    ref.refresh(comparisonListControllerProvider);
                    setState(() {
                      controllerBestOffers.animateToPage(
                          controllerBestOffers.page == 1.0 ? 1 : index - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      if (controllerBestOffers.page ==
                          controllerSecondPageView.page) {
                        controllerSecondPageView.animateToPage(
                            controllerSecondPageView.page == 1.0
                                ? 1
                                : index - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      }
                    });
                    widget.onDeleteInFirstList();
                  },
                );
              }),
            ),
            widget.comparisonList.length == 1
                ? const SizedBox(
                    height: 32,
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 11, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.comparisonList.length,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4),
                            alignment: Alignment.centerLeft,
                            height:
                                currentPageOnFirstPageView == index ? 10 : 8,
                            width: currentPageOnFirstPageView == index ? 10 : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPageOnFirstPageView == index
                                  ? ThemeApp.backgroundBlack
                                  : ThemeApp.darkestGrey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
            widget.comparisonList.length == 1
                ? const SizedBox.shrink()
                : CustomExpandablePageView(
                    pageController: controllerSecondPageView,
                    children:
                        List.generate(widget.comparisonList.length, (index) {
                      return MiniProductCardWidget(
                        comparisonList: widget.comparisonList[index],
                        onDelete: () async {
                          switch (
                              ref.watch(comparisonProductUrlStateProvider)) {
                            case 'debit_cards':
                              ComparisonDebitCardsData
                                  comparisonDebitCardsData =
                                  ComparisonDebitCardsData()
                                    ..id = widget.comparisonList[index].id;

                              await isar?.writeTxn(() async => await ref
                                      .watch(isarNotifierProvider.notifier)
                                      .isItemDuplicateInComparison(
                                        widget.comparisonList[index],
                                        ref.watch(
                                            comparisonProductUrlStateProvider),
                                      )
                                  ? await isar?.comparisonDebitCardsDatas
                                      .filter()
                                      .idEqualTo(
                                          widget.comparisonList[index].id)
                                      .deleteAll()
                                  : await isar?.comparisonDebitCardsDatas
                                      .put(comparisonDebitCardsData));
                            case 'credit_cards':
                              ComparisonCreditCardsData
                                  comparisonCreditCardsData =
                                  ComparisonCreditCardsData()
                                    ..id = widget.comparisonList[index].id;
                              await isar?.writeTxn(() async =>
                                  await ref
                                      .watch(isarNotifierProvider.notifier)
                                      .isItemDuplicateInComparison(
                                    widget.comparisonList[index],
                                    ref.watch(
                                        comparisonProductUrlStateProvider),
                                  )
                                      ? await isar?.comparisonCreditCardsDatas
                                          .filter()
                                          .idEqualTo(
                                              widget.comparisonList[index].id)
                                          .deleteAll()
                                      : await isar?.comparisonCreditCardsDatas
                                          .put(comparisonCreditCardsData));
                            case 'zaimy':
                              ComparisonZaimyData comparisonZaimyData =
                                  ComparisonZaimyData()
                                    ..id = widget.comparisonList[index].id;
                              await isar?.writeTxn(() async =>
                                  await ref
                                      .watch(isarNotifierProvider.notifier)
                                      .isItemDuplicateInComparison(
                                    widget.comparisonList[index],
                                    ref.watch(
                                        comparisonProductUrlStateProvider),
                                  )
                                      ? await isar?.comparisonZaimyDatas
                                          .filter()
                                          .idEqualTo(
                                              widget.comparisonList[index].id)
                                          .deleteAll()
                                      : await isar?.comparisonZaimyDatas
                                          .put(comparisonZaimyData));
                            case 'rko':
                              ComparisonRkoData comparisonRkoData =
                                  ComparisonRkoData()
                                    ..id = widget.comparisonList[index].id;
                              await isar?.writeTxn(() async =>
                                  await ref
                                      .watch(isarNotifierProvider.notifier)
                                      .isItemDuplicateInComparison(
                                    widget.comparisonList[index],
                                    ref.watch(
                                        comparisonProductUrlStateProvider),
                                  )
                                      ? await isar?.comparisonRkoDatas
                                          .filter()
                                          .idEqualTo(
                                              widget.comparisonList[index].id)
                                          .deleteAll()
                                      : await isar?.comparisonRkoDatas
                                          .put(comparisonRkoData));
                          }
                          ref.refresh(comparisonListControllerProvider);
                          setState(() {
                            controllerSecondPageView.animateToPage(
                                controllerSecondPageView.page == 1.0
                                    ? 1
                                    : index - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                            if (controllerBestOffers.page ==
                                controllerSecondPageView.page) {
                              controllerBestOffers.animateToPage(
                                  controllerBestOffers.page == 1.0
                                      ? 1
                                      : index - 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                          });
                          widget.onDeleteInSecondList();
                        },
                      );
                    }),
                  ),
            widget.comparisonList.length == 1
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(top: 11, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.comparisonList.length,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4),
                            alignment: Alignment.centerLeft,
                            height:
                                currentPageOnSecondPageView == index ? 10 : 8,
                            width:
                                currentPageOnSecondPageView == index ? 10 : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPageOnSecondPageView == index
                                  ? ThemeApp.backgroundBlack
                                  : ThemeApp.darkestGrey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
