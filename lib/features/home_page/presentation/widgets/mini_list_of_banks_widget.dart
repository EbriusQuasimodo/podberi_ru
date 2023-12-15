import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_page.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';


class MiniListOfBanksWidget extends ConsumerStatefulWidget {
  final List<BankDetailsModel> banksModel;
  ///mini list of banks on card tap go to [CatalogPage] on showAllBanks tap go to [AllBanksPage]
  const MiniListOfBanksWidget({super.key, required this.banksModel});

  @override
  ConsumerState<MiniListOfBanksWidget> createState() =>
      _MiniListOfBanksWidgetState();
}

class _MiniListOfBanksWidgetState extends ConsumerState<MiniListOfBanksWidget> {
  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 12)
    ]; //sized box is a padding on start
    for (int i = 0; i < 6; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.only(right: 3, left: 3),
          child: MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              ref
                  .watch(productTypeUrlFromHomeBanksStateProvider.notifier)
                  .state = 'debit_cards';

              ref.watch(goRouterProvider).push(
                    RouteConstants.catalog,
                    extra: BasicApiPageSettingsModel(
                      bankDetailsModel: BankDetailsModel(picture:  widget.banksModel[i].picture, bankName:  widget.banksModel[i].bankName),
                      productTypeUrl: ProductTypeEnum.debit_cards.name,
                      pageName: 'Каталог',
                      whereFrom: 'homePageBanks',
                      filtersModel: FiltersModel(
                        banks: [widget.banksModel[i].bankName],
                        paySystem: [],
                        cashBack: [],
                      ),
                    ),
                  );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: const Color(0xffFFBE0B),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 29.64, right: 39.58, left: 39, bottom: 30.77),
                  child: Image.network(
                    '${Urls.api.files}/${widget.banksModel[i].picture}',
                    height: 51,
                    width: 57,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Icon(
                        Icons.error,
                        size: 51,
                        color: ThemeApp.backgroundBlack,
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 12, left: 12, bottom: 16),
                  child: Text(
                    widget.banksModel[i].bankName,
                    maxLines: 3,
                    style: const TextStyle(
                        color: ThemeApp.mainWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    list.add(const SizedBox(
      width: 12,
    )); //add padding on end

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        padding: const EdgeInsets.only(top: 30, bottom: 21),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 22,
              ),
              child: Text(
                'Выберите банк',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: list(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 22,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    ref.watch(goRouterProvider).go(RouteConstants.allBanks);
                  },
                  child: const Text(
                    'Все банки',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
