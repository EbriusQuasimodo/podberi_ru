import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/rko/comparison_rko_data.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/rko/favorites_rko_data.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';

class ProductCardWidgetWithButtons extends ConsumerStatefulWidget {
  final String productRating;
  final ListProductModel? productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final bool isFavorite;
  final VoidCallback onTap;

  ///кастомный виджет с карточкой банковсвкого продукта
  ///(отличительные особенности - есть кнопки добавить в избранное и сравнение)
  ProductCardWidgetWithButtons({
    super.key,
    required this.productRating,
    this.productInfo,
    required this.basicApiPageSettingsModel,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  ConsumerState<ProductCardWidgetWithButtons> createState() =>
      _ProductCardWidgetWithButtonsState();
}

class _ProductCardWidgetWithButtonsState
    extends ConsumerState<ProductCardWidgetWithButtons> {
  List<Widget> list() {
    var list = <Widget>[];

    for (int i = 0; i < 4; i++) {
      list.add(
        Text(
          "${widget.productInfo!.features[i]}",
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: ThemeApp.mainWhite,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      );
    }

    return list;
  }

  final isar = Isar.getInstance();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.productInfo != null ? Colors.green : ThemeApp.darkestGrey,
        //color: Color(int.parse(
        //   '0xff${productInfo?.bankDetails?.color}')), //int.parse('0xff${productInfo?.bankDetails?.color}')
      ),
      width: 280,
      height: 190,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 9, right: 7, left: 7, bottom: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ThemeApp.mainWhite,
              ),
              child: Image.network(
                '${Urls.api.files}/${widget.productInfo?.bankDetails?.picture}',
                height: 32,
                width: 36,
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            right: 86,
            child: Text(
              "${widget.productInfo?.cardName}",
              maxLines: 3,
              style: const TextStyle(
                  color: ThemeApp.mainWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          widget.productInfo!.features.isNotEmpty
              ? Positioned(
                  left: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list(),
                  ),
                )
              : const SizedBox.shrink(),
          Positioned(
              right: 16,
              bottom: 70,
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: ThemeApp.mainWhite,
                    size: 20,
                  ),
                  Text(
                    widget.productRating,
                    style: const TextStyle(
                        color: ThemeApp.mainWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )
                ],
              )),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 90,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  ref.watch(goRouterProvider).push(RouteConstants.details,
                      extra: BasicApiPageSettingsModel(
                          productTypeUrl:
                              widget.basicApiPageSettingsModel.productTypeUrl,
                          pageName: widget.basicApiPageSettingsModel.pageName,
                          productId: widget.productInfo?.id,
                          bankDetailsModel: BankDetailsModel(
                              bankName:
                                  widget.productInfo?.bankDetails?.bankName,
                              picture:
                                  widget.productInfo?.bankDetails?.picture)));
                },
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        switch (
                            widget.basicApiPageSettingsModel.productTypeUrl) {
                          case 'debit_cards':
                            ComparisonDebitCardsData comparisonDebitCardsData =
                                ComparisonDebitCardsData()
                                  ..id = widget.productInfo?.id;

                            await isar?.writeTxn(() async => await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInComparison(
                                        widget.productInfo!,
                                        widget.basicApiPageSettingsModel
                                            .productTypeUrl!)
                                ? await isar?.comparisonDebitCardsDatas
                                    .filter()
                                    .idEqualTo(widget.productInfo?.id)
                                    .deleteAll()
                                : await isar?.comparisonDebitCardsDatas
                                    .put(comparisonDebitCardsData));
                          case 'credit_cards':
                            ComparisonCreditCardsData
                                comparisonCreditCardsData =
                                ComparisonCreditCardsData()
                                  ..id = widget.productInfo?.id;
                            await isar?.writeTxn(() async => await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInComparison(
                                        widget.productInfo!,
                                        widget.basicApiPageSettingsModel
                                            .productTypeUrl!)
                                ? await isar?.comparisonCreditCardsDatas
                                    .filter()
                                    .idEqualTo(widget.productInfo?.id)
                                    .deleteAll()
                                : await isar?.comparisonCreditCardsDatas
                                    .put(comparisonCreditCardsData));
                          case 'zaimy':
                            ComparisonZaimyData comparisonZaimyData =
                                ComparisonZaimyData()
                                  ..id = widget.productInfo?.id;
                            await isar?.writeTxn(() async =>
                                await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInComparison(
                                    widget.productInfo!,
                                    widget.basicApiPageSettingsModel
                                        .productTypeUrl!)
                                    ? await isar?.comparisonZaimyDatas
                                        .filter()
                                        .idEqualTo(widget.productInfo?.id)
                                        .deleteAll()
                                    : await isar?.comparisonZaimyDatas
                                        .put(comparisonZaimyData));
                          case 'rko':
                            ComparisonRkoData comparisonRkoData =
                                ComparisonRkoData()
                                  ..id = widget.productInfo?.id;
                            await isar?.writeTxn(() async =>
                                await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInComparison(
                                    widget.productInfo!,
                                    widget.basicApiPageSettingsModel
                                        .productTypeUrl!)
                                    ? await isar?.comparisonRkoDatas
                                        .filter()
                                        .idEqualTo(widget.productInfo?.id)
                                        .deleteAll()
                                    : await isar?.comparisonRkoDatas
                                        .put(comparisonRkoData));
                        }
                        widget.onTap();
                      },
                      child: FutureBuilder(
                          future:
                          ref
                              .watch(isarNotifierProvider.notifier)
                              .isItemDuplicateInComparison(
                              widget.productInfo!,
                              widget.basicApiPageSettingsModel
                                  .productTypeUrl!),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.data) {
                                return SvgPicture.asset(
                                  'assets/icons/comparison_select.svg',
                                  color: ThemeApp.mainWhite,
                                  height: 32,
                                  width: 32,
                                );
                              } else {
                                return SvgPicture.asset(
                                  'assets/icons/nav_bar_icons/comparison_page.svg',
                                  color: ThemeApp.mainWhite,
                                  height: 32,
                                  width: 32,
                                );
                              }
                            }
                            return SizedBox(
                              height: MediaQuery.of(context).size.height - 72,
                            );
                          })),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        switch (
                            widget.basicApiPageSettingsModel.productTypeUrl) {
                          case 'debit_cards':
                            FavoritesDebitCardsData favoritesDebitCardsData =
                                FavoritesDebitCardsData()
                                  ..id = widget.productInfo?.id;

                            await isar?.writeTxn(() async =>
                                await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInFavorites(
                                    widget.productInfo!,
                                    widget.basicApiPageSettingsModel
                                        .productTypeUrl!)
                                    ? await isar?.favoritesDebitCardsDatas
                                        .filter()
                                        .idEqualTo(widget.productInfo?.id)
                                        .deleteAll()
                                    : await isar?.favoritesDebitCardsDatas
                                        .put(favoritesDebitCardsData));
                          case 'credit_cards':
                            FavoritesCreditCardsData favoritesCreditCardsData =
                                FavoritesCreditCardsData()
                                  ..id = widget.productInfo?.id;
                            await isar?.writeTxn(() async =>
                                await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInFavorites(
                                    widget.productInfo!,
                                    widget.basicApiPageSettingsModel
                                        .productTypeUrl!)
                                    ? await isar?.favoritesCreditCardsDatas
                                        .filter()
                                        .idEqualTo(widget.productInfo?.id)
                                        .deleteAll()
                                    : await isar?.favoritesCreditCardsDatas
                                        .put(favoritesCreditCardsData));
                          case 'zaimy':
                            FavoritesZaimyData favoritesZaimyData =
                                FavoritesZaimyData()
                                  ..id = widget.productInfo?.id;
                            await isar?.writeTxn(() async =>
                                await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInFavorites(
                                    widget.productInfo!,
                                    widget.basicApiPageSettingsModel
                                        .productTypeUrl!)
                                    ? await isar?.favoritesZaimyDatas
                                        .filter()
                                        .idEqualTo(widget.productInfo?.id)
                                        .deleteAll()
                                    : await isar?.favoritesZaimyDatas
                                        .put(favoritesZaimyData));
                          case 'rko':
                            FavoritesRkoData favoritesRkoData =
                                FavoritesRkoData()..id = widget.productInfo?.id;
                            await isar?.writeTxn(() async =>
                                await ref
                                    .watch(isarNotifierProvider.notifier)
                                    .isItemDuplicateInFavorites(
                                    widget.productInfo!,
                                    widget.basicApiPageSettingsModel
                                        .productTypeUrl!)
                                    ? await isar?.favoritesRkoDatas
                                        .filter()
                                        .idEqualTo(widget.productInfo?.id)
                                        .deleteAll()
                                    : await isar?.favoritesRkoDatas
                                        .put(favoritesRkoData));
                        }
                        widget.onTap();
                      },
                      child: FutureBuilder(
                          future:
                          ref
                              .watch(isarNotifierProvider.notifier)
                              .isItemDuplicateInFavorites(
                              widget.productInfo!,
                              widget.basicApiPageSettingsModel
                                  .productTypeUrl!),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.data) {
                                return SvgPicture.asset(
                                  'assets/icons/favorites_select.svg',
                                  color: ThemeApp.mainWhite,
                                  height: 32,
                                  width: 32,
                                );
                              } else {
                                return SvgPicture.asset(
                                  'assets/icons/nav_bar_icons/favorites_page.svg',
                                  color: ThemeApp.mainWhite,
                                  height: 32,
                                  width: 32,
                                );
                              }
                            }
                            return SizedBox(
                              height: MediaQuery.of(context).size.height - 72,
                            );
                          })),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
