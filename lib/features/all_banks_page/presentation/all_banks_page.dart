import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/presentation/custom_error_card_widget.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/widgets/all_banks_list_widget.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';


class AllBanksPage extends ConsumerWidget {
  ///all bank page. when press on bank card go to [CatalogPage] with selected bank name
  const AllBanksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(allBanksControllerProvider).when(
      data: (allBanks) {
        return Scaffold(
          body: CustomScrollView(
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
              AllBanksListWidget(
                allBanks: allBanks,
              ),
            ],
          ),
        );
      },
      error: (error, _) {
        return Scaffold(
            body: CustomScrollView(slivers: [
              SliverFillRemaining(
                  child: CustomErrorPageWidget(
                    buttonName: 'Вернуться',
                    onTap: () {
                      ref.watch(goRouterProvider).pop();
                    },
                    error: error.toString(),
                    bottomPadding: 72,
                  ))
            ]));
      },
      loading: () {
        return const Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                    child: CustomLoadingCardWidget(
                      bottomPadding: 72,
                    )),
              ],
            ));
      },
    );
  }
}
