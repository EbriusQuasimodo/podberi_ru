import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'error_widgets/on_error_widget.dart';

class CatalogIsEmpty extends ConsumerWidget {
  final int itemsCount;
  const CatalogIsEmpty({super.key,required this.itemsCount,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStack(
      insetOnOverlap: true,
      children: [
        SliverPositioned.fill(
          child: SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Container(
              margin: const EdgeInsets.only(top: 2, bottom: 72),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
            ),
          ),
        ),
        SliverPositioned.fill(
          child: Center(
            child: OnErrorWidget(
                error: NothingFoundException().message,
                onGoBackButtonTap: () {

                },
                onRefreshButtonTap: () {

                }),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: Text(
              'Найдено ($itemsCount шт.)',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ThemeApp.darkestGrey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

      ],
    );
  }
}
