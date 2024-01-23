import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_loading_card_widget.dart';
import 'package:podberi_ru/core/presentation/on_error_widget.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/credit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/debit_cards_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/zaimy_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_products_list_widget/bank_product_list_widget.dart';
import 'package:podberi_ru/features/filters_page/presentation/widgets/save_button_widget.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';

class LoadSortByProductType extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  LoadSortByProductType({
    super.key,
    required this.basicApiPageSettingsModel,
  });

  @override
  ConsumerState<LoadSortByProductType> createState() =>
      _LoadSortByProductTypeState();
}

class _LoadSortByProductTypeState extends ConsumerState<LoadSortByProductType> {
  List<String> sortDebitCardsVariantsList = [
    'По умолчанию',
    'По кэшбеку',
    'По обслуживанию'
  ];
  List<String> sortCreditCardsVariantsList = [
    'По умолчанию',
    'По льготному периоду',
    'По лимиту',
    'По ставке'
  ];
  List<String> sortZaimyVariantsList = [
    'По умолчанию',
    'По сумме займа',
    'По ставке',
    'По сроку'
  ];
  List<String> sortRkoVariantsList = ['По умолчанию', 'По обслуживанию'];

  @override
  Widget build(BuildContext context) {
    if (widget.basicApiPageSettingsModel.productTypeUrl == 'debit_cards') {
      return Container(
        decoration: BoxDecoration(
            color: ThemeApp.mainWhite, borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView.builder(
            itemCount: sortDebitCardsVariantsList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ThemeApp.grey,
                    borderRadius: BorderRadius.circular(14)),
                margin: const EdgeInsets.only(bottom: 6),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {});
                      ref.read(goRouterProvider).pop();
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 15),
                        child: Text(
                          sortDebitCardsVariantsList[index],
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      );
    } else if (widget.basicApiPageSettingsModel.productTypeUrl ==
        'credit_cards') {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              color: ThemeApp.mainWhite,
              borderRadius: BorderRadius.circular(14)),
          padding:
              const EdgeInsets.only(top: 12, left: 15, right: 15, bottom: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: 78,
                  height: 6,
                  decoration: BoxDecoration(
                      color: ThemeApp.darkGrey,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              SliverList(
                  delegate:
                      SliverChildBuilderDelegate((context, index) => Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ThemeApp.grey,
                                borderRadius: BorderRadius.circular(14)),
                            margin: const EdgeInsets.only(bottom: 6),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  setState(() {});
                                  ref.read(goRouterProvider).pop();
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 15,
                                            bottom: 15),
                                        child: Text(
                                          sortCreditCardsVariantsList[index],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: ThemeApp.mainWhite,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: const EdgeInsets.all(5),
                                        margin: const EdgeInsets.only(
                                            right: 15, top: 15, bottom: 15),
                                        child: SvgPicture.asset(
                                          'assets/icons/filer_check_icon.svg',
                                          height: 16,
                                          width: 16,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )))
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            SaveButtonWidget(onTapTrashButton: () {}, onTapSaveButton: () {}),
      );
    } else if (widget.basicApiPageSettingsModel.productTypeUrl == 'zaimy') {
      return Container(
        decoration: BoxDecoration(
            color: ThemeApp.mainWhite, borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Stack(
          children: [
            Positioned(
              child: ListView.builder(
                  itemCount: sortZaimyVariantsList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ThemeApp.grey,
                          borderRadius: BorderRadius.circular(14)),
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            setState(() {});
                            ref.read(goRouterProvider).pop();
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15, bottom: 15),
                              child: Text(
                                sortZaimyVariantsList[index],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Positioned.fill(
                child: SaveButtonWidget(
                    onTapTrashButton: () {}, onTapSaveButton: () {}))
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            color: ThemeApp.mainWhite, borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Stack(
          children: [
            Positioned(
              child: ListView.builder(
                  itemCount: sortRkoVariantsList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ThemeApp.grey,
                          borderRadius: BorderRadius.circular(14)),
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            setState(() {});
                            ref.read(goRouterProvider).pop();
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15, bottom: 15),
                              child: Text(
                                sortRkoVariantsList[index],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Positioned.fill(
                child: SaveButtonWidget(
                    onTapTrashButton: () {}, onTapSaveButton: () {}))
          ],
        ),
      );
    }
  }
}
