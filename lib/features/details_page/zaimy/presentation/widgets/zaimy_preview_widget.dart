import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/comparison_page/zaimy/presentation/comparison_zaimy_controller.dart';
import 'package:podberi_ru/features/details_page/zaimy/presentation/zaimy_details_page.dart';
import 'package:podberi_ru/features/favorites_page/zaimy/presentation/favorites_zaimy_controller.dart';
import 'package:podberi_ru/features/web_view_widget.dart';

class ZaimyPreviewWidget extends ConsumerStatefulWidget {
  final ListZaimyModel productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///виджет с превью займа (фото, название, кнопка Заказать), используется в [ZaimyDetailsPage]
  const ZaimyPreviewWidget({
    super.key,
    required this.productInfo,
    required this.basicApiPageSettingsModel,
  });

  @override
  ConsumerState<ZaimyPreviewWidget> createState() => _ZaimyPreviewWidgetState();
}

class _ZaimyPreviewWidgetState extends ConsumerState<ZaimyPreviewWidget> {
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
              padding: const EdgeInsets.only(bottom: 40, left: 15, right: 15),
              child: Text(
                '${widget.basicApiPageSettingsModel.bankDetailsModel?.bankName} ${widget.productInfo.name}',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 15, right: 15),
              child: Image.network(
                '${Urls.api.files}/${widget.productInfo.image}',
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return SvgPicture.asset(
                    'assets/icons/photo_not_found.svg',
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6, left: 15),
                    child: MaterialButton(
                      height: 50,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return CustomWebViewPage(
                            url: widget.productInfo.refLink,
                          );
                        }));
                      },
                      color: ThemeApp.mainBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: const Text(
                        'Оформить',
                        style: TextStyle(
                            color: ThemeApp.mainWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50, width: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(14),
                    color: ThemeApp.grey,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        ///добавление или удаление из избранного
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

                        ref.invalidate(favoritesZaimyListControllerProvider);
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
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
                ),
                Container(
                  height: 50, width: 50,
                  margin: const EdgeInsets.only(left: 6, right: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(14),
                    color: ThemeApp.grey,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        ///добавление или удаление из сравнения
                        ComparisonZaimyData comparisonZaimyData =
                            ComparisonZaimyData()..id = widget.productInfo.id;
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

                        ref.invalidate(comparisonZaimyListControllerProvider);
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
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
                              height: MediaQuery.of(context).size.height - 72,
                            );
                          },
                        ),
                      ),
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
