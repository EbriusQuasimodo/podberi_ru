import 'package:flutter/material.dart';
import 'package:podberi_ru/core/presentation/expandable_page_view.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

import 'mini_product_card_widget.dart';

class ProductComparisonWidget extends StatefulWidget {
  final PageController controllerBestOffers;
  final PageController controllerSecondPageView;
  final List<String> comparisonList;
  final VoidCallback onDeleteInFirstList;
  final VoidCallback onDeleteInSecondList;
  final double currentPageOnFirstPageView;
  final double currentPageOnSecondPageView;

  const ProductComparisonWidget(
      {super.key,
      required this.onDeleteInFirstList,
      required this.comparisonList,
      required this.controllerBestOffers,
      required this.controllerSecondPageView,
      required this.currentPageOnFirstPageView,
      required this.currentPageOnSecondPageView,
      required this.onDeleteInSecondList});

  @override
  State<ProductComparisonWidget> createState() =>
      _ProductComparisonWidgetState();
}

class _ProductComparisonWidgetState extends State<ProductComparisonWidget> {
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
            ExpandablePageView(
              pageController: widget.controllerBestOffers,
              children: List.generate(widget.comparisonList.length, (index) {
                return MiniProductCardWidget(
                  bankName: widget.comparisonList[index],
                  onDelete: () {
                    setState(() {
                      widget.comparisonList.removeAt(index);
                      widget.controllerBestOffers.animateToPage( widget.controllerBestOffers.page == 1.0
                          ? 1
                          :index - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      if (widget.controllerBestOffers.page ==
                          widget.controllerSecondPageView.page) {
                        widget.controllerSecondPageView.animateToPage(
                            widget.controllerSecondPageView.page == 1.0
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
                            height: widget.currentPageOnFirstPageView == index
                                ? 10
                                : 8,
                            width: widget.currentPageOnFirstPageView == index
                                ? 10
                                : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.currentPageOnFirstPageView == index
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
                : ExpandablePageView(
                    pageController: widget.controllerSecondPageView,
                    children:
                        List.generate(widget.comparisonList.length, (index) {
                      return MiniProductCardWidget(
                        bankName: widget.comparisonList[index],
                        onDelete: () {
                          setState(() {
                            widget.comparisonList.removeAt(index);
                            widget.controllerSecondPageView.animateToPage(
                                widget.controllerSecondPageView.page == 1.0
                                    ? 1
                                    :index - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                            if (widget.controllerBestOffers.page ==
                                widget.controllerSecondPageView.page) {
                              widget.controllerBestOffers.animateToPage(
                                  widget.controllerBestOffers.page == 1.0
                                      ? 1
                                      :index - 1,
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
                            height: widget.currentPageOnSecondPageView == index
                                ? 10
                                : 8,
                            width: widget.currentPageOnSecondPageView == index
                                ? 10
                                : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.currentPageOnSecondPageView == index
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
