import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

import 'row_description_widget.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

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
                  child: SvgPicture.asset(
                    'assets/icons/tinkoff_logo_icon.svg',
                    height: 37.921,
                    width: 42.208,
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
                      child: const Text(
                        'Тинькофф Банк',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ThemeApp.backgroundBlack),
                      )),
                ),
              ],
            ),
            const RowDescriptionWidget(
                rowDescription: 'Мир, MasterCard',
                rowName: 'Платежная система'),
            const RowDescriptionWidget(
                rowDescription: 'Классическая', rowName: 'Тип карты'),
            const RowDescriptionWidget(
                rowDescription: 'Рубль, доллар, евро, +27',
                rowName: 'Валюта карты'),
            const RowDescriptionWidget(
                rowDescription: '8 лет', rowName: 'Срок действия'),
            const RowDescriptionWidget(
                rowDescription: '1-2 дня', rowName: 'Доставка'),
            const RowDescriptionWidget(
                rowDescription: 'Курьером или почтой',
                rowName: 'Способ доставки'),
            const RowDescriptionWidget(
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
