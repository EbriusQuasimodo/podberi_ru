import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/sort_controllers/debit_cards_sort_controller.dart';
import 'package:podberi_ru/features/catalog_page/sorting/credit_cards/credit_cards_sort_bottom_sheet_widget.dart';
import 'package:podberi_ru/features/catalog_page/sorting/debit_cards/debit_cards_sort_bottom_sheet_widget.dart';
import 'package:podberi_ru/features/catalog_page/sorting/zaimy/zaimy_sort_bottom_sheet_widget.dart';

class LoadSortByProductType extends ConsumerStatefulWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  const LoadSortByProductType({
    super.key,
    required this.basicApiPageSettingsModel,
  });

  @override
  ConsumerState<LoadSortByProductType> createState() =>
      _LoadSortByProductTypeState();
}

class _LoadSortByProductTypeState extends ConsumerState<LoadSortByProductType> {
  List<String> sortRkoVariantsList = ['По умолчанию', 'По обслуживанию'];
  String selectedSort = '';

  @override
  Widget build(BuildContext context) {
    if (widget.basicApiPageSettingsModel.whereFrom == AppRoute.homePage.name) {
      selectedSort = ref.watch(sortFromHomePageStateProvider);
    } else if (widget.basicApiPageSettingsModel.whereFrom ==
        AppRoute.selectProductPage.name) {
      selectedSort = ref.watch(sortFromSelectProductPageStateProvider);
    }

    if (widget.basicApiPageSettingsModel.productTypeUrl == 'debit_cards') {
      return DebitCardsSortBottomSheetWidget(
        selectedSort: selectedSort,
        basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
      );
    } else if (widget.basicApiPageSettingsModel.productTypeUrl ==
        'credit_cards') {
      return CreditCardsSortBottomSheetWidget(
          basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
          selectedSort: selectedSort);
    } else if (widget.basicApiPageSettingsModel.productTypeUrl == 'zaimy') {
      return ZaimySortBottomSheetWidget(
          basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
          selectedSort: selectedSort);
    } else {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: ThemeApp.mainWhite,
              borderRadius: BorderRadius.circular(14)),
          padding:
              const EdgeInsets.only(top: 12, left: 15, right: 15, bottom: 65),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin:
                      const EdgeInsets.only(bottom: 30, left: 140, right: 140),
                  width: 78,
                  height: 6,
                  decoration: BoxDecoration(
                      color: ThemeApp.darkGrey,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: sortRkoVariantsList.length,
                  (context, index) => Container(
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
                          setState(() {
                            if (widget.basicApiPageSettingsModel.whereFrom ==
                                AppRoute.homePage.name) {
                              ref
                                  .watch(sortFromHomePageStateProvider.notifier)
                                  .state = sortRkoVariantsList[index];
                            } else if (widget
                                    .basicApiPageSettingsModel.whereFrom ==
                                AppRoute.selectProductPage.name) {
                              ref
                                  .watch(sortFromSelectProductPageStateProvider
                                      .notifier)
                                  .state = sortRkoVariantsList[index];
                            }
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 15),
                                child: Text(
                                  sortRkoVariantsList[index],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: ThemeApp.mainWhite,
                                    borderRadius: BorderRadius.circular(5)),
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(
                                    right: 15, top: 15, bottom: 15),
                                child: SvgPicture.asset(
                                  'assets/icons/filer_check_icon.svg',
                                  height: 16,
                                  width: 16,
                                  color:
                                      selectedSort == sortRkoVariantsList[index]
                                          ? ThemeApp.mainBlue
                                          : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: MaterialButton(
                  height: 50,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: ThemeApp.mainBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: const Text(
                    'Применить',
                    style: TextStyle(
                        color: ThemeApp.mainWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 15, bottom: 15),
              child: Material(
                borderRadius: BorderRadius.circular(14),
                color: ThemeApp.grey,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() {
                      if (widget.basicApiPageSettingsModel.whereFrom ==
                          AppRoute.homePage.name) {
                        ref
                            .watch(sortFromHomePageStateProvider.notifier)
                            .state = 'По умолчанию';
                      } else if (widget.basicApiPageSettingsModel.whereFrom ==
                          AppRoute.selectProductPage.name) {
                        ref
                            .watch(
                                sortFromSelectProductPageStateProvider.notifier)
                            .state = 'По умолчанию';
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: SvgPicture.asset(
                      'assets/icons/trash_icon.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}