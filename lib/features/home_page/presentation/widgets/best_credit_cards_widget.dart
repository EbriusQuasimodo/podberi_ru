import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';

import 'common_helpers_widgets/product_card_widget_without_buttons.dart';
import 'common_helpers_widgets/standard_widget_with_list.dart';

class BestCreditCardsWidget extends ConsumerWidget {
  const BestCreditCardsWidget({super.key});

  ///best credit cards widget when pressed go to [DetailsPage]
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
        child: StandardItemWithListWidget(
          listHeight: 190,
          widgetName: 'Кредитные карты',
          showMoreButtonName: 'Показать все',
          onTapShowMoreButton: () {},
          childOfList: BankProductCardWidgetWithoutButtons(
              onTap: () {
                ref.watch(goRouterProvider).push(
                  RouteConstants.details,
                );
              },
              productName: 'Тинькофф \nДрайв Кредитная',
              productShortDescription:
              'Лимит - 1 000 000 руб.\nБез процентов - до 55 дней\nСтоимость - 495 руб./год\nКэшбек - от 1 до 30%',
              productRating: '4.8',
              bankLogoIconPath: 'assets/icons/tinkoff_logo_icon.svg'),
        ),
      );
  }
}
