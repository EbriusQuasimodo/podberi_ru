import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';

class FavoriteZaimyWidget extends ConsumerStatefulWidget {
  final String productRating;
  final ListZaimyModel? productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final VoidCallback onTap;

  ///кастомный виджет с карточкой банковсвкого продукта
  ///(отличительные особенности - есть кнопки добавить в избранное и сравнение)
  const FavoriteZaimyWidget({
    super.key,
    required this.productRating,
    this.productInfo,
    required this.basicApiPageSettingsModel,
    required this.onTap,
  });

  @override
  ConsumerState<FavoriteZaimyWidget> createState() =>
      _FavoriteZaimyWidget();
}

class _FavoriteZaimyWidget
    extends ConsumerState<FavoriteZaimyWidget> {

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
              height: 50, width: 50,
              padding:
              const EdgeInsets.only(top: 9, right: 7, left: 7, bottom: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ThemeApp.mainWhite,
              ),
              child: Image.network(
                '${Urls.api.files}/${widget.productInfo?.image}',
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
                          bankDetailsModel: BankListDetailsModel(
                              bankName:
                              "bankName",
                              logo: '')));
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
                        ComparisonZaimyData comparisonZaimyData =
                        ComparisonZaimyData()
                          ..id = widget.productInfo?.id;
                        await isar?.writeTxn(() async => await ref
                            .watch(isarNotifierProvider.notifier)
                            .isItemDuplicateInComparison(
                            widget.productInfo!.id,
                            widget.basicApiPageSettingsModel
                                .productTypeUrl!)
                            ? await isar?.comparisonZaimyDatas
                            .filter()
                            .idEqualTo(widget.productInfo?.id)
                            .deleteAll()
                            : await isar?.comparisonZaimyDatas
                            .put(comparisonZaimyData));

                        widget.onTap();
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
                        FavoritesZaimyData favoritesZaimyData =
                        FavoritesZaimyData()
                          ..id = widget.productInfo?.id;
                        await isar?.writeTxn(() async => await ref
                            .watch(isarNotifierProvider.notifier)
                            .isItemDuplicateInFavorites(
                            widget.productInfo!.id,
                            widget.basicApiPageSettingsModel
                                .productTypeUrl!)
                            ? await isar?.favoritesZaimyDatas
                            .filter()
                            .idEqualTo(widget.productInfo?.id)
                            .deleteAll()
                            : await isar?.favoritesZaimyDatas
                            .put(favoritesZaimyData));

                        widget.onTap();
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
