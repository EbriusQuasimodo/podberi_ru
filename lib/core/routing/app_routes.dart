import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/presentation/navigation_bar_icon.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_page.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';
import 'package:podberi_ru/features/catalog_page/presentation/select_product_type_page.dart';
import 'package:podberi_ru/features/comparison_page/presentation/comparison_page.dart';
import 'package:podberi_ru/features/details_page/domain/details_parameters_model.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_page.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_page.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/select_category_promo_codes_page.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_code_details_page.dart';

enum AppRoute {
  homePage,
  allBanksPage,
  selectProductPage,
  catalogPage,
  detailsPage,
  favoritesPage,
  selectCategoryPromoCodesPage,
  promoCodesPage,
  promoCodesDetailsPage,
  comparisonPage
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorFKey = GlobalKey<NavigatorState>(debugLabel: 'shellF');

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  return GoRouter(
      initialLocation: RouteConstants.home,
      navigatorKey: GetIt.I<Alice>().getNavigatorKey(),
      routes: [
        // GoRoute(path: '/filters', name: 'filters',
        //   pageBuilder: (context, state) =>
        //       NoTransitionPage( child: FiltersPage()),),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorAKey,
              routes: [
                GoRoute(
                  path: RouteConstants.home,
                  name: AppRoute.homePage.name,
                  pageBuilder: (context, state) =>
                      NoTransitionPage(key: UniqueKey(), child: HomePage()),
                ),
                GoRoute(
                  path: RouteConstants.allBanks,
                  name: AppRoute.allBanksPage.name,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      child: AllBanksPage(),
                    );
                  },
                  routes: const [],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorBKey,
              routes: [
                GoRoute(
                  path: RouteConstants.selectProduct,
                  name: AppRoute.selectProductPage.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: UniqueKey(),
                    child: SelectProductTypePage(),
                  ),
                  routes: const [],
                ),
                GoRoute(
                  path: RouteConstants.catalog,
                  name: AppRoute.catalogPage.name,
                  pageBuilder: (context, state) {
                    String whereFrom = state.extra as  String;
                    return NoTransitionPage(
                      child: CatalogPage(
                        whereFrom: whereFrom,
                      ),
                    );
                  },
                  routes: const [],
                ),
                GoRoute(
                  path: RouteConstants.details,
                  name: AppRoute.detailsPage.name,
                  pageBuilder: (context, state) {
                    DetailsParameters detailsParameters = state.extra as DetailsParameters;
                    return NoTransitionPage(
                      child: DetailsPage(
                        detailsParameters: detailsParameters,
                      ),
                    );
                  },
                  routes: const [],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorDKey,
              routes: [
                GoRoute(
                  path: RouteConstants.favorites,
                  name: AppRoute.favoritesPage.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: UniqueKey(),
                    child: FavoritesPage(),
                  ),
                  routes: const [],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorCKey,
              routes: [
                GoRoute(
                  path: RouteConstants.selectCategoryPromocodes,
                  name: AppRoute.selectCategoryPromoCodesPage.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: UniqueKey(),
                    child: SelectCategoryPromoCodesPage(),
                  ),
                  routes: const [],
                ),
                GoRoute(
                  path: RouteConstants.promocodes,
                  name: AppRoute.promoCodesPage.name,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      child: PromoCodesPage(),
                    );
                  },
                  routes: const [],
                ),
                GoRoute(
                  path: RouteConstants.promocodesDetails,
                  name: AppRoute.promoCodesDetailsPage.name,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      child: PromoCodesDetailsPage(),
                    );
                  },
                  routes: const [],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorFKey,
              routes: [
                GoRoute(
                  path: RouteConstants.comparison,
                  name: AppRoute.comparisonPage.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: UniqueKey(),
                    child: ComparisonPage(),
                  ),
                  routes: const [],
                ),
              ],
            ),
          ],
        )
      ]);
});

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 2),
        color: Colors.transparent,
        height: 70,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: navigationShell.currentIndex,
            items: [
              bottomNavigationItem(
                  'assets/icons/nav_bar_icons/home_page.svg', 'Главная'),
              bottomNavigationItem(
                  'assets/icons/nav_bar_icons/catalog_page.svg', 'Каталог'),
              bottomNavigationItem(
                  'assets/icons/nav_bar_icons/favorites_page.svg', 'Избранное'),
              bottomNavigationItem(
                  'assets/icons/nav_bar_icons/promocodes_page.svg', 'Бонусы'),
              bottomNavigationItem(
                  'assets/icons/nav_bar_icons/comparison_page.svg',
                  'Сравнение'),
            ],
            onTap: _goBranch,
          ),
        ),
      ),
    );
  }
}
