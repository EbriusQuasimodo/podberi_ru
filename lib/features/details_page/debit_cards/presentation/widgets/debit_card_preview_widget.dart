import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/details_page/debit_cards/presentation/debit_cards_details_page.dart';
import 'package:podberi_ru/features/favorites_page/debit_cards/presentation/favorites_debit_cards_controller.dart';
import 'package:podberi_ru/features/web_view_widget.dart';

class DebitCardPreviewWidget extends ConsumerStatefulWidget {
  final ListDebitCardsModel productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///виджет с превью дебетовки (фото, название, кнопка Заказать), используется в [DebitCardsDetailsPage]
  const DebitCardPreviewWidget({
    super.key,
    required this.productInfo,
    required this.basicApiPageSettingsModel,
  });

  @override
  ConsumerState<DebitCardPreviewWidget> createState() =>
      _DebitCardPreviewWidgetState();
}

class _DebitCardPreviewWidgetState
    extends ConsumerState<DebitCardPreviewWidget> {
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
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
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
                        'Заказать карту',
                        style: TextStyle(
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
                      ///добавление или удаление из избранного
                      FavoritesDebitCardsData favoritesDebitCardsData =
                          FavoritesDebitCardsData()..id = widget.productInfo.id;

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
ref.invalidate(favoritesDebitCardsListControllerProvider);
                      setState(() {});
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
                        ///добавление или удаление из сравнения
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

                        ref.invalidate(comparisonDebitCardsListControllerProvider);
                        setState(() {});
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
