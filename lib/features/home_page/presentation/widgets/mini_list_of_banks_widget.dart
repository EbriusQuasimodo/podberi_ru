import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_page.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';

import 'common_helpers_widgets/standard_widget_with_list.dart';

///mini list of banks on card tap go to [CatalogPage] on showAllBanks tap go to [AllBanksPage]
class MiniListOfBanksWidget extends ConsumerWidget {
  const MiniListOfBanksWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: StandardItemWithListWidget(
        listHeight: 140,
        widgetName: 'Выберите банк',
        showMoreButtonName: 'Все банки',
        onTapShowMoreButton: () {
          ref.watch(goRouterProvider).push(RouteConstants.allBanks);
        },
        childOfList: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              ref.watch(bankFromAllBanksStateProvider.notifier).state =
                  'Тинькофф Банк';
              ref.watch(goRouterProvider).push(RouteConstants.catalog,
                  extra: AppRoute.allBanksPage.name);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffFFBE0B),
              ),
              width: 140,
              height: 140,
              margin: const EdgeInsets.only(right: 3, left: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/tinkoff_logo_icon.svg',
                    height: 51,
                    width: 57,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Тинькофф Банк',
                    maxLines: 3,
                    style: TextStyle(
                        color: ThemeApp.mainWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
