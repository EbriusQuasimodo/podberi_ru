import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/catalog_page/debit_cards/presentation/debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_page.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/details_page/debit_cards/presentation/debit_cards_controller.dart';
import 'package:podberi_ru/features/favorites_page/debit_cards/presentation/favorites_debit_cards_controller.dart';

import 'mini_debit_card_widget.dart';

class DebitCardsPageViewWidget extends ConsumerStatefulWidget {
  final List<ListDebitCardsModel> debitCardsList;

  ///виджет дебетовок в сранении, используется в [ComparisonDebitCardsPage]
  const DebitCardsPageViewWidget({
    super.key,
    required this.debitCardsList,
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
    initialPage: 1,
    viewportFraction: 0.9,
  );

  int currentPageOnFirstPageView = 0;
  int currentPageOnSecondPageView = 0;

  @override
  void didChangeDependencies() {
    ///прослушиваем второй page view
    controllerSecondPageView.addListener(() {
      ///меняем номер страницы в провайдере
      ref.watch(comparisonSecondDebitPageNumStateProvider.notifier).state =
          controllerSecondPageView.page!.toInt();

      ///меняем имя банка в провайдере в зависимости от текущей страницы
      ref.watch(comparisonSecondDebitBankNameStateProvider.notifier).state =
          widget.debitCardsList[controllerSecondPageView.page!.toInt()]
              .bankDetails!.bankName;

      ///меняем имя банковского продукта в провайдере
      ref.watch(comparisonSecondDebitProductNameStateProvider.notifier).state =
          widget.debitCardsList[controllerSecondPageView.page!.toInt()].name;
    });

    ///прослушиваем первый page view
    controllerFirstPageView.addListener(() {
      ///меняем номер страницы в провайдере
      ref.watch(comparisonFirstDebitPageNumStateProvider.notifier).state =
          controllerFirstPageView.page!.toInt();

      ///меняем имя банка в провайдере в зависимости от текущей страницы
      ref.watch(comparisonFirstDebitBankNameStateProvider.notifier).state =
          widget.debitCardsList[controllerFirstPageView.page!.toInt()]
              .bankDetails!.bankName;

      ///меняем имя банковского продукта в провайдере
      ref.watch(comparisonFirstDebitProductNameStateProvider.notifier).state =
          widget.debitCardsList[controllerFirstPageView.page!.toInt()].name;
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
    currentPageOnFirstPageView =
        ref.watch(comparisonFirstDebitPageNumStateProvider);
    currentPageOnSecondPageView =
        ref.watch(comparisonSecondDebitPageNumStateProvider);
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
              key: const PageStorageKey<String>('comparisonDebitPageViewFirst'),
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
                    ref.invalidate(comparisonDebitCardsListControllerProvider);
                    ref.invalidate(debitCardsControllerProvider);
                    ref.invalidate(favoritesDebitCardsListControllerProvider);
                    ref.invalidate(debitCardsDetailsControllerProvider);

                    ref
                        .read(comparisonFirstDebitPageNumStateProvider.notifier)
                        .state = index + 1 ==
                            widget.debitCardsList.length
                        ? index - 1
                        : index;

                    ref
                        .read(
                            comparisonSecondDebitPageNumStateProvider.notifier)
                        .state = currentPageOnSecondPageView + 1 ==
                            widget.debitCardsList.length
                        ? currentPageOnSecondPageView - 1
                        : currentPageOnSecondPageView;

                    // ///воспроизводим анимацию при удалении
                    // ///анимировать надо оба pfge view если они находятся на одной и той же страницу
                    // ///если открыта страница 0 то анимируемся на -1 (делает просто небольшой скачок туда-обратно)
                    // ///иначе от текущей страницы отнимает 1 и делаем плавную анимацию к ней
                    // controllerFirstPageView.animateToPage(
                    //     controllerFirstPageView.page == 0.0
                    //         ? -1
                    //         : controllerFirstPageView.page!.round() - 1,
                    //     duration: const Duration(milliseconds: 300),
                    //     curve: Curves.linear);
                    // if (controllerFirstPageView.page ==
                    //         controllerSecondPageView.page||
                    //     controllerSecondPageView.page!.round() + 1 ==
                    //         widget.debitCardsList.length) {
                    //   controllerSecondPageView.animateToPage(
                    //       controllerSecondPageView.page == 0.0
                    //           ? -1
                    //           : controllerSecondPageView.page!.round() - 1,
                    //       duration: const Duration(milliseconds: 300),
                    //       curve: Curves.linear);
                    // } else {
                    //   controllerSecondPageView.previousPage(
                    //       duration: const Duration(milliseconds: 300),
                    //       curve: Curves.linear);
                    // }
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
                    key: const PageStorageKey<String>(
                        'comparisonDebitPageViewSecond'),
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
                                    ref.watch(
                                        comparisonProductUrlStateProvider),
                                  )
                              ? await isar?.comparisonDebitCardsDatas
                                  .filter()
                                  .idEqualTo(widget.debitCardsList[index].id)
                                  .deleteAll()
                              : await isar?.comparisonDebitCardsDatas
                                  .put(comparisonDebitCardsData));

                          ///обновляем контроллер чтобы отобразить новый список сравнения
                          ref.invalidate(
                              comparisonDebitCardsListControllerProvider);
                          ref.invalidate(debitCardsControllerProvider);
                          ref.invalidate(debitCardsDetailsControllerProvider);
                          ref
                              .read(comparisonSecondDebitPageNumStateProvider
                                  .notifier)
                              .state = index + 1 ==
                                  widget.debitCardsList.length
                              ? index - 1
                              : index;
                          ref
                              .read(comparisonFirstDebitPageNumStateProvider
                                  .notifier)
                              .state = currentPageOnFirstPageView + 1 ==
                                  widget.debitCardsList.length
                              ? currentPageOnFirstPageView - 1
                              : currentPageOnFirstPageView;
                          // ///воспроизводим анимацию при удалении
                          // ///анимировать надо оба pfge view если они находятся на одной и той же страницу
                          // ///если открыта страница 0 то анимируемся на -1 (делает просто небольшой скачок туда-обратно)
                          // ///иначе от текущей страницы отнимает 1 и делаем плавную анимацию к ней
                          // controllerSecondPageView.animateToPage(
                          //     controllerSecondPageView.page == 0
                          //         ? -1
                          //         : controllerSecondPageView.page!.round() - 1,
                          //     duration: const Duration(milliseconds: 300),
                          //     curve: Curves.linear);
                          // if (controllerFirstPageView.page ==
                          //         controllerSecondPageView.page||
                          //     controllerFirstPageView.page!.round() + 1 ==
                          //         widget.debitCardsList.length) {
                          //   controllerFirstPageView.animateToPage(
                          //       controllerFirstPageView.page == 0
                          //           ? -1
                          //           : controllerFirstPageView.page!.round() - 1,
                          //       duration: const Duration(milliseconds: 300),
                          //       curve: Curves.linear);
                          // } else {
                          //   controllerFirstPageView.previousPage(
                          //       duration: const Duration(milliseconds: 300),
                          //       curve: Curves.linear);
                          // }
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
