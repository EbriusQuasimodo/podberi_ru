import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/rko/comparison_rko_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_page.dart';
import 'package:podberi_ru/features/comparison_page/rko/presentation/comparison_rko_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';

import 'mini_rko_widget.dart';

class RkoPageViewWidget extends ConsumerStatefulWidget {
  final List<ListRkoModel> rkoList;
  final VoidCallback onDeleteFromComparison;
  final VoidCallback onDeleteFromComparisonTwo;
  final VoidCallback onScrollPageViews;

  ///виджет дебетовок в сранении, используется в [ComparisonRkoPage]
  const RkoPageViewWidget({
    super.key,
    required this.rkoList,
    required this.onDeleteFromComparison,
    required this.onScrollPageViews,
    required this.onDeleteFromComparisonTwo,
  });

  @override
  ConsumerState<RkoPageViewWidget> createState() =>
      _RkoComparisonWidgetState();
}

class _RkoComparisonWidgetState
    extends ConsumerState<RkoPageViewWidget> {
  final controllerFirstPageView = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );
  final controllerSecondPageView = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );

 int currentPageOnFirstPageView = 0;
  int currentPageOnSecondPageView = 0;

  @override
  void didChangeDependencies() {
    ///прослушиваем второй page view
    controllerSecondPageView.addListener(() {
      ///меняем номер страницы в провайдере
      ref.watch(comparisonSecondRkoPageNumStateProvider.notifier).state = controllerSecondPageView.page!.toInt();

      ///меняем имя банка в провайдере в зависимости от текущей страницы
      ref.watch(comparisonSecondRkoBankNameStateProvider.notifier).state =
          widget.rkoList[controllerSecondPageView.page!.toInt()]
              .bankDetails!.bankName;

      ///меняем имя банковского продукта в провайдере
      ref
              .watch(comparisonSecondRkoProductNameStateProvider.notifier)
              .state =
          widget.rkoList[controllerSecondPageView.page!.toInt()].ratesName;
    });

    ///прослушиваем первый page view
    controllerFirstPageView.addListener(() {
      ///меняем номер страницы в провайдере
      ref.watch(comparisonFirstRkoPageNumStateProvider.notifier).state = controllerFirstPageView.page!.toInt();

      ///меняем имя банка в провайдере в зависимости от текущей страницы
      ref.watch(comparisonFirstRkoBankNameStateProvider.notifier).state =
          widget.rkoList[controllerFirstPageView.page!.toInt()]
              .bankDetails!.bankName;

      ///меняем имя банковского продукта в провайдере
      ref.watch(comparisonFirstRkoProductNameStateProvider.notifier).state =
          widget.rkoList[controllerFirstPageView.page!.toInt()].ratesName;

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
    currentPageOnFirstPageView = ref.watch(comparisonFirstRkoPageNumStateProvider);
    currentPageOnSecondPageView = ref.watch(comparisonSecondRkoPageNumStateProvider);
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
              children: List.generate(widget.rkoList.length, (index) {
                return MiniRkoWidget(
                  rko: widget.rkoList[index],
                  onDelete: () async {
                    ///удаляем из кэша по id
                    ComparisonRkoData comparisonRkoData =
                        ComparisonRkoData()
                          ..id = widget.rkoList[index].id;

                    await isar?.writeTxn(() async => await ref
                            .watch(isarNotifierProvider.notifier)
                            .isItemDuplicateInComparison(
                              widget.rkoList[index].id,
                              ref.watch(comparisonProductUrlStateProvider),
                            )
                        ? await isar?.comparisonRkoDatas
                            .filter()
                            .idEqualTo(widget.rkoList[index].id)
                            .deleteAll()
                        : await isar?.comparisonRkoDatas
                            .put(comparisonRkoData));

                    ///обновляем контроллер чтобы отобразить новый список сравнения
                    ref.invalidate(comparisonRkoListControllerProvider);

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
                            controllerSecondPageView.page||
                        controllerSecondPageView.page!.round() + 1 ==
                            widget.rkoList.length) {
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
          widget.rkoList.length == 1
              ? const SizedBox(
                  height: 32,
                )

              ///индикатор открытой страницы
              : Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.rkoList.length,
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
          widget.rkoList.length == 1
              ? const SizedBox.shrink()

              ///второй page view
              : SizedBox(
            height: 91,
                child: PageView(
                 key: const PageStorageKey<String>('comparisonDebitPageViewSecond'),
                    controller: controllerSecondPageView,
                    children:
                        List.generate(widget.rkoList.length, (index) {
                      return MiniRkoWidget(
                        rko: widget.rkoList[index],
                        onDelete: () async {
                          ///удаляем из кэша по id
                          ComparisonRkoData comparisonRkoData =
                              ComparisonRkoData()
                                ..id = widget.rkoList[index].id;

                          await isar?.writeTxn(() async => await ref
                                  .watch(isarNotifierProvider.notifier)
                                  .isItemDuplicateInComparison(
                                    widget.rkoList[index].id,
                                    ref.watch(comparisonProductUrlStateProvider),
                                  )
                              ? await isar?.comparisonRkoDatas
                                  .filter()
                                  .idEqualTo(widget.rkoList[index].id)
                                  .deleteAll()
                              : await isar?.comparisonRkoDatas
                                  .put(comparisonRkoData));

                          ///обновляем контроллер чтобы отобразить новый список сравнения
                          ref.invalidate(comparisonRkoListControllerProvider);

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
                                  controllerSecondPageView.page||
                              controllerFirstPageView.page!.round() + 1 ==
                                  widget.rkoList.length) {
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
          widget.rkoList.length == 1
              ? const SizedBox.shrink()

              ///индикатор открытой страницы
              : Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.rkoList.length,
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
