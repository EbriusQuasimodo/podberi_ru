import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/utils/favorites/rko/favorites_rko_data.dart';
import 'package:podberi_ru/core/utils/isar_controller.dart';
import 'package:podberi_ru/features/favorites_page/rko/presentation/favorites_rko_controller.dart';

class RkoWidgetWithButtons extends ConsumerStatefulWidget {
  final String productRating;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  final ListRkoModel productInfo;

  ///кастомный виджет с карточкой банковсвкого продукта
  ///(отличительные особенности - есть кнопки добавить в избранное и сравнение)
  RkoWidgetWithButtons({
    super.key,
    required this.productRating,
    required this.basicApiPageSettingsModel,
    required this.productInfo,
  });

  @override
  ConsumerState<RkoWidgetWithButtons> createState() =>
      _RkoWidgetWithButtonsState();
}

class _RkoWidgetWithButtonsState extends ConsumerState<RkoWidgetWithButtons> {
  List<Widget> list() {
    var list = <Widget>[];
    for (int i = 0; i < widget.productInfo.rates!.length; i++) {
      if (widget.productInfo.rates?[i].main) {
        list.add(
          Text(
            "Обслуживание: ${widget.productInfo.rates?[0].service1Month} руб.",
            style: TextStyle(
                color: ThemeApp.mainWhite,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
        );
      }
    }
    if(widget.productInfo.features.isNotEmpty){
    for (int i = 0;
        widget.productInfo.features.length <= 3
            ? i < widget.productInfo.features.length
            : i < 3;
        i++) {
      list.add(
        Text(
          widget.productInfo.features[i],
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: ThemeApp.mainWhite,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      );
    }}

    return list;
  }

  final isar = Isar.getInstance();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(int.parse(
            '0xff${widget.productInfo.bankDetails?.color}')), //int.parse('0xff${productInfo?.bankDetails?.color}')
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
              height: 50,
              width: 50,
              padding:
                  const EdgeInsets.only(top: 9, right: 7, left: 7, bottom: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ThemeApp.mainWhite,
              ),
              child: Image.network(
                '${Urls.api.files}/${widget.productInfo.bankDetails?.icon}',
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
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
              "Счет для бизнеса в ${widget.productInfo.bankDetails?.bankName}",
              maxLines: 3,
              style: const TextStyle(
                  color: ThemeApp.mainWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
         Positioned(
                  left: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list(),
                  ),
                ),


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
                          filters: FiltersModel(),
                          page: 1,
                          productTypeUrl:
                              widget.basicApiPageSettingsModel.productTypeUrl,
                          pageName: widget.basicApiPageSettingsModel.pageName,
                          productId: widget.productInfo.id,
                          bankDetailsModel: BankListDetailsModel(
                              bankName:
                                  widget.productInfo.bankDetails!.bankName,
                              icon: widget.productInfo.bankDetails!.icon)));
                },
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () async {
                    FavoritesRkoData favoritesRkoData = FavoritesRkoData()
                      ..id = widget.productInfo.id;
                    await isar?.writeTxn(() async => await ref
                            .watch(isarNotifierProvider.notifier)
                            .isItemDuplicateInFavorites(
                                widget.productInfo.id,
                                widget
                                    .basicApiPageSettingsModel.productTypeUrl!)
                        ? await isar?.favoritesRkoDatas
                            .filter()
                            .idEqualTo(widget.productInfo.id)
                            .deleteAll()
                        : await isar?.favoritesRkoDatas.put(favoritesRkoData));
                    ref
                        .watch(favoritesRkoListStateProvider.notifier)
                        .state
                        .clear();
                    ref.invalidate(favoritesRkoListControllerProvider);

                    setState(() {});
                  },
                  child: FutureBuilder(
                      future: ref
                          .watch(isarNotifierProvider.notifier)
                          .isItemDuplicateInFavorites(widget.productInfo!.id,
                              widget.basicApiPageSettingsModel.productTypeUrl!),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
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
          ),
        ],
      ),
    );
  }
}
