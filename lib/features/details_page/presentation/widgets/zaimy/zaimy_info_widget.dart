import 'package:flutter/material.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';

import '../row_description_widget.dart';


class ZaimyInfoWidget extends StatelessWidget {
  final ListZaimyModel productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;
  ///виджет с основной информацией о банковском продукте (подробное описание его фукнций и название банка)
  ///используется в [LoadDetailsPageByProductType]
  const ZaimyInfoWidget({super.key, required this.productInfo, required this.basicApiPageSettingsModel});

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
             RowDescriptionWidget(
                rowDescription: productInfo.sum.toString(), rowName: 'Макс. сумма займа'),
           ///todo: возможно потом надо бдует сделать проверку срока займа (в днях, месяцах или годах)
            RowDescriptionWidget(
                rowDescription: 'до ${productInfo.maxTerm} дней',
                rowName: 'Срок займа'),
            RowDescriptionWidget(
                rowDescription: 'от ${productInfo.minPercent} до ${productInfo.maxPercent}', rowName: 'Проценты'),
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
