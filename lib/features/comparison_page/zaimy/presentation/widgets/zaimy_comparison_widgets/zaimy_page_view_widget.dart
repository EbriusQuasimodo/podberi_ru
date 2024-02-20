import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/catalog_page/zaimy/presentation/zaimy_controller.dart';
import 'package:podberi_ru/features/comparison_page/credit_cards/presentation/widgets/credit_cards_page_view_widgets/credit_cards_page_view_widget.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/zaimy/presentation/comparison_zaimy_controller.dart';
import 'package:podberi_ru/features/comparison_page/zaimy/presentation/comparison_zaimy_page.dart';
import 'package:podberi_ru/features/details_page/zaimy/presentation/zaimy_controller.dart';
import 'package:podberi_ru/features/favorites_page/zaimy/presentation/favorites_zaimy_controller.dart';

import 'mini_zaimy_widget.dart';

class ZaimyPageViewWidget extends ConsumerStatefulWidget {
  final List<ListZaimyModel> zaimyList;
  final VoidCallback onDeleteFromComparison;
  final VoidCallback onScrollPageViews;

  ///виджет займов в сранении, используется в [ComparisonZaimyPage]
  ///весь функционал полностью копирует кредитки и дебетовки
  ///поэтому подробная документация находится в [CreditCardsPageViewWidget]
  const ZaimyPageViewWidget({
    super.key,
    required this.zaimyList,
    required this.onDeleteFromComparison,
    required this.onScrollPageViews,
  });

  @override
  ConsumerState<ZaimyPageViewWidget> createState() =>
      _ZaimyComparisonWidgetState();
}

class _ZaimyComparisonWidgetState extends ConsumerState<ZaimyPageViewWidget> {
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
    controllerSecondPageView.addListener(() {
      ref.watch(comparisonSecondZaimyPageNumStateProvider.notifier).state = controllerSecondPageView.page!.toInt();

      ///у займов есть только название мфо поэтому вместо названия продукта
      ///здесь везде название мфо
      ref.watch(comparisonSecondZaimyBankNameStateController.notifier).state =
          widget.zaimyList[currentPageOnSecondPageView.toInt()].name;

    });

    controllerFirstPageView.addListener(() {
      ref.watch(comparisonFirstZaimyPageNumStateProvider.notifier).state = controllerFirstPageView.page!.toInt();

      ///у займов есть только название мфо поэтому вместо названия продукта
      ///здесь везде название мфо
      ref.watch(comparisonFirstZaimyBankNameStateProvider.notifier).state =
          widget.zaimyList[currentPageOnFirstPageView.toInt()].name;

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
    currentPageOnFirstPageView = ref.watch(comparisonFirstZaimyPageNumStateProvider);
   currentPageOnSecondPageView = ref.watch(comparisonFirstZaimyPageNumStateProvider);
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
          SizedBox(
            height: 91,
            child: PageView(
              key: const PageStorageKey<String>('comparisonZaimyPageViewFirst'),
              controller: controllerFirstPageView,
              children: List.generate(widget.zaimyList.length, (index) {
                return MiniZaimyWidget(
                  zaimy: widget.zaimyList[index],
                  onDelete: () async {
                    ComparisonZaimyData comparisonZaimyData =
                        ComparisonZaimyData()..id = widget.zaimyList[index].id;

                    await isar?.writeTxn(() async => await ref
                            .watch(isarNotifierProvider.notifier)
                            .isItemDuplicateInComparison(
                              widget.zaimyList[index].id,
                              ref.watch(comparisonProductUrlStateProvider),
                            )
                        ? await isar?.comparisonZaimyDatas
                            .filter()
                            .idEqualTo(widget.zaimyList[index].id)
                            .deleteAll()
                        : await isar?.comparisonZaimyDatas
                            .put(comparisonZaimyData));

                    ref.invalidate(comparisonZaimyListControllerProvider);
                    ref.invalidate(zaimyControllerProvider);
                    ref.invalidate(
                        favoritesZaimyListControllerProvider);
                    ref.invalidate(zaimyDetailsControllerProvider);
                    controllerFirstPageView.animateToPage(
                        controllerFirstPageView.page == 0.0
                            ? -1
                            : controllerFirstPageView.page!.round() - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                    if (controllerFirstPageView.page ==
                            controllerSecondPageView.page ||
                        controllerSecondPageView.page!.round() + 1 ==
                            widget.zaimyList.length) {
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
          widget.zaimyList.length == 1
              ? const SizedBox(
                  height: 32,
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.zaimyList.length,
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
          widget.zaimyList.length == 1
              ? const SizedBox.shrink()
              : SizedBox(
                  height: 91,
                  child: PageView(
                    key: const PageStorageKey<String>('comparisonZaimyPageViewSecond'),
                    controller: controllerSecondPageView,
                    children: List.generate(widget.zaimyList.length, (index) {
                      return MiniZaimyWidget(
                        zaimy: widget.zaimyList[index],
                        onDelete: () async {
                          ComparisonZaimyData comparisonZaimyData =
                              ComparisonZaimyData()
                                ..id = widget.zaimyList[index].id;

                          await isar?.writeTxn(() async => await ref
                                  .watch(isarNotifierProvider.notifier)
                                  .isItemDuplicateInComparison(
                                    widget.zaimyList[index].id,
                                    ref.watch(
                                        comparisonProductUrlStateProvider),
                                  )
                              ? await isar?.comparisonZaimyDatas
                                  .filter()
                                  .idEqualTo(widget.zaimyList[index].id)
                                  .deleteAll()
                              : await isar?.comparisonZaimyDatas
                                  .put(comparisonZaimyData));

                          ref.invalidate(comparisonZaimyListControllerProvider);
                          ref.invalidate(zaimyControllerProvider);
                          ref.invalidate(zaimyDetailsControllerProvider);
                          controllerSecondPageView.animateToPage(
                              controllerSecondPageView.page == 0.0
                                  ? -1
                                  : controllerSecondPageView.page!.round() - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          if (controllerFirstPageView.page ==
                                  controllerSecondPageView.page ||
                              controllerFirstPageView.page!.round() + 1 ==
                                  widget.zaimyList.length) {
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
          widget.zaimyList.length == 1
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.zaimyList.length,
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
