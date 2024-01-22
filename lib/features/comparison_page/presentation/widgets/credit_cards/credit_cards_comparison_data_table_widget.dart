import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/presentation/comparison_page.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_page_controller.dart';

import '../comparison_row_item.dart';

class CreditCardsComparisonDataTableWidget extends ConsumerStatefulWidget {
  final List<ListCreditCardsModel> creditCardsModel;

  ///таблица сравнения двух кредиток, используется в [ComparisonPage]
  const CreditCardsComparisonDataTableWidget({
    super.key,
    required this.creditCardsModel,
  });

  @override
  ConsumerState<CreditCardsComparisonDataTableWidget> createState() =>
      _CreditCardsComparisonDataTableWidgetState();
}

class _CreditCardsComparisonDataTableWidgetState
    extends ConsumerState<CreditCardsComparisonDataTableWidget> {
  String creditRates(int index) {
    String creditRates = '';

    for (int i = 0; i < widget.creditCardsModel[index].creditRates.length; i++) {
      creditRates += "${widget.creditCardsModel[index].creditRates[i]}\n\n";
    }
    creditRates = creditRates.substring(0, creditRates.length - 4);
    return creditRates;
  }
  String cashbackFormat(int index) {
    String cashbackFormat = '';
    switch (widget.creditCardsModel[index].cashbackFormat) {
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
    String firstProductDescription =
    ref.watch(comparisonFirstCreditBankNameStateProvider);
    String secondProductDescription =
    ref.watch(comparisonSecondCreditBankNameStateController);
    int firstPageNum = ref.watch(comparisonFirstCreditPageNumStateProvider);
    int secondPageNum = ref.watch(comparisonSecondCreditPageNumStateController);
    return Container(
      padding: const EdgeInsets.only(top: 43, bottom: 30),
      margin: const EdgeInsets.only(top: 2, bottom: 72),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ThemeApp.mainWhite,
      ),
      child: Column(
        children: [
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Банк',
            firstProductDescription:
            firstProductDescription,
            secondProductDescription:
            secondProductDescription,
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Платежная система',
            firstProductDescription:
            widget.creditCardsModel[firstPageNum].paymentSystem,
            secondProductDescription: secondProductDescription != ''
                ? widget.creditCardsModel[secondPageNum].paymentSystem
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Кредитный лимит',
            firstProductDescription: 'До ${widget.creditCardsModel[firstPageNum].creditLimit} руб.',
            secondProductDescription: secondProductDescription != ''
                ? 'До ${widget.creditCardsModel[secondPageNum].creditLimit} руб.'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Кредитная ставка',
            firstProductDescription: creditRates(firstPageNum),
            secondProductDescription:
            secondProductDescription != '' ? creditRates(secondPageNum) : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Процентная ставка',
            firstProductDescription: 'От ${widget.creditCardsModel[firstPageNum].minPercent} до ${widget.creditCardsModel[firstPageNum].maxPercent} %',
            secondProductDescription:
            secondProductDescription != '' ? 'От ${widget.creditCardsModel[secondPageNum].minPercent} до ${widget.creditCardsModel[secondPageNum].maxPercent} %' : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Безпроцентный период',
            firstProductDescription: "До ${widget.creditCardsModel[firstPageNum].noPercentPeriod} дней",
            secondProductDescription:
            secondProductDescription != '' ? "До ${widget.creditCardsModel[secondPageNum].noPercentPeriod} дней" : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Обслуживание',
            firstProductDescription:
            widget.creditCardsModel[firstPageNum].maxService != 0
                ? "От ${widget.creditCardsModel[firstPageNum].minService} до ${widget.creditCardsModel[firstPageNum].maxService} рублей в месяц"
                : "Бесплатно",
            secondProductDescription: secondProductDescription != ''
                ? widget.creditCardsModel[secondPageNum].maxService != 0
                ? "От ${widget.creditCardsModel[secondPageNum].minService} до ${widget.creditCardsModel[secondPageNum].maxService} рублей в месяц"
                : "Бесплатно"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Выпуск и перевыпуск карты',
            firstProductDescription:
            "Выпуск ${widget.creditCardsModel[firstPageNum].issue} руб.\nПеревыпуск ${widget.creditCardsModel[firstPageNum].reissue} руб.",
            secondProductDescription: secondProductDescription != ''
                ? "Выпуск ${widget.creditCardsModel[secondPageNum].issue} руб.\nПеревыпуск ${widget.creditCardsModel[secondPageNum].reissue} руб."
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Снятие наличных',
            firstProductDescription:widget.creditCardsModel[firstPageNum].conditions?.cashWithdrawal ?? 'Нет информации',
            secondProductDescription: secondProductDescription != ''
                ? widget.creditCardsModel[secondPageNum].conditions?.cashWithdrawal ?? 'Нет информации'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Акции',
            firstProductDescription:
            widget.creditCardsModel[firstPageNum].conditions?.stocks ??'Нет информации',
            secondProductDescription: secondProductDescription != ''
                ?widget.creditCardsModel[secondPageNum].conditions?.stocks ??'Нет информации'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags:true,
            rowName: 'Дополнительные требования',
            firstProductDescription:widget.creditCardsModel[firstPageNum].conditions?.addRequirements ??'Отсутствуют',
            secondProductDescription: secondProductDescription != ''
                ? widget.creditCardsModel[secondPageNum].conditions?.addRequirements ??'Отсутствуют'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Минимальный и максимальный возраст',
            firstProductDescription: 'От ${widget.creditCardsModel[firstPageNum].minAge} до ${widget.creditCardsModel[firstPageNum].maxAge}',
            secondProductDescription: secondProductDescription != ''
                ? 'От ${widget.creditCardsModel[secondPageNum].minAge} до ${widget.creditCardsModel[secondPageNum].maxAge}'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Минимальный доход',
            firstProductDescription: "${widget.creditCardsModel[firstPageNum].minIncome} руб.",
            secondProductDescription:
            secondProductDescription != '' ? "${widget.creditCardsModel[secondPageNum].minIncome} руб." : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Стаж работы',
            firstProductDescription: widget.creditCardsModel[firstPageNum].workExp,
            secondProductDescription: secondProductDescription != ''
                ? widget.creditCardsModel[secondPageNum].workExp
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Доставка',
            firstProductDescription: widget.creditCardsModel[firstPageNum].delivery ? 'есть':'нет',
            secondProductDescription:
            secondProductDescription != '' ?  widget.creditCardsModel[secondPageNum].delivery ? 'есть':'нет' : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'SMS-уведомления',
            firstProductDescription: widget.creditCardsModel[firstPageNum]
                .maxSms != 0 ? "от ${widget.creditCardsModel[firstPageNum]
                .minSms} до ${widget.creditCardsModel[firstPageNum]
                .maxSms} руб. в месяц" : "Бесплатно",
            secondProductDescription: secondProductDescription != ''
                ? widget.creditCardsModel[secondPageNum]
                .maxSms != 0 ? "от ${widget.creditCardsModel[secondPageNum]
                .minSms} до ${widget.creditCardsModel[secondPageNum]
                .maxSms} руб. в месяц" : "Бесплатно"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Кэшбек',
            firstProductDescription:
            '${widget.creditCardsModel[firstPageNum].maxCashBack} %',
            secondProductDescription: secondProductDescription != '' ? '${widget
                .creditCardsModel[secondPageNum].maxCashBack} %' : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Формат кэшбека',
            firstProductDescription:
            cashbackFormat(firstPageNum),
            secondProductDescription: secondProductDescription != '' ? cashbackFormat(secondPageNum) : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Максимальный кэшбек',
            firstProductDescription:
            "${widget.creditCardsModel[firstPageNum].maxCashBack} ${widget
                .creditCardsModel[firstPageNum].cashbackFormat}",
            secondProductDescription: secondProductDescription != ''
                ? "${widget.creditCardsModel[secondPageNum]
                .maxCashBack} ${widget.creditCardsModel[secondPageNum]
                .cashbackFormat}"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Условия кэшбека',
            firstProductDescription:
            widget.creditCardsModel[firstPageNum].conditions!.cashback,
            secondProductDescription: secondProductDescription != ''
                ? widget.creditCardsModel[secondPageNum].conditions!.cashback
                : '',
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 3),
                  child: MaterialButton(
                    onPressed: () {},
                    color: ThemeApp.mainBlue,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      'Оформить',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ThemeApp.mainWhite),
                    ),
                  ),
                ),
              ),
              secondProductDescription != ''
                  ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, left: 3),
                  child: MaterialButton(
                    onPressed: () {},
                    height: 50,
                    color: ThemeApp.mainBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      'Оформить',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ThemeApp.mainWhite),
                    ),
                  ),
                ),
              )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
