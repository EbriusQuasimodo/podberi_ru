import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';

class FavoriteCreditCardWidget extends ConsumerStatefulWidget {
  final String productRating;
  final ListCreditCardsModel? productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final VoidCallback deleteFromFavorites;
  final VoidCallback tapOnComparisonButton;

  ///кастомный виджет с карточкой банковсвкого продукта
  ///(отличительные особенности - есть кнопки добавить в избранное и сравнение)
  const FavoriteCreditCardWidget({
    super.key,
    required this.productRating,
    this.productInfo,
    required this.basicApiPageSettingsModel,
    required this.deleteFromFavorites,
    required this.tapOnComparisonButton,
  });

  @override
  ConsumerState<FavoriteCreditCardWidget> createState() =>
      _FavoriteCreditCardWidget();
}

class _FavoriteCreditCardWidget
    extends ConsumerState<FavoriteCreditCardWidget> {
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

        color: Color(int.parse(
          '0xff${widget.productInfo?.bankDetails?.color}')), //int.parse('0xff${productInfo?.bankDetails?.color}')
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
              height: 50, width: 50,
              padding:
              const EdgeInsets.only(top: 9, right: 7, left: 7, bottom: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ThemeApp.mainWhite,
              ),
              child: Image.network(
                '${Urls.api.files}/${widget.productInfo?.bankDetails?.logo}',
                errorBuilder: (BuildContext context,
                    Object exception, StackTrace? stackTrace) {
                  return SvgPicture.asset(
                    'assets/icons/photo_not_found.svg',
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            right: 86,
            child: Text(
              "${widget.productInfo?.name}",
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
                      extra: BasicApiPageSettingsModel(filters: FiltersModel(),
                        page: 1,
                          productTypeUrl:
                          widget.basicApiPageSettingsModel.productTypeUrl,
                          pageName: widget.basicApiPageSettingsModel.pageName,
                          productId: widget.productInfo?.id,
                          bankDetailsModel: BankListDetailsModel(
                              bankName:
                              widget.productInfo!.bankDetails!.bankName,
                              logo: widget.productInfo!.bankDetails!.logo)));
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
                        ComparisonCreditCardsData comparisonCreditCardsData =
                        ComparisonCreditCardsData()
                          ..id = widget.productInfo?.id;
                        await isar?.writeTxn(() async => await ref
                            .watch(isarNotifierProvider.notifier)
                            .isItemDuplicateInComparison(
                            widget.productInfo!.id,
                            widget.basicApiPageSettingsModel
                                .productTypeUrl!)
                            ? await isar?.comparisonCreditCardsDatas
                            .filter()
                            .idEqualTo(widget.productInfo?.id)
                            .deleteAll()
                            : await isar?.comparisonCreditCardsDatas
                            .put(comparisonCreditCardsData));

                        widget.tapOnComparisonButton();
                      },
                      child: FutureBuilder(
                          future: ref
                              .watch(isarNotifierProvider.notifier)
                              .isItemDuplicateInComparison(
                              widget.productInfo!.id,
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
                        FavoritesCreditCardsData favoritesCreditCardsData =
                        FavoritesCreditCardsData()
                          ..id = widget.productInfo?.id;
                        await isar?.writeTxn(() async => await ref
                            .watch(isarNotifierProvider.notifier)
                            .isItemDuplicateInFavorites(
                            widget.productInfo!.id,
                            widget.basicApiPageSettingsModel
                                .productTypeUrl!)
                            ? await isar?.favoritesCreditCardsDatas
                            .filter()
                            .idEqualTo(widget.productInfo?.id)
                            .deleteAll()
                            : await isar?.favoritesCreditCardsDatas
                            .put(favoritesCreditCardsData));

                        widget.deleteFromFavorites();
                      },
                      child: FutureBuilder(
                          future: ref
                              .watch(isarNotifierProvider.notifier)
                              .isItemDuplicateInFavorites(
                              widget.productInfo!.id,
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
