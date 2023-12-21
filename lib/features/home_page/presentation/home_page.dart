import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/best_credit_cards_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/best_debit_cards_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/blog_widget.dart';
import 'package:podberi_ru/core/presentation/custom_app_bar_with_search.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/promocodes_ads_widgets/promocodes_ads_widget.dart';

import 'controllers/best_offer_controller.dart';
import 'controllers/credit_cards_controller.dart';
import 'controllers/debit_cards_controller.dart';
import 'widgets/best_offer_widgets/best_offer_widget.dart';
import 'widgets/select_product_type_widgets/select_product_type_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  /// all home page
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
          SliverAppBar(
            title: const Text(
              'Доброго дня, дорогой гость!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          ),
          CustomAppBarWithSearch(controller: searchController),
          //const StoriesWidget(),
          ref.watch(bestOfferControllerProvider).when(
            data: (bestOffer) {
              return BestOfferWidget(
                bestOffer: bestOffer,
              );
            },
            error: (error, _) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error.toString())),
                );
              });
              return const SliverToBoxAdapter(child: SizedBox.shrink());
              //return  SliverToBoxAdapter(child: CustomErrorPageWidget(error: error.toString(),bottomPadding: 0,));
            },
            loading: () {
              return const SliverToBoxAdapter(
                  child: CustomLoadingCardWidget(
                bottomPadding: 0,
              ));
            },
          ),

          const SelectProductTypeWidget(),

          ref.watch(creditCardsControllerProvider).when(
            data: (creditCards) {
              return BestCreditCardsWidget(
                creditCards: creditCards,
              );
            },
            error: (error, _) {
              // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(content: Text(error.toString())),
              //   );
              // });
              return const SliverToBoxAdapter(child: SizedBox.shrink());
              //return SliverToBoxAdapter(child: CustomErrorPageWidget(error: error.toString(),bottomPadding: 0,));
            },
            loading: () {
              return const SliverToBoxAdapter(
                  child: CustomLoadingCardWidget(
                bottomPadding: 0,
              ));
            },
          ),
          // ref.watch(banksControllerProvider).when(
          //   data: (banksModel) {
          //     return MiniListOfBanksWidget(
          //       banksModel: banksModel,
          //     );
          //   },
          //   error: (error, _) {
          //
          //     return SliverToBoxAdapter(child: SizedBox.shrink());
          //     //return  SliverToBoxAdapter(child: CustomErrorPageWidget(error: error.toString(),bottomPadding: 0,));
          //   },
          //   loading: () {
          //     return const SliverToBoxAdapter(child:CustomLoadingCardWidget(bottomPadding: 0,));
          //   },
          // ),

          ref.watch(debitCardsControllerProvider).when(
            data: (debitCards) {
              return BestDebitCardsWidget(
                debitCards: debitCards,
              );
            },
            error: (error, _) {
              return const SliverToBoxAdapter(child: SizedBox.shrink());
              //return  SliverToBoxAdapter(child: CustomErrorPageWidget(error: error.toString(),bottomPadding: 0,));
            },
            loading: () {
              return const SliverToBoxAdapter(
                  child: CustomLoadingCardWidget(
                bottomPadding: 0,
              ));
            },
          ),
          const PromoCodesAdsWidget(),
          const BlogWidget(),
        ],
      ),
    );
  }
}
