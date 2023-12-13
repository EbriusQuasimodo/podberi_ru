import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';

class AllBanksListWidget extends ConsumerWidget {
  final List<BankDetailsModel> allBanks;

  const AllBanksListWidget({
    super.key,
    required this.allBanks,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///todo: maybe change to sliver stack + sliver container
    return SliverContainer(
      margin: const EdgeInsets.only(top: 2, bottom: 72),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
      ),
      sliver: SliverPadding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 9),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  ref.watch(bankNameFromAllBanksStateProvider.notifier).state =
                      allBanks[index].bankName;
                  ref.watch(bankPictureFromAllBanksStateProvider.notifier).state =
                      allBanks[index].picture;
                  ref
                      .watch(goRouterProvider)
                      .push(RouteConstants.catalog, extra: FiltersModel(productType: AppRoute.allBanksPage.name, banks: [], paySystem: [], cashBack: []));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, bottom: 15, right: 20),
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFBE0B),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 9, right: 7, left: 7, bottom: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ThemeApp.mainWhite,
                        ),
                        child: Image.network(
                          '${Urls.api.files}/${allBanks[index].picture}',
                          height: 32,
                          width: 36,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        allBanks[index].bankName,
                        style: TextStyle(
                            color: ThemeApp.mainWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        color: ThemeApp.mainWhite,
                        size: 20,
                      ),
                      const Text(
                        '4.8',
                        style: TextStyle(
                            color: ThemeApp.mainWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
