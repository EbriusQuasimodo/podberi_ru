import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/rko/comparison_rko_data.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/rko/favorites_rko_data.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';

class CreditCardPreviewWidget extends ConsumerStatefulWidget {
  final ListCreditCardsModel productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final VoidCallback onFavoritesOrComparisonTap;

  ///виджет с превью банковского продукта (фото, название, кнопка Заказать), используется в [DetailsPage]
  const CreditCardPreviewWidget({
    super.key,
    required this.productInfo,
    required this.basicApiPageSettingsModel,
    required this.onFavoritesOrComparisonTap,
  });

  @override
  ConsumerState<CreditCardPreviewWidget> createState() => _CreditCardPreviewWidgetState();
}

class _CreditCardPreviewWidgetState extends ConsumerState<CreditCardPreviewWidget> {
  final _controllerBestOffers = PageController(
    viewportFraction: 0.9,
  );

  double currentPage = 0;

  @override
  void initState() {
    _controllerBestOffers.addListener(() {
      setState(() {
        currentPage = _controllerBestOffers.page!.toDouble();
      });
    });
    super.initState();
  }

  final isar = Isar.getInstance();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        padding: const EdgeInsets.only(top: 30, bottom: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Text(
                '${widget.basicApiPageSettingsModel.bankDetailsModel?.bankName} ${widget.productInfo.name}',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            widget.basicApiPageSettingsModel.productTypeUrl !=
                    ProductTypeEnum.rko.name
                ? ExpandablePageView(
                    physics: const BouncingScrollPhysics(),
                    controller: _controllerBestOffers,
                    children: [
                        Image.network(
                          '${Urls.api.files}/${widget.productInfo.image}',
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return SvgPicture.asset(
                              'assets/icons/image_not_found_icon.svg',
                              color: ThemeApp.darkestGrey,
                            );
                          },
                        ),
                      ])
                : Image.network(
                    '${Urls.api.files}/${widget.productInfo.image}',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return SvgPicture.asset(
                        'assets/icons/image_not_found_icon.svg',
                        color: ThemeApp.darkestGrey,
                      );
                    },
                  ),
            widget.basicApiPageSettingsModel.productTypeUrl !=
                        ProductTypeEnum.rko.name &&
                    widget.basicApiPageSettingsModel.productTypeUrl !=
                        ProductTypeEnum.zaimy.name
                ? Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4),
                            alignment: Alignment.centerLeft,
                            height: currentPage == index ? 10 : 8,
                            width: currentPage == index ? 10 : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPage == index
                                  ? ThemeApp.backgroundBlack
                                  : ThemeApp.darkestGrey,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 30,
                  ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6, left: 15),
                    child: MaterialButton(
                      height: 50,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: ThemeApp.mainBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Text(
                        widget.basicApiPageSettingsModel.productTypeUrl != 'rko'
                            ? 'Заказать карту'
                            : 'Открыть счет',
                        style: const TextStyle(
                            color: ThemeApp.mainWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(14),
                  color: ThemeApp.grey,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () async {
                      switch (widget.basicApiPageSettingsModel.productTypeUrl) {
                        case 'debit_cards':
                          FavoritesDebitCardsData favoritesDebitCardsData =
                              FavoritesDebitCardsData()
                                ..id = widget.productInfo.id;

                          await isar?.writeTxn(() async => await ref
                                  .watch(isarNotifierProvider.notifier)
                                  .isItemDuplicateInFavorites(
                                      widget.productInfo.id,
                                      widget.basicApiPageSettingsModel
                                          .productTypeUrl!)
                              ? await isar?.favoritesDebitCardsDatas
                                  .filter()
                                  .idEqualTo(widget.productInfo.id)
                                  .deleteAll()
                              : await isar?.favoritesDebitCardsDatas
                                  .put(favoritesDebitCardsData));
                        case 'credit_cards':
                          FavoritesCreditCardsData favoritesCreditCardsData =
                              FavoritesCreditCardsData()
                                ..id = widget.productInfo.id;
                          await isar?.writeTxn(() async => await ref
                                  .watch(isarNotifierProvider.notifier)
                                  .isItemDuplicateInFavorites(
                                      widget.productInfo.id,
                                      widget.basicApiPageSettingsModel
                                          .productTypeUrl!)
                              ? await isar?.favoritesCreditCardsDatas
                                  .filter()
                                  .idEqualTo(widget.productInfo.id)
                                  .deleteAll()
                              : await isar?.favoritesCreditCardsDatas
                                  .put(favoritesCreditCardsData));
                        case 'zaimy':
                          FavoritesZaimyData favoritesZaimyData =
                              FavoritesZaimyData()..id = widget.productInfo.id;
                          await isar?.writeTxn(() async => await ref
                                  .watch(isarNotifierProvider.notifier)
                                  .isItemDuplicateInFavorites(
                                      widget.productInfo.id,
                                      widget.basicApiPageSettingsModel
                                          .productTypeUrl!)
                              ? await isar?.favoritesZaimyDatas
                                  .filter()
                                  .idEqualTo(widget.productInfo.id)
                                  .deleteAll()
                              : await isar?.favoritesZaimyDatas
                                  .put(favoritesZaimyData));
                        case 'rko':
                          FavoritesRkoData favoritesRkoData = FavoritesRkoData()
                            ..id = widget.productInfo.id;
                          await isar?.writeTxn(() async => await ref
                                  .watch(isarNotifierProvider.notifier)
                                  .isItemDuplicateInFavorites(
                                      widget.productInfo.id,
                                      widget.basicApiPageSettingsModel
                                          .productTypeUrl!)
                              ? await isar?.favoritesRkoDatas
                                  .filter()
                                  .idEqualTo(widget.productInfo.id)
                                  .deleteAll()
                              : await isar?.favoritesRkoDatas
                                  .put(favoritesRkoData));
                      }
                      widget.onFavoritesOrComparisonTap();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: FutureBuilder(
                          future: ref
                              .watch(isarNotifierProvider.notifier)
                              .isItemDuplicateInFavorites(
                                  widget.productInfo.id,
                                  widget.basicApiPageSettingsModel
                                      .productTypeUrl!),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.data) {
                                return SvgPicture.asset(
                                  'assets/icons/favorites_select.svg',
                                  color: ThemeApp.mainBlue,
                                  height: 32,
                                  width: 32,
                                );
                              } else {
                                return SvgPicture.asset(
                                  'assets/icons/nav_bar_icons/favorites_page.svg',
                                  color: ThemeApp.backgroundBlack,
                                  height: 32,
                                  width: 32,
                                );
                              }
                            }
                            return SizedBox(
                              height: MediaQuery.of(context).size.height - 72,
                            );
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(14),
                    color: ThemeApp.grey,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        switch (
                            widget.basicApiPageSettingsModel.productTypeUrl) {
                          case 'debit_cards':
                            ComparisonDebitCardsData comparisonDebitCardsData =
                                ComparisonDebitCardsData()
                                  ..id = widget.productInfo.id;

                            await isar?.writeTxn(() async => await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInComparison(
                                        widget.productInfo.id,
                                        widget.basicApiPageSettingsModel
                                            .productTypeUrl!)
                                ? await isar?.comparisonDebitCardsDatas
                                    .filter()
                                    .idEqualTo(widget.productInfo.id)
                                    .deleteAll()
                                : await isar?.comparisonDebitCardsDatas
                                    .put(comparisonDebitCardsData));
                          case 'credit_cards':
                            ComparisonCreditCardsData
                                comparisonCreditCardsData =
                                ComparisonCreditCardsData()
                                  ..id = widget.productInfo.id;
                            await isar?.writeTxn(() async => await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInComparison(
                                        widget.productInfo.id,
                                        widget.basicApiPageSettingsModel
                                            .productTypeUrl!)
                                ? await isar?.comparisonCreditCardsDatas
                                    .filter()
                                    .idEqualTo(widget.productInfo.id)
                                    .deleteAll()
                                : await isar?.comparisonCreditCardsDatas
                                    .put(comparisonCreditCardsData));
                          case 'zaimy':
                            ComparisonZaimyData comparisonZaimyData =
                                ComparisonZaimyData()
                                  ..id = widget.productInfo.id;
                            await isar?.writeTxn(() async => await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInComparison(
                                        widget.productInfo.id,
                                        widget.basicApiPageSettingsModel
                                            .productTypeUrl!)
                                ? await isar?.comparisonZaimyDatas
                                    .filter()
                                    .idEqualTo(widget.productInfo.id)
                                    .deleteAll()
                                : await isar?.comparisonZaimyDatas
                                    .put(comparisonZaimyData));
                          case 'rko':
                            ComparisonRkoData comparisonRkoData =
                                ComparisonRkoData()..id = widget.productInfo.id;
                            await isar?.writeTxn(() async => await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInComparison(
                                        widget.productInfo.id,
                                        widget.basicApiPageSettingsModel
                                            .productTypeUrl!)
                                ? await isar?.comparisonRkoDatas
                                    .filter()
                                    .idEqualTo(widget.productInfo.id)
                                    .deleteAll()
                                : await isar?.comparisonRkoDatas
                                    .put(comparisonRkoData));
                        }
                        widget.onFavoritesOrComparisonTap();
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: FutureBuilder(
                              future: ref
                                  .watch(isarNotifierProvider.notifier)
                                  .isItemDuplicateInComparison(
                                      widget.productInfo.id,
                                      widget.basicApiPageSettingsModel
                                          .productTypeUrl!),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.data) {
                                    return SvgPicture.asset(
                                      'assets/icons/comparison_select.svg',
                                      color: ThemeApp.mainBlue,
                                      height: 32,
                                      width: 32,
                                    );
                                  } else {
                                    return SvgPicture.asset(
                                      'assets/icons/nav_bar_icons/comparison_page.svg',
                                      color: ThemeApp.backgroundBlack,
                                      height: 32,
                                      width: 32,
                                    );
                                  }
                                }
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 72,
                                );
                              })),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
