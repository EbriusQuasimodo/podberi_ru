import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/error_widgets/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/domain/pagination_params_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/widgets/all_banks_list_widget.dart';
import 'package:podberi_ru/features/catalog_page/shared_presentation/catalog_page.dart';

class AllBanksPage extends ConsumerWidget {
  ///all bank page. when press on bank card go to [CatalogPage] with selected bank name
  const AllBanksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: RefreshIndicator(
        color: ThemeApp.mainBlue,
        onRefresh: () => ref.refresh(allBanksControllerProvider(PaginationParamsModel(fetch: 20, page: 1)).future),
        child: CustomScrollView(
          //physics: new ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0,
              backgroundColor: ThemeApp.mainWhite,
              pinned: true,
              title: const Text('Все банки'),
              leading: IconButton(
                onPressed: () {
                  ref.read(goRouterProvider).go(RouteConstants.selectProduct);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            ref.watch(allBanksControllerProvider(PaginationParamsModel(fetch: 20, page: 1))).when(
              data: (allBanks) {
                return AllBanksListWidget(
                  itemCount: allBanks.itemsCount,
                );
              },
              error: (error, _) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: OnErrorWidget(
                      error: error.toString(),
                      onGoBackButtonTap: () {
                        ref.watch(goRouterProvider).pop();
                      },
                      onRefreshButtonTap: () =>
                        ref.refresh(allBanksControllerProvider(PaginationParamsModel(fetch: 20, page: 1)))
                      ),
                );
              },
              loading: () {
                return  SliverFillRemaining(
                    child: CustomLoadingCardWidget(
                  bottomPadding: kBottomNavigationBarHeight+3 +MediaQuery.of(context).padding.bottom,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
