import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/details_page/presentation/widgets/row_description_widget.dart';

class TariffsRkoWidget extends StatelessWidget {
  final ListDebitCardsModel productInfo;

  const TariffsRkoWidget({
    super.key,
    required this.productInfo,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        margin: const EdgeInsets.only(top: 2),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Text(
                'Тарифы',
                style: TextStyle(
                    color: ThemeApp.backgroundBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
            RowDescriptionWidget(
                rowDescription: productInfo.paymentSystem,
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
