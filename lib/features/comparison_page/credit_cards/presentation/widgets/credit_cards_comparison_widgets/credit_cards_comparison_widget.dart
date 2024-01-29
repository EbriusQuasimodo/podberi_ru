import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/presentation/expandable_page_view.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/credit_cards/presentation/comparison_credit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';

import 'mini_credit_card_widget.dart';

class CreditCardsComparisonWidget extends ConsumerStatefulWidget {
  final List<ListCreditCardsModel> creditCardsList;
  final VoidCallback onDeleteFromComparison;
  final VoidCallback onScrollPageViews;

  ///виджет дебетовок в сранении, используется в [ComparisonPage]
  CreditCardsComparisonWidget({
    super.key,
    required this.creditCardsList,
    required this.onDeleteFromComparison,
    required this.onScrollPageViews,
  });

  @override
  ConsumerState<CreditCardsComparisonWidget> createState() =>
      _CreditCardsComparisonWidgetState();
}

class _CreditCardsComparisonWidgetState
    extends ConsumerState<CreditCardsComparisonWidget> {
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
      ref.watch(comparisonSecondCreditBankNameStateController.notifier).state =
          widget.creditCardsList[currentPageOnSecondPageView.toInt()]
              .bankDetails!.bankName;
      ref.watch(comparisonSecondCreditProductNameStateController.notifier).state =
          widget.creditCardsList[currentPageOnSecondPageView.toInt()]
              .name;
      ref.watch(comparisonSecondCreditPageNumStateController.notifier).state =
          currentPageOnSecondPageView.toInt();
      setState(() {});
      widget.onScrollPageViews();
    });

    controllerFirstPageView.addListener(() {
      currentPageOnFirstPageView = controllerFirstPageView.page!.toDouble();
      ref.watch(comparisonFirstCreditBankNameStateProvider.notifier).state =
          widget.creditCardsList[currentPageOnFirstPageView.toInt()]
              .bankDetails!.bankName;
      ref.watch(comparisonFirstCreditProductNameStateProvider.notifier).state =
          widget.creditCardsList[currentPageOnFirstPageView.toInt()]
              .name;
      ref.watch(comparisonFirstCreditPageNumStateProvider.notifier).state =
          currentPageOnFirstPageView.toInt();
      setState(() {});
      widget.onScrollPageViews();
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    //controllerSecondPageView.dispose();
    // controllerFirstPageView.dispose();
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
            children: List.generate(widget.creditCardsList.length, (index) {
              return MiniCreditCardWidget(
                creditCard: widget.creditCardsList[index],
                onDelete: () async {
                  ComparisonCreditCardsData comparisonCreditCardsData =
                      ComparisonCreditCardsData()
                        ..id = widget.creditCardsList[index].id;

                  await isar?.writeTxn(() async => await ref
                          .watch(isarNotifierProvider.notifier)
                          .isItemDuplicateInComparison(
                            widget.creditCardsList[index].id,
                            ref.watch(comparisonProductUrlStateProvider),
                          )
                      ? await isar?.comparisonCreditCardsDatas
                          .filter()
                          .idEqualTo(widget.creditCardsList[index].id)
                          .deleteAll()
                      : await isar?.comparisonCreditCardsDatas
                          .put(comparisonCreditCardsData));

                  ref.refresh(comparisonCreditCardsListControllerProvider);
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
          widget.creditCardsList.length == 1
              ? const SizedBox(
                  height: 32,
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.creditCardsList.length,
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
          widget.creditCardsList.length == 1
              ? const SizedBox.shrink()
              : CustomExpandablePageView(
                  pageController: controllerSecondPageView,
                  children:
                      List.generate(widget.creditCardsList.length, (index) {
                    return MiniCreditCardWidget(
                      creditCard: widget.creditCardsList[index],
                      onDelete: () async {
                        ComparisonCreditCardsData comparisonCreditCardsData =
                            ComparisonCreditCardsData()
                              ..id = widget.creditCardsList[index].id;

                        await isar?.writeTxn(() async => await ref
                                .watch(isarNotifierProvider.notifier)
                                .isItemDuplicateInComparison(
                                  widget.creditCardsList[index].id,
                                  ref.watch(comparisonProductUrlStateProvider),
                                )
                            ? await isar?.comparisonCreditCardsDatas
                                .filter()
                                .idEqualTo(widget.creditCardsList[index].id)
                                .deleteAll()
                            : await isar?.comparisonCreditCardsDatas
                                .put(comparisonCreditCardsData));

                        ref.refresh(
                            comparisonCreditCardsListControllerProvider);
                        setState(() {
                          controllerSecondPageView.animateToPage(
                              controllerSecondPageView.page == 0.0
                                  ? -1
                                  : index - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          if (controllerFirstPageView.page ==
                              controllerSecondPageView.page) {
                            controllerFirstPageView.animateToPage(
                                controllerFirstPageView.page == 0.0
                                    ? -1
                                    : index - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          }
                        });
                        widget.onDeleteFromComparison();
                      },
                    );
                  }),
                ),
          widget.creditCardsList.length == 1
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.creditCardsList.length,
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
