import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class FavoritesOrComparisonIsEmpty extends ConsumerWidget {
  final String error;
  const FavoritesOrComparisonIsEmpty({super.key, required this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: true,
      child: Container(
        margin: EdgeInsets.only(top: 2,  bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 57, left: 57),
              child: Text(
                error,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 17,
              ),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width - 30,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.only(
                    top: 17, bottom: 16, left: 75, right: 75),
                onPressed: () { ref
                    .watch(goRouterProvider)
                    .go(RouteConstants.selectProduct);},
                color: ThemeApp.mainBlue,
                child: const Text(
                  'В каталог',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ThemeApp.mainWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
