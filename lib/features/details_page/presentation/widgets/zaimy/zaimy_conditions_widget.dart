import 'package:flutter/material.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';

import '../row_description_widget.dart';

class ZaimyConditionsWidget extends StatefulWidget {
  final ListZaimyModel productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///виджет с основной информацией о банковском продукте (подробное описание его фукнций и название банка)
  ///используется в [LoadDetailsPageByProductType]
  const ZaimyConditionsWidget(
      {super.key,
      required this.productInfo,
      required this.basicApiPageSettingsModel});

  @override
  State<ZaimyConditionsWidget> createState() => _ZaimyConditionsWidgetState();
}

class _ZaimyConditionsWidgetState extends State<ZaimyConditionsWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2, bottom: 72),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeApp.grey,
                ),
                width: double.infinity,
                height: 60,
                margin:
                const EdgeInsets.only(top: 15, right: 15,left: 15, bottom: 30),
                padding: const EdgeInsets.only(
                    top: 22, bottom: 21, right: 15, left: 15),
                child: Text(
                  widget.productInfo.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ThemeApp.backgroundBlack),
                )),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: "${widget.productInfo.sum} руб.",
                rowName: 'Сумма займа'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription:
                widget.productInfo.type,
                rowName: 'Тип займа'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription:
                    'от ${widget.productInfo.minTerm} до ${widget.productInfo.maxTerm} ${widget.productInfo.termFormat == 'дни' ? "дн." : "мес."}',
                rowName: 'Срок займа'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription:
                    'от ${widget.productInfo.minPercent} до ${widget.productInfo.maxPercent} %',
                rowName: 'Процентная ставка'),
            RowDescriptionWidget(
                isTextWithHtmlTags: true,
                rowDescription:
                "<a href=\"${widget.productInfo.allConditionsLink}\"rel=\"noopener noreferrer\"target=\"_blank\">${widget.productInfo.allConditionsLink}</a>",
                rowName: 'Ссылка на полные условия'),

            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 10, bottom: 24),
            //     child: Material(
            //       color: Colors.transparent,
            //       child: InkWell(
            //         borderRadius: BorderRadius.circular(12),
            //         onTap: () {},
            //         child: const Text(
            //           'Показать все',
            //           style: TextStyle(
            //               color: ThemeApp.backgroundBlack,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 13),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
