import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/shared_widgets/comparison_row_item.dart';
import 'package:podberi_ru/features/web_view_widget.dart';

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

    for (int i = 0;
        i < widget.creditCardsModel[index].creditRates.length;
        i++) {
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

    int comparisonLength = ref.watch(comparisonCreditListLengthStateController);
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
            firstProductDescription: widget.creditCardsModel[firstPageNum].bankDetails!.bankName,
            secondProductDescription: comparisonLength >1 ?widget.creditCardsModel[secondPageNum].bankDetails!.bankName :'',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Платежная система',
            firstProductDescription:
                widget.creditCardsModel[firstPageNum].paymentSystem,
            secondProductDescription: comparisonLength >1
                ? widget.creditCardsModel[secondPageNum].paymentSystem
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Кредитный лимит',
            firstProductDescription:
                'До ${widget.creditCardsModel[firstPageNum].creditLimit} руб.',
            secondProductDescription: comparisonLength >1
                ? 'До ${widget.creditCardsModel[secondPageNum].creditLimit} руб.'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Кредитная ставка',
            firstProductDescription: creditRates(firstPageNum),
            secondProductDescription: comparisonLength >1
                ? creditRates(secondPageNum)
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Процентная ставка',
            firstProductDescription:
                'От ${widget.creditCardsModel[firstPageNum].minPercent} до ${widget.creditCardsModel[firstPageNum].maxPercent} %',
            secondProductDescription: comparisonLength >1
                ? 'От ${widget.creditCardsModel[secondPageNum].minPercent} до ${widget.creditCardsModel[secondPageNum].maxPercent} %'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Безпроцентный период',
            firstProductDescription:
                "До ${widget.creditCardsModel[firstPageNum].noPercentPeriod} дней",
            secondProductDescription: comparisonLength >1
                ? "До ${widget.creditCardsModel[secondPageNum].noPercentPeriod} дней"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Обслуживание',
            firstProductDescription: widget
                        .creditCardsModel[firstPageNum].maxService !=
                    0
                ? "От ${widget.creditCardsModel[firstPageNum].minService} до ${widget.creditCardsModel[firstPageNum].maxService} рублей в месяц"
                : "Бесплатно",
            secondProductDescription: comparisonLength >1
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
            secondProductDescription: comparisonLength >1
                ? "Выпуск ${widget.creditCardsModel[secondPageNum].issue} руб.\nПеревыпуск ${widget.creditCardsModel[secondPageNum].reissue} руб."
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Снятие наличных',
            firstProductDescription: widget.creditCardsModel[firstPageNum]
                    .conditions?.cashWithdrawal ??
                'Нет информации',
            secondProductDescription: comparisonLength >1
                ? widget.creditCardsModel[secondPageNum].conditions
                        ?.cashWithdrawal ??
                    'Нет информации'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Акции',
            firstProductDescription:
                widget.creditCardsModel[firstPageNum].conditions?.stocks ??
                    'Нет информации',
            secondProductDescription: comparisonLength >1
                ? widget.creditCardsModel[secondPageNum].conditions?.stocks ??
                    'Нет информации'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Дополнительные требования',
            firstProductDescription: widget.creditCardsModel[firstPageNum]
                    .conditions?.addRequirements ??
                'Отсутствуют',
            secondProductDescription: comparisonLength >1
                ? widget.creditCardsModel[secondPageNum].conditions
                        ?.addRequirements ??
                    'Отсутствуют'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Минимальный и максимальный возраст',
            firstProductDescription:
                'От ${widget.creditCardsModel[firstPageNum].minAge} до ${widget.creditCardsModel[firstPageNum].maxAge}',
            secondProductDescription:comparisonLength >1
                ? 'От ${widget.creditCardsModel[secondPageNum].minAge} до ${widget.creditCardsModel[secondPageNum].maxAge}'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Минимальный доход',
            firstProductDescription:
                "${widget.creditCardsModel[firstPageNum].minIncome} руб.",
            secondProductDescription: comparisonLength >1
                ? "${widget.creditCardsModel[secondPageNum].minIncome} руб."
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Стаж работы',
            firstProductDescription:
                widget.creditCardsModel[firstPageNum].workExp,
            secondProductDescription: comparisonLength >1
                ? widget.creditCardsModel[secondPageNum].workExp
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Доставка',
            firstProductDescription:
                widget.creditCardsModel[firstPageNum].delivery ? 'есть' : 'нет',
            secondProductDescription: comparisonLength >1
                ? widget.creditCardsModel[secondPageNum].delivery
                    ? 'есть'
                    : 'нет'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'SMS-уведомления',
            firstProductDescription: widget
                        .creditCardsModel[firstPageNum].maxSms !=
                    0
                ? "от ${widget.creditCardsModel[firstPageNum].minSms} до ${widget.creditCardsModel[firstPageNum].maxSms} руб. в месяц"
                : "Бесплатно",
            secondProductDescription: comparisonLength >1
                ? widget.creditCardsModel[secondPageNum].maxSms != 0
                    ? "от ${widget.creditCardsModel[secondPageNum].minSms} до ${widget.creditCardsModel[secondPageNum].maxSms} руб. в месяц"
                    : "Бесплатно"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Кэшбек',
            firstProductDescription:
                '${widget.creditCardsModel[firstPageNum].maxCashBack} %',
            secondProductDescription: comparisonLength >1
                ? '${widget.creditCardsModel[secondPageNum].maxCashBack} %'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Формат кэшбека',
            firstProductDescription: cashbackFormat(firstPageNum),
            secondProductDescription: comparisonLength >1
                ? cashbackFormat(secondPageNum)
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Максимальный кэшбек',
            firstProductDescription:
                "${widget.creditCardsModel[firstPageNum].maxCashBack} ${widget.creditCardsModel[firstPageNum].cashbackFormat}",
            secondProductDescription: comparisonLength >1
                ? "${widget.creditCardsModel[secondPageNum].maxCashBack} ${widget.creditCardsModel[secondPageNum].cashbackFormat}"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Условия кэшбека',
            firstProductDescription:
                widget.creditCardsModel[firstPageNum].conditions!.cashback,
            secondProductDescription: comparisonLength >1
                ? widget.creditCardsModel[secondPageNum].conditions!.cashback
                : '',
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 3),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return CustomWebViewPage(
                          url: widget.creditCardsModel[firstPageNum].refLink,
                        );
                      }));
                    },
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
              comparisonLength >1
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 3),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return CustomWebViewPage(
                                url: widget
                                    .creditCardsModel[secondPageNum].refLink,
                              );
                            }));
                          },
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
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
