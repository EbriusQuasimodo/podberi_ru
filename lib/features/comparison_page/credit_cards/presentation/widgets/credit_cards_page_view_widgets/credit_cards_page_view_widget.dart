 import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/catalog_page/credit_cards/presentation/credit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/credit_cards/presentation/comparison_credit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/credit_cards/presentation/comparison_credit_cards_page.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/details_page/credit_cards/presentation/credit_cards_details_controller.dart';
import 'package:podberi_ru/features/favorites_page/credit_cards/presentation/favorites_credit_cards_controller.dart';

import 'mini_credit_card_widget.dart';

class CreditCardsPageViewWidget extends ConsumerStatefulWidget {
  final List<ListCreditCardsModel> creditCardsList;
  final VoidCallback onDeleteFromComparison;
  final VoidCallback onScrollPageViews;

  ///виджет кредиток в сранении, используется в [ComparisonCreditCardsPage]
  const CreditCardsPageViewWidget({
    super.key,
    required this.creditCardsList,
    required this.onDeleteFromComparison,
    required this.onScrollPageViews,
  });

  @override
  ConsumerState<CreditCardsPageViewWidget> createState() =>
      _CreditCardsComparisonWidgetState();
}

class _CreditCardsComparisonWidgetState
    extends ConsumerState<CreditCardsPageViewWidget> {
  final controllerFirstPageView = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );
  final controllerSecondPageView = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );

  int currentPageOnFirstPageView = 0;
  int  currentPageOnSecondPageView = 0;

  @override
  void didChangeDependencies() {
    ///прослушиваем второй page view
    controllerSecondPageView.addListener(() {
      ///задаем номер текущей страницы при пролистывании
      ref.watch(comparisonSecondCreditPageNumStateProvider.notifier).state = controllerSecondPageView.page!.toInt();

      ///меняем имя банка в провайдере в зависимости от текущей страницы
      ref.watch(comparisonSecondCreditBankNameStateController.notifier).state =
          widget.creditCardsList[currentPageOnSecondPageView.toInt()]
              .bankDetails!.bankName;

      ///меняем имя банковского продукта в провайдере
      ref
              .watch(comparisonSecondCreditProductNameStateController.notifier)
              .state =
          widget.creditCardsList[currentPageOnSecondPageView.toInt()].name;

    });

    ///прослушиваем первый page view
    controllerFirstPageView.addListener(() {
      /// задаем номер текущей страницы при пролистывании
      ref.watch(comparisonFirstCreditPageNumStateProvider.notifier).state = controllerFirstPageView.page!.toInt();

      ///меняем имя банка в провайдере в зависимости от текущей страницы
      ref.watch(comparisonFirstCreditBankNameStateProvider.notifier).state =
          widget.creditCardsList[currentPageOnFirstPageView.toInt()]
              .bankDetails!.bankName;

      ///меняем имя банковского продукта в провайдере
      ref.watch(comparisonFirstCreditProductNameStateProvider.notifier).state =
          widget.creditCardsList[currentPageOnFirstPageView.toInt()].name;
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
   currentPageOnFirstPageView = ref.watch(comparisonFirstCreditPageNumStateProvider);
    currentPageOnSecondPageView = ref.watch(comparisonSecondCreditPageNumStateProvider);
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
              key: const PageStorageKey<String>('comparisonCreditPageViewFirst'),
              controller: controllerFirstPageView,
              children: List.generate(widget.creditCardsList.length, (index) {
                return MiniCreditCardWidget(
                  creditCard: widget.creditCardsList[index],
                  onDelete: () async {
                    ///удаляем из кэша по id
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

                    ///обновляем контроллер чтобы отобразить новый список сравнения
                    ref.invalidate(comparisonCreditCardsListControllerProvider);
                    ref.invalidate(creditCardsControllerProvider);
                    ref.invalidate(
                        favoritesCreditCardsListControllerProvider);
                    ref.invalidate(creditCardsDetailsControllerProvider);
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
                            widget.creditCardsList.length) {
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
          widget.creditCardsList.length == 1
              ? const SizedBox(
                  height: 32,
                )

              ///индикатор открытой страницы
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

              ///второй page view
              : SizedBox(
                  height: 91,
                  child: PageView(
                    key: const PageStorageKey<String>('comparisonCreditPageViewSecond'),
                    controller: controllerSecondPageView,
                    children:
                        List.generate(widget.creditCardsList.length, (index) {
                      return MiniCreditCardWidget(
                        creditCard: widget.creditCardsList[index],
                        onDelete: () async {
                          ///удаляем из кэша по id
                          ComparisonCreditCardsData comparisonCreditCardsData =
                              ComparisonCreditCardsData()
                                ..id = widget.creditCardsList[index].id;

                          await isar?.writeTxn(() async => await ref
                                  .watch(isarNotifierProvider.notifier)
                                  .isItemDuplicateInComparison(
                                    widget.creditCardsList[index].id,
                                    ref.watch(
                                        comparisonProductUrlStateProvider),
                                  )
                              ? await isar?.comparisonCreditCardsDatas
                                  .filter()
                                  .idEqualTo(widget.creditCardsList[index].id)
                                  .deleteAll()
                              : await isar?.comparisonCreditCardsDatas
                                  .put(comparisonCreditCardsData));

                          ///обновляем контроллер чтобы отобразить новый список сравнения
                          ref.invalidate(
                              comparisonCreditCardsListControllerProvider);
                          ref.invalidate(creditCardsControllerProvider);
                          ref.invalidate(creditCardsDetailsControllerProvider);
                          ///воспроизводим анимацию при удалении
                          ///анимировать надо оба pfge view если они находятся на одной и той же страницу
                          ///если открыта страница 0 то анимируемся на -1 (делает просто небольшой скачок туда-обратно)
                          ///иначе от текущей страницы отнимает 1 и делаем плавную анимацию к ней
                          controllerSecondPageView.animateToPage(
                              controllerSecondPageView.page == 0.0
                                  ? -1
                                  : controllerSecondPageView.page!.round() - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          if (controllerFirstPageView.page ==
                                  controllerSecondPageView.page ||
                              controllerFirstPageView.page!.round() + 1 ==
                                  widget.creditCardsList.length) {
                            controllerFirstPageView.animateToPage(
                                controllerFirstPageView.page == 0.0
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
          widget.creditCardsList.length == 1
              ? const SizedBox.shrink()

              ///индикатор открытой страницы
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
