import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/presentation/expandable_page_view.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/comparison_page/presentation/comparison_page.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_zaimy_controller.dart';

import 'mini_zaimy_widget.dart';

class ZaimyComparisonWidget extends ConsumerStatefulWidget {
  final List<ListZaimyModel> zaimyList;
  final VoidCallback onDeleteFromComparison;
  final VoidCallback onScrollPageViews;

  ///виджет дебетовок в сранении, используется в [ComparisonPage]
  ZaimyComparisonWidget({
    super.key,
    required this.zaimyList,
    required this.onDeleteFromComparison,
    required this.onScrollPageViews,
  });

  @override
  ConsumerState<ZaimyComparisonWidget> createState() =>
      _ZaimyComparisonWidgetState();
}

class _ZaimyComparisonWidgetState
    extends ConsumerState<ZaimyComparisonWidget> {
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
          widget.zaimyList[currentPageOnSecondPageView.toInt()].name;
      ref.watch(comparisonSecondZaimyPageNumStateController.notifier).state =
          currentPageOnSecondPageView.toInt();
      setState(() {});
      widget.onScrollPageViews();
    });

    controllerFirstPageView.addListener(() {
      currentPageOnFirstPageView = controllerFirstPageView.page!.toDouble();
      ref.watch(comparisonFirstDebitBankNameStateProvider.notifier).state =
          widget.zaimyList[currentPageOnFirstPageView.toInt()].name;
      ref.watch(comparisonFirstZaimyPageNumStateProvider.notifier).state =
          currentPageOnSecondPageView.toInt();
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
            pageController: controllerFirstPageView,
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
                            ref.watch(comparisonProductUrlStateProvider),
                          )
                      ? await isar?.comparisonZaimyDatas
                          .filter()
                          .idEqualTo(widget.zaimyList[index].id)
                          .deleteAll()
                      : await isar?.comparisonZaimyDatas
                          .put(comparisonZaimyData));

                  ref.refresh(comparisonZaimyListControllerProvider);
                  setState(() {
                    controllerFirstPageView.animateToPage(
                        controllerFirstPageView.page == 1.0 ? 1 : index - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                    if (controllerFirstPageView.page ==
                        controllerSecondPageView.page) {
                      controllerSecondPageView.animateToPage(
                          controllerSecondPageView.page == 1.0
                              ? 1
                              : index - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    }
                  });
                  widget.onScrollPageViews();
                  widget.onDeleteFromComparison();
                },
              );
            }),
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
          widget.zaimyList.length == 1
              ? const SizedBox.shrink()
              : CustomExpandablePageView(
                  pageController: controllerSecondPageView,
                  children:
                      List.generate(widget.zaimyList.length, (index) {
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

                        ref.refresh(
                            comparisonZaimyListControllerProvider);
                        setState(() {
                          controllerSecondPageView.animateToPage(
                              controllerSecondPageView.page == 1.0
                                  ? 1
                                  : index - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          if (controllerFirstPageView.page ==
                              controllerSecondPageView.page) {
                            controllerFirstPageView.animateToPage(
                                controllerFirstPageView.page == 1.0
                                    ? 1
                                    : index - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          }
                        });
                        widget.onScrollPageViews();
                        widget.onDeleteFromComparison();
                      },
                    );
                  }),
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
    );
  }
}
