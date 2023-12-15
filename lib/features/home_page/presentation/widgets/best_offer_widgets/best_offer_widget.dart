import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

import 'best_offers_card.dart';

class BestOfferWidget extends ConsumerStatefulWidget {
  final List<ListProductModel> bestOffer;
  ///виджет с лучшими банковскими предложениями
  const BestOfferWidget({super.key, required this.bestOffer});

  @override
  ConsumerState<BestOfferWidget> createState() => _BestOfferWidgetState();
}

class _BestOfferWidgetState extends ConsumerState<BestOfferWidget> {
  final _controllerBestOffers = PageController(
    viewportFraction: 0.9,
  );

  double currentPage = 0;

  @override
  void initState() {
    _controllerBestOffers.addListener(() {
      setState(() {
        currentPage = _controllerBestOffers.page!.toDouble();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsets.only(top: 2),
          padding: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ThemeApp.mainWhite,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                ),
                child: Text(
                  'Выгодные предложения',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              widget.bestOffer.isNotEmpty ?
              ExpandablePageView(
                physics: const BouncingScrollPhysics(),
                controller: _controllerBestOffers,
                children: List.generate(widget.bestOffer.length, (index) {
                  return BestOffersCardWidget(
                    bestOffer: widget.bestOffer[index],
                  );
                }),
              )
              : const Text('не удалось загрузить('),
              widget.bestOffer.isNotEmpty ? Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.bestOffer.length,
                    (index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 4),
                        alignment: Alignment.centerLeft,
                        height: currentPage == index ? 10 : 8,
                        width: currentPage == index ? 10 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? ThemeApp.backgroundBlack
                              : ThemeApp.darkestGrey,
                        ),
                      );
                    },
                  ),
                ),
              )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      );
  }
}
