import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';

import '../../../shared_presentation/shared_widgets/row_description_widget.dart';

class CreditCardConditionsWidget extends StatefulWidget {
  final ListCreditCardsModel productInfo;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///виджет с основной информацией о банковском продукте (подробное описание его фукнций и название банка)
  ///используется в [LoadDetailsPageByProductType]
  const CreditCardConditionsWidget(
      {super.key,
      required this.productInfo,
      required this.basicApiPageSettingsModel});

  @override
  State<CreditCardConditionsWidget> createState() => _CreditCardConditionsWidgetState();
}

class _CreditCardConditionsWidgetState extends State<CreditCardConditionsWidget> {
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

  String creditRates() {
    String creditRates = '';

    for (int i = 0; i < widget.productInfo.creditRates.length; i++) {
      creditRates += "${widget.productInfo.creditRates[i]}\n\n";
    }
    creditRates = creditRates.substring(0, creditRates.length - 4);
    return creditRates;
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
                  width: 60,
                  margin: const EdgeInsets.only(
                      top: 15, left: 15, right: 6, bottom: 30),
                  padding: const EdgeInsets.only(
                      top: 10.5, bottom: 11.5, right: 8.63, left: 9.16),
                  child: Image.network(
                    '${Urls.api.files}/${widget.basicApiPageSettingsModel.bankDetailsModel?.logo}',

                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return SvgPicture.asset(
                        'assets/icons/photo_not_found.svg',
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
                rowDescription: 'До ${widget.productInfo.creditLimit} руб.',
                rowName: 'Кредитный лимит'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: creditRates(),
                rowName: 'Кредитная ставка'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription:
                    'От ${widget.productInfo.minPercent} до ${widget.productInfo.maxPercent} %',
                rowName: 'Процентная ставка'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: "До ${widget.productInfo.noPercentPeriod} дней",
                rowName: 'Безпроцентный период'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: widget.productInfo.maxService != 0
                    ? "От ${widget.productInfo.minService} до ${widget.productInfo.maxService} рублей в месяц"
                    : "Бесплатно",
                rowName: 'Обслуживание'),
            RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription:
                    "Выпуск ${widget.productInfo.issue} руб.\nПеревыпуск ${widget.productInfo.reissue} руб.",
                rowName: 'Выпуск и перевыпуск карты'),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: true,
                rowDescription:widget.productInfo.conditions?.cashWithdrawal ?? 'Нет информации',
                rowName: 'Снятие наличных')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: true,
                rowDescription:widget.productInfo.conditions?.stocks ?? 'Нет информации',
                rowName: 'Акции')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: true,
                rowDescription:widget.productInfo.conditions?.addRequirements ?? 'Нет информации',
                rowName: 'Дополнительные требования')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: "От ${widget.productInfo.minAge} до ${widget.productInfo.maxAge}",
                rowName: 'Минимальный и максимальный возраст')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: "${widget.productInfo.minIncome} руб.",
                rowName: 'Минимальный доход')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription: "${widget.productInfo.workExp}",
                rowName: 'Стаж работы')
                : const SizedBox.shrink(),
            showAll
                ?  RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription:
                '${widget.productInfo.delivery ? 'Есть' : 'Нет'}',
                rowName: 'Доставка')
                : const SizedBox.shrink(),
            showAll
                ?  RowDescriptionWidget(
                isTextWithHtmlTags: false,
                rowDescription:widget.productInfo.maxSms !=0?
                "От ${widget.productInfo.minSms} до ${widget.productInfo.maxSms} руб. в месяц" :'Бесплатно',
                rowName: 'SMS-уведомления')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                    isTextWithHtmlTags: false,
                    rowDescription:
                        "${widget.productInfo.maxCashbackPercent} %",
                    rowName: 'Кэшбек')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                    isTextWithHtmlTags: false,
                    rowDescription: cashbackFormat(),
                    rowName: 'Формат кэшбека')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                    isTextWithHtmlTags: false,
                    rowDescription: "${widget.productInfo.maxCashBack} ${widget.productInfo.cashbackFormat}",
                    rowName: 'Максимальный кэшбек')
                : const SizedBox.shrink(),
            showAll
                ? RowDescriptionWidget(
                isTextWithHtmlTags: true,
                rowDescription:widget.productInfo.conditions?.cashback ?? 'Нет информации',
                rowName: 'Условия кэшбека')
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
                    child: Text(
                      showAll ? 'Скрыть' : 'Показать все',
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
