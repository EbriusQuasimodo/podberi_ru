import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';

import '../row_description_widget.dart';

class DebitCardConditionsWidget extends StatefulWidget {
  final ListDebitCardsModel productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///виджет с основной информацией о банковском продукте (подробное описание его фукнций и название банка)
  ///используется в [LoadDetailsPageByProductType]
  const DebitCardConditionsWidget(
      {super.key,
      required this.productInfo,
      required this.basicApiPageSettingsModel});

  @override
  State<DebitCardConditionsWidget> createState() => _DebitCardConditionsWidgetState();
}

class _DebitCardConditionsWidgetState extends State<DebitCardConditionsWidget> {
  bool showAll = false;

  String cashbackFormat() {
    String cashbackFormat = '';
    switch (widget.productInfo.cashbackFormat) {
      case 'рублей':
        cashbackFormat = 'Рубли';
      case 'миль':
        cashbackFormat = 'Мили';
      case 'баллов':
        cashbackFormat = 'Баллы';
    }
    return cashbackFormat;
  }

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
                    '${Urls.api.files}/${widget.basicApiPageSettingsModel.bankDetailsModel?.logo}',
                    height: 37.921,
                    width: 42.208,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return SvgPicture.asset(
                        'assets/icons/image_not_found_icon.svg',
                        color: ThemeApp.darkestGrey,
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
                      child: Text(
                        widget.basicApiPageSettingsModel.bankDetailsModel!
                            .bankName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ThemeApp.backgroundBlack),
                      )),
                ),
              ],
            ),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: widget.productInfo.paymentSystem,
                rowName: 'Платежная система'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: widget.productInfo.currencies,
                rowName: 'Валюта карты'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription:
                widget.productInfo.maxService != 0 ?"${widget.productInfo.minService}-${widget.productInfo.maxService} рублей в месяц" : "Бесплатно",
                rowName: 'Обслуживание'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: "${widget.productInfo.maxCashbackPercent} %",
                rowName: 'Кэшбек'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: "${cashbackFormat()}",
                rowName: 'Формат кэшбека'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription:
                    "${widget.productInfo.maxCashBack} ${widget.productInfo.cashbackFormat}",
                rowName: 'Максимальный кэшбек'),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: true,
                rowDescription:
                widget.productInfo.conditions?.accrualOfBonuses ?? 'нет информации',
                rowName: 'Начисление бонусов')
                : const SizedBox.shrink(),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: widget.productInfo.overdraft ? 'есть' : 'нет',
                rowName: 'Овердрафт'),
            showAll
                ? RowDescriptionWidget(
                    isTextWithHtmlTags: false,
                    rowDescription:
                        '${widget.productInfo.delivery ? 'есть' : 'нет'}',
                    rowName: 'Доставка')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                    isTextWithHtmlTags: true,
                    rowDescription:
                        widget.productInfo.conditions?.stocks ?? 'нет',
                    rowName: 'Акции и скидки')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                    isTextWithHtmlTags: false,
                    rowDescription:
                        "${widget.productInfo.minSms}-${widget.productInfo.maxSms} руб. в месяц",
                    rowName: 'SMS-уведомления')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription:
                "Выпуск ${widget.productInfo.issue} руб.\nПеревыпуск ${widget.productInfo.reissue} руб.",
                rowName: 'Выпуск и перевыпуск карты')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: true,
                rowDescription:
                widget.productInfo.conditions?.cashWithdrawal ?? 'нет информации',
                rowName: 'Лимиты на снятие')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: true,
                rowDescription:
                "<a href=\"${widget.productInfo.allConditionsLink}\"rel=\"noopener noreferrer\"target=\"_blank\">${widget.productInfo.allConditionsLink}</a>",
                rowName: 'Ссылка на полные условия')
                : const SizedBox.shrink(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 24),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        showAll = !showAll;
                      });
                    },
                    child:  Text(
                      showAll ? 'Скрыть':'Показать все',
                      style: const TextStyle(
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
