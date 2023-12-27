import 'package:flutter/material.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';

import 'row_description_widget.dart';


class CardInfoWidget extends StatelessWidget {
  final ListDebitCardsModel productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  ///виджет с основной информацией о банковском продукте (подробное описание его фукнций и название банка)
  ///используется в [DetailsPage]
  const CardInfoWidget({super.key, required this.productInfo, required this.basicApiPageSettingsModel});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeApp.grey,
                  ),
                  height: 60,
                  margin: const EdgeInsets.only(
                      top: 15, left: 15, right: 6, bottom: 30),
                  padding: const EdgeInsets.only(
                      top: 10.5, bottom: 11.5, right: 8.63, left: 9.16),
                  child: Image.network(
                    '${Urls.api.files}/${basicApiPageSettingsModel.bankDetailsModel?.logo}',
                    height: 37.921,
                    width: 42.208,
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
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeApp.grey,
                      ),
                      height: 60,
                      margin:
                      const EdgeInsets.only(top: 15, right: 15, bottom: 30),
                      padding: const EdgeInsets.only(
                          top: 22, bottom: 21, right: 15, left: 15),
                      child:  Text(
                        basicApiPageSettingsModel.bankDetailsModel!.bankName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ThemeApp.backgroundBlack),
                      )),
                ),
              ],
            ),
             RowDescriptionWidget(
                rowDescription: productInfo.paymentSystem,
                rowName: 'Платежная система'),
             RowDescriptionWidget(
                rowDescription: 'Классическая', rowName: 'Тип карты'),
            RowDescriptionWidget(
                rowDescription: 'Рубль, доллар, евро, +27',
                rowName: 'Валюта карты'),
            RowDescriptionWidget(
                rowDescription: '8 лет', rowName: 'Срок действия'),
           RowDescriptionWidget(
                rowDescription: '1-2 дня', rowName: 'Доставка'),
            RowDescriptionWidget(
                rowDescription: 'Курьером или почтой',
                rowName: 'Способ доставки'),
             RowDescriptionWidget(
                rowDescription: 'Есть, рассчитывается индивидуально',
                rowName: 'Овердрафт'),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 24),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: const Text(
                      'Показать все',
                      style: TextStyle(
                          color: ThemeApp.backgroundBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
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
