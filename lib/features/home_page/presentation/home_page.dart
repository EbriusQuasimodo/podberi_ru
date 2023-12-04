import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/best_credit_cards_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/best_debit_cards_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/blog_widget.dart';
import 'package:podberi_ru/core/presentation/custom_app_bar_with_search.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/mini_list_of_banks_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/promocodes_ads_widgets/promocodes_ads_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/stories_widget.dart';

import 'widgets/best_offer_widgets/best_offer_widget.dart';
import 'widgets/select_product_type_widgets/select_product_type_widget.dart';

/// all home page
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ///custom app bar with search widget
          SliverToBoxAdapter(
            child: CustomAppBarWithSearch(
              controller: searchController,
              topPadding: 30,
              bottomPadding: 17,
              title: 'Доброго дня, дорогой гость!',
            ),
          ),
          const StoriesWidget(),
          const BestOfferWidget(),
          const SelectProductTypeWidget(),
          const BestCreditCardsWidget(),
          const MiniListOfBanksWidget(),
          const BestDebitCardsWidget(),
          const PromoCodesAdsWidget(),
          const BlogWidget(),
        ],
      ),
    );
  }
}
