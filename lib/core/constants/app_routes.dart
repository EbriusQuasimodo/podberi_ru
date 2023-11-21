
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_page.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page.dart';
import 'package:podberi_ru/features/profile_page/presentation/profile_page.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_page.dart';

enum AppRoute {
  homePage,
  catalogPage,
  favoritesPage,
  promoCodesPage,
  profilePage
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorFKey = GlobalKey<NavigatorState>(debugLabel: 'shellF');

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/',
      navigatorKey: _rootNavigatorKey,
      routes: [
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
                  path: '/',
                  name: AppRoute.homePage.name,
                  builder: (context, state) => const HomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorBKey,
              routes: [
                GoRoute(
                  path: '/catalog',
                  name: AppRoute.catalogPage.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: CatalogPage(),
                  ),
                  routes: const [],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorCKey,
              routes: [
                GoRoute(
                  path: '/promocodes',
                  name: AppRoute.promoCodesPage.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: PromoCodesPage(),
                  ),
                  routes: const [],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorDKey,
              routes: [
                GoRoute(
                  path: '/favorites',
                  name: AppRoute.favoritesPage.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: FavoritesPage(),
                  ),
                  routes: const [],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorFKey,
              routes: [
                GoRoute(
                  path: '/profile',
                  name: AppRoute.profilePage.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ProfilePage(),
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
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            label: 'Главная',
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Каталог',
            icon: Icon(Icons.list_alt),
          ),
          NavigationDestination(
            label: 'Промокоды',
            icon: Icon(Icons.percent),
          ),
          NavigationDestination(
            label: 'Избранное',
            icon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            label: 'Профиль',
            icon: Icon(Icons.person),
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
