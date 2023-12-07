import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';

import 'common_helpers_widgets/product_card_widget_without_buttons.dart';
import 'common_helpers_widgets/standard_widget_with_list.dart';

class BestDebitCardsWidget extends ConsumerWidget {
  const BestDebitCardsWidget({super.key});

  ///best debit cards widget when pressed go to [DetailsPage]
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: StandardItemWithListWidget(
        listHeight: 190,
        widgetName: 'Дебетовые карты',
        showMoreButtonName: 'Показать все',
        onTapShowMoreButton: () {},
        childOfList: BankProductCardWidgetWithoutButtons(
            onTap: () {
              ///todo: add api
              ref.watch(goRouterProvider).push(
                    RouteConstants.details,
                  );
            },
            productName: 'Тинькофф',
            productShortDescription:
                'Бесплатная\nСнятие без % - 350 000 руб.\nДоставка 1-2 дня\nБез овердрафта',
            productRating: '4.2',
            bankLogoIconPath: 'assets/icons/tinkoff_logo_icon.svg'),
      ),
    );
  }
}
