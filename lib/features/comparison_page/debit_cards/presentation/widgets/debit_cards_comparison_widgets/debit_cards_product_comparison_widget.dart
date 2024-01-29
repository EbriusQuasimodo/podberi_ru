import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/presentation/expandable_page_view.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/shared_widgets/load_comparison_by_product_type.dart';

import 'mini_debit_card_widget.dart';

class DebitCardsComparisonWidget extends ConsumerStatefulWidget {
  final List<ListDebitCardsModel> debitCardsList;
  final VoidCallback onDeleteFromComparison;
  final VoidCallback onDeleteFromComparisonTwo;
  final VoidCallback onScrollPageViews;

  ///виджет дебетовок в сранении, используется в [LoadComparisonByProductType]
  const DebitCardsComparisonWidget({
    super.key,
    required this.debitCardsList,
    required this.onDeleteFromComparison,
    required this.onScrollPageViews,
    required this.onDeleteFromComparisonTwo,
  });

  @override
  ConsumerState<DebitCardsComparisonWidget> createState() =>
      _DebitCardsComparisonWidgetState();
}

class _DebitCardsComparisonWidgetState
    extends ConsumerState<DebitCardsComparisonWidget> {
  final controllerFirstPageView = PageController(
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
      ref.watch(comparisonSecondDebitBankNameStateController.notifier).state =
          widget.debitCardsList[currentPageOnSecondPageView.toInt()]
              .bankDetails!.bankName;
      ref.watch(comparisonSecondDebitProductNameStateController.notifier).state =
          widget.debitCardsList[currentPageOnSecondPageView.toInt()]
              .name;
      ref.watch(comparisonSecondDebitPageNumStateController.notifier).state =
          currentPageOnSecondPageView.toInt();
      setState(() {});
        widget.onScrollPageViews();

    });

    controllerFirstPageView.addListener(() {
      currentPageOnFirstPageView = controllerFirstPageView.page!.toDouble();
      ref.watch(comparisonFirstDebitBankNameStateProvider.notifier).state =
          widget.debitCardsList[currentPageOnFirstPageView.toInt()].bankDetails!
              .bankName;
      ref.watch(comparisonFirstDebitProductNameStateProvider.notifier).state =
          widget.debitCardsList[currentPageOnFirstPageView.toInt()].name;
      ref.watch(comparisonFirstDebitPageNumStateProvider.notifier).state =
          currentPageOnSecondPageView.toInt();
      setState(() {});
        widget.onScrollPageViews();

    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    //controllerSecondPageView.dispose();
    //controllerFirstPageView.dispose();
    super.dispose();
  }

  final isar = Isar.getInstance();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ThemeApp.mainWhite,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
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
            pageController: controllerFirstPageView,
            children: List.generate(widget.debitCardsList.length, (index) {
              return MiniDebitCardWidget(
                debitCard: widget.debitCardsList[index],
                onDelete: () async {
                  ComparisonDebitCardsData comparisonDebitCardsData =
                      ComparisonDebitCardsData()
                        ..id = widget.debitCardsList[index].id;

                  await isar?.writeTxn(() async => await ref
                          .watch(isarNotifierProvider.notifier)
                          .isItemDuplicateInComparison(
                            widget.debitCardsList[index].id,
                            ref.watch(comparisonProductUrlStateProvider),
                          )
                      ? await isar?.comparisonDebitCardsDatas
                          .filter()
                          .idEqualTo(widget.debitCardsList[index].id)
                          .deleteAll()
                      : await isar?.comparisonDebitCardsDatas
                          .put(comparisonDebitCardsData));

                  ref.refresh(comparisonDebitCardsListControllerProvider);
                  setState(() {
                    controllerFirstPageView.animateToPage(
                        controllerFirstPageView.page == 0.0 ? -1 : index - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                    if(controllerSecondPageView.positions.isNotEmpty){
                      if (controllerFirstPageView.page ==
                          controllerSecondPageView.page) {
                        controllerSecondPageView.animateToPage(
                            controllerSecondPageView.page == 0.0 ? -1 : index - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      }}
                  });

                  widget.onDeleteFromComparison();
                },
              );
            }),
          ),
          widget.debitCardsList.length == 1
              ? const SizedBox(
                  height: 32,
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.debitCardsList.length,
                      (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 4),
                          alignment: Alignment.centerLeft,
                          height: currentPageOnFirstPageView == index ? 10 : 8,
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
          widget.debitCardsList.length == 1
              ? const SizedBox.shrink()
              : CustomExpandablePageView(
                  pageController: controllerSecondPageView,
                  children:
                      List.generate(widget.debitCardsList.length, (index) {
                    return MiniDebitCardWidget(
                      debitCard: widget.debitCardsList[index],
                      onDelete: () async {
                        ComparisonDebitCardsData comparisonDebitCardsData =
                            ComparisonDebitCardsData()
                              ..id = widget.debitCardsList[index].id;

                        await isar?.writeTxn(() async => await ref
                                .watch(isarNotifierProvider.notifier)
                                .isItemDuplicateInComparison(
                                  widget.debitCardsList[index].id,
                                  ref.watch(comparisonProductUrlStateProvider),
                                )
                            ? await isar?.comparisonDebitCardsDatas
                                .filter()
                                .idEqualTo(widget.debitCardsList[index].id)
                                .deleteAll()
                            : await isar?.comparisonDebitCardsDatas
                                .put(comparisonDebitCardsData));
                        ref.refresh(comparisonDebitCardsListControllerProvider);
                        setState(() {
                          controllerSecondPageView.animateToPage(
                              controllerSecondPageView.page == 0.0 ? -1 : index - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          if (controllerFirstPageView.page ==
                              controllerSecondPageView.page) {
                            controllerFirstPageView.animateToPage(
                                controllerFirstPageView.page == 0.0 ? -1 : index - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          }
                        });

                        widget.onDeleteFromComparisonTwo();
                      },
                    );
                  }),
                ),
          widget.debitCardsList.length == 1
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.debitCardsList.length,
                      (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 4),
                          alignment: Alignment.centerLeft,
                          height: currentPageOnSecondPageView == index ? 10 : 8,
                          width: currentPageOnSecondPageView == index ? 10 : 8,
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
    );
  }
}
