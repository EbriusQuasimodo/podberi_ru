import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/best_credit_cards_widget/best_credit_cards_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/best_debit_cards_widget/best_debit_cards_widget.dart';

import 'controllers/best_banks_controller.dart';
import 'controllers/best_offer_controller.dart';
import 'controllers/best_credit_cards_controller.dart';
import 'controllers/best_debit_cards_controller.dart';
import 'widgets/best_offer_widgets/best_offer_widget.dart';
import 'widgets/mini_list_of_banks_widgets/mini_list_of_banks_widget.dart';
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
      body: RefreshIndicator(
        color: ThemeApp.mainBlue,
        onRefresh: () async {
          ref.refresh(bestOfferControllerProvider.future);
          ref.refresh(bestCreditCardsControllerProvider.future);
          ref.refresh(bestDebitCardsControllerProvider.future);
          ref.refresh(bestBanksControllerProvider.future);
        },
        child: CustomScrollView(
          slivers: [
            ///custom app bar with search widget
            const SliverAppBar(
              surfaceTintColor: ThemeApp.mainWhite,
              pinned: true,
              title: Text(
                'Добрый день!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),

            ///todo: поиск добавим в след релиз
            //CustomAppBarWithSearch(controller: searchController),
            //const StoriesWidget(),
            ref.watch(bestOfferControllerProvider).when(
              data: (bestOffer) {
                return bestOffer.isNotEmpty
                    ? BestOfferWidget(
                        bestOffer: bestOffer,
                      )
                    : const SliverToBoxAdapter(child: SizedBox.shrink());
              },
              error: (error, _) {
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
              loading: () {
                return const SliverToBoxAdapter(
                    child: CustomLoadingCardWidget(
                  bottomPadding: 0,
                ));
              },
            ),

            const SelectProductTypeWidget(),

            ref.watch(bestCreditCardsControllerProvider).when(
              data: (creditCards) {
                return creditCards.items.isNotEmpty
                    ? BestCreditCardsWidget(
                        creditCards: creditCards.items,
                      )
                    : const SliverToBoxAdapter(child: SizedBox.shrink());
              },
              error: (error, _) {
                // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text(error.toString())),
                //   );
                // });
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
              loading: () {
                return const SliverToBoxAdapter(
                    child: CustomLoadingCardWidget(
                  bottomPadding: 0,
                ));
              },
            ),
            ref.watch(bestBanksControllerProvider).when(
              data: (banksModel) {
                return MiniListOfBanksWidget(
                  banksModel: banksModel.items,
                );
              },
              error: (error, _) {
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
              loading: () {
                return const SliverToBoxAdapter(
                    child: CustomLoadingCardWidget(
                  bottomPadding: 0,
                ));
              },
            ),

            ref.watch(bestDebitCardsControllerProvider).when(
              data: (debitCards) {
                return debitCards.items.isNotEmpty
                    ? BestDebitCardsWidget(
                        debitCards: debitCards.items,
                      )
                    : const SliverToBoxAdapter(child: SizedBox.shrink());
              },
              error: (error, _) {
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
              loading: () {
                return const SliverToBoxAdapter(
                    child: CustomLoadingCardWidget(
                  bottomPadding: 0,
                ));
              },
            ),
            ///промокодов временно не будет ( планируется добавить после релиза мвп)
            // const PromoCodesAdsWidget(),
            ///блога временно не будет ( возможно сделаю пока будут тестировать мобилку)
            // const BlogWidget(),
          ],
        ),
      ),
    );
  }
}
