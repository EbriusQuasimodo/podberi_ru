import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_page.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';

import 'mini_debit_card_widget.dart';

class DebitCardsPageViewWidget extends ConsumerStatefulWidget {
  final List<ListDebitCardsModel> debitCardsList;
  final VoidCallback onDeleteFromComparison;
  final VoidCallback onDeleteFromComparisonTwo;
  final VoidCallback onScrollPageViews;

  ///виджет дебетовок в сранении, используется в [ComparisonDebitCardsPage]
  const DebitCardsPageViewWidget({
    super.key,
    required this.debitCardsList,
    required this.onDeleteFromComparison,
    required this.onScrollPageViews,
    required this.onDeleteFromComparisonTwo,
  });

  @override
  ConsumerState<DebitCardsPageViewWidget> createState() =>
      _DebitCardsComparisonWidgetState();
}

class _DebitCardsComparisonWidgetState
    extends ConsumerState<DebitCardsPageViewWidget> {
  final controllerFirstPageView = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );
  final controllerSecondPageView = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );

  double currentPageOnFirstPageView = 0;
  double currentPageOnSecondPageView = 0;

  @override
  void didChangeDependencies() {
    ///прослушиваем второй page view
    controllerSecondPageView.addListener(() {
      ///задаем номер текущей страницы при пролистывании
      currentPageOnSecondPageView = controllerSecondPageView.page!.toDouble();

      ///меняем номер страницы в провайдере
      ref.watch(comparisonSecondDebitPageNumStateController.notifier).state =
          currentPageOnSecondPageView.toInt();

      ///меняем имя банка в провайдере в зависимости от текущей страницы
      ref.watch(comparisonSecondDebitBankNameStateController.notifier).state =
          widget.debitCardsList[controllerSecondPageView.page!.toInt()]
              .bankDetails!.bankName;

      ///меняем имя банковского продукта в провайдере
      ref
              .watch(comparisonSecondDebitProductNameStateController.notifier)
              .state =
          widget.debitCardsList[controllerSecondPageView.page!.toInt()].name;

      setState(() {});

      ///костыль чтобы все обновлялось, возможно потом получится убрать
      widget.onScrollPageViews();
    });

    ///прослушиваем первый page view
    controllerFirstPageView.addListener(() {
      /// задаем номер текущей страницы при пролистывании
      currentPageOnFirstPageView = controllerFirstPageView.page!.toDouble();

      ///меняем номер страницы в провайдере
      ref.watch(comparisonFirstDebitPageNumStateProvider.notifier).state =
          currentPageOnFirstPageView.toInt();

      ///меняем имя банка в провайдере в зависимости от текущей страницы
      ref.watch(comparisonFirstDebitBankNameStateProvider.notifier).state =
          widget.debitCardsList[controllerFirstPageView.page!.toInt()]
              .bankDetails!.bankName;

      ///меняем имя банковского продукта в провайдере
      ref.watch(comparisonFirstDebitProductNameStateProvider.notifier).state =
          widget.debitCardsList[controllerFirstPageView.page!.toInt()].name;

      setState(() {});

      ///костыль чтобы все обновлялось, возможно потом получится убрать
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

          ///первый page view
          SizedBox(
            height: 91,
            child: PageView(
              controller: controllerFirstPageView,
              children: List.generate(widget.debitCardsList.length, (index) {
                return MiniDebitCardWidget(
                  debitCard: widget.debitCardsList[index],
                  onDelete: () async {
                    ///удаляем из кэша по id
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

                    ///обновляем контроллер чтобы отобразить новый список сравнения
                    ref.refresh(comparisonDebitCardsListControllerProvider);

                    ///воспроизводим анимацию при удалении
                    ///анимировать надо оба pfge view если они находятся на одной и той же страницу
                    ///если открыта страница 0 то анимируемся на -1 (делает просто небольшой скачок туда-обратно)
                    ///иначе от текущей страницы отнимает 1 и делаем плавную анимацию к ней
                    controllerFirstPageView.animateToPage(
                        controllerFirstPageView.page == 0.0
                            ? -1
                            : controllerFirstPageView.page!.round() - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                    if (controllerFirstPageView.page ==
                            controllerSecondPageView.page ||
                        controllerSecondPageView.page!.round() + 1 ==
                            widget.debitCardsList.length) {
                      controllerSecondPageView.animateToPage(
                          controllerSecondPageView.page == 0.0
                              ? -1
                              : controllerSecondPageView.page!.round() - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    } else {
                      controllerSecondPageView.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    }
                  },
                );
              }),
            ),
          ),
          widget.debitCardsList.length == 1
              ? const SizedBox(
                  height: 32,
                )

              ///индикатор открытой страницы
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

              ///второй page view
              : SizedBox(
            height: 91,
                child: PageView(
                    controller: controllerSecondPageView,
                    children:
                        List.generate(widget.debitCardsList.length, (index) {
                      return MiniDebitCardWidget(
                        debitCard: widget.debitCardsList[index],
                        onDelete: () async {
                          ///удаляем из кэша по id
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

                          ///обновляем контроллер чтобы отобразить новый список сравнения
                          ref.refresh(comparisonDebitCardsListControllerProvider);

                          ///воспроизводим анимацию при удалении
                          ///анимировать надо оба pfge view если они находятся на одной и той же страницу
                          ///если открыта страница 0 то анимируемся на -1 (делает просто небольшой скачок туда-обратно)
                          ///иначе от текущей страницы отнимает 1 и делаем плавную анимацию к ней
                          controllerSecondPageView.animateToPage(
                              controllerSecondPageView.page == 0
                                  ? -1
                                  : controllerSecondPageView.page!.round() - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          if (controllerFirstPageView.page ==
                                  controllerSecondPageView.page ||
                              controllerFirstPageView.page!.round() + 1 ==
                                  widget.debitCardsList.length) {
                            controllerFirstPageView.animateToPage(
                                controllerFirstPageView.page == 0
                                    ? -1
                                    : controllerFirstPageView.page!.round() - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          } else {
                            controllerFirstPageView.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          }
                        },
                      );
                    }),
                  ),
              ),
          widget.debitCardsList.length == 1
              ? const SizedBox.shrink()

              ///индикатор открытой страницы
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
