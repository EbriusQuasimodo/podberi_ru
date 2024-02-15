import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_controller.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/widgets/promo_code_details_page_widgets/promo_code_action_deadline_widget.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/widgets/promo_code_details_page_widgets/promo_code_conditions_widget.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/widgets/promo_code_details_page_widgets/promo_code_preview_widget.dart';
///промокодов временно не будет ( планируется добавить после релиза мвп)
class PromoCodesDetailsPage extends ConsumerWidget {
  PromoCodesDetailsPage({super.key});

  late String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    category = ref.watch(promoCodesCategoryStateProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text(category),
          ),
          const PromoCodePreviewWidget(),
          const PromoCodeActionDeadlineWidget(),
          const PromoCodeConditionsWidget(),
        ],
      ),
    );
  }
}
