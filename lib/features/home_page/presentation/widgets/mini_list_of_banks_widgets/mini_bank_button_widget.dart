import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/core/domain/product_type_enum.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

class MiniBankButtonWidget extends ConsumerWidget {
  final BankListDetailsModel banksModel;
  const MiniBankButtonWidget({super.key, required this.banksModel,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(right: 3, left: 3),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          ref
              .watch(productTypeUrlFromHomeBanksStateProvider.notifier)
              .state = 'debit_cards';

          ref.watch(goRouterProvider).push(
            RouteConstants.catalog,
            extra: BasicApiPageSettingsModel(
              page: 1,
              bankDetailsModel: BankListDetailsModel(
                  logo: banksModel.logo,
                  bankName: banksModel.bankName),
              productTypeUrl: ProductTypeEnum.debit_cards.name,
              pageName: 'Каталог',
              whereFrom: 'homePageBanks',

                filters: FiltersModel(banks: [banksModel.bankName]),

            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color(int.parse(
            '0xff${banksModel.color}')),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 29.64, right: 39.58, left: 39, bottom: 30.77),
              child: Container(
                height: 50, width: 50,
                padding:
                const EdgeInsets.only(top: 9, right: 7, left: 7, bottom: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ThemeApp.mainWhite,
                ),
                child: Image.network(
                  '${Urls.api.files}/${banksModel.icon}',
                  height: 51,
                  width: 57,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return SvgPicture.asset(
                      'assets/icons/photo_not_found.svg',
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 12, left: 12, bottom: 16),
              child: Text(
               banksModel.bankName,
                maxLines: 1,
                style: const TextStyle(
                    color: ThemeApp.mainWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
