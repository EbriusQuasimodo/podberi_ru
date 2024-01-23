import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/presentation/comparison_page.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_page_controller.dart';
import 'package:podberi_ru/features/web_view_widget.dart';

import '../comparison_row_item.dart';

class DebitCardsComparisonDataTableWidget extends ConsumerStatefulWidget {
  final List<ListDebitCardsModel> debitCardsModel;

  ///таблица сравнения двух кредиток, используется в [ComparisonPage]
  const DebitCardsComparisonDataTableWidget({
    super.key,
    required this.debitCardsModel,
  });

  @override
  ConsumerState<DebitCardsComparisonDataTableWidget> createState() =>
      _DebitCardsComparisonDataTableWidgetState();
}

class _DebitCardsComparisonDataTableWidgetState
    extends ConsumerState<DebitCardsComparisonDataTableWidget> {
  String cashbackFormat(int index) {
    String cashbackFormat = '';
    switch (widget.debitCardsModel[index].cashbackFormat) {
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
        ref.watch(comparisonFirstDebitBankNameStateProvider);
    String secondProductDescription =
        ref.watch(comparisonSecondDebitBankNameStateController);
    int firstPageNum = ref.watch(comparisonFirstDebitPageNumStateProvider);
    int secondPageNum = ref.watch(comparisonSecondDebitPageNumStateController);
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
            firstProductDescription: firstProductDescription,
            secondProductDescription: secondProductDescription,
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Платежная система',
            firstProductDescription:
                widget.debitCardsModel[firstPageNum].paymentSystem,
            secondProductDescription: secondProductDescription != ''
                ? widget.debitCardsModel[secondPageNum].paymentSystem
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Валюта карты',
            firstProductDescription:
                widget.debitCardsModel[firstPageNum].currencies,
            secondProductDescription: secondProductDescription != ''
                ? widget.debitCardsModel[secondPageNum].currencies
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Обслуживание',
            firstProductDescription: widget
                        .debitCardsModel[firstPageNum].maxService !=
                    0
                ? "От ${widget.debitCardsModel[firstPageNum].minService} до ${widget.debitCardsModel[firstPageNum].maxService} рублей в месяц"
                : "Бесплатно",
            secondProductDescription: secondProductDescription != ''
                ? widget.debitCardsModel[secondPageNum].maxService != 0
                    ? "От ${widget.debitCardsModel[secondPageNum].minService} до ${widget.debitCardsModel[secondPageNum].maxService} рублей в месяц"
                    : "Бесплатно"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Кэшбек',
            firstProductDescription:
                '${widget.debitCardsModel[firstPageNum].maxCashBack} %',
            secondProductDescription: secondProductDescription != ''
                ? '${widget.debitCardsModel[secondPageNum].maxCashBack} %'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Формат кэшбека',
            firstProductDescription: cashbackFormat(firstPageNum),
            secondProductDescription: secondProductDescription != ''
                ? cashbackFormat(secondPageNum)
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Максимальный кэшбек',
            firstProductDescription:
                "${widget.debitCardsModel[firstPageNum].maxCashBack} ${widget.debitCardsModel[firstPageNum].cashbackFormat}",
            secondProductDescription: secondProductDescription != ''
                ? "${widget.debitCardsModel[secondPageNum].maxCashBack} ${widget.debitCardsModel[secondPageNum].cashbackFormat}"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Начисление бонусов',
            firstProductDescription: widget
                .debitCardsModel[firstPageNum].conditions!.accrualOfBonuses,
            secondProductDescription: secondProductDescription != ''
                ? widget
                    .debitCardsModel[secondPageNum].conditions!.accrualOfBonuses
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Овердрафт',
            firstProductDescription:
                widget.debitCardsModel[firstPageNum].overdraft ? 'Есть' : 'Нет',
            secondProductDescription: secondProductDescription != ''
                ? widget.debitCardsModel[secondPageNum].overdraft
                    ? 'Есть'
                    : 'Нет'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Доставка',
            firstProductDescription:
                widget.debitCardsModel[firstPageNum].delivery ? 'есть' : 'нет',
            secondProductDescription: secondProductDescription != ''
                ? widget.debitCardsModel[secondPageNum].delivery
                    ? 'есть'
                    : 'нет'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Акции и скидки',
            firstProductDescription:
                widget.debitCardsModel[firstPageNum].conditions?.stocks ??
                    'Нет информации',
            secondProductDescription: secondProductDescription != ''
                ? widget.debitCardsModel[secondPageNum].conditions?.stocks ??
                    'Нет информации'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'SMS-уведомления',
            firstProductDescription: widget
                        .debitCardsModel[firstPageNum].maxSms !=
                    0
                ? "от ${widget.debitCardsModel[firstPageNum].minSms} до ${widget.debitCardsModel[firstPageNum].maxSms} руб. в месяц"
                : "Бесплатно",
            secondProductDescription: secondProductDescription != ''
                ? widget.debitCardsModel[secondPageNum].maxSms != 0
                    ? "от ${widget.debitCardsModel[secondPageNum].minSms} до ${widget.debitCardsModel[secondPageNum].maxSms} руб. в месяц"
                    : "Бесплатно"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Выпуск и перевыпуск карты',
            firstProductDescription:
                "Выпуск ${widget.debitCardsModel[firstPageNum].issue} руб.\nПеревыпуск ${widget.debitCardsModel[firstPageNum].reissue} руб.",
            secondProductDescription: secondProductDescription != ''
                ? "Выпуск ${widget.debitCardsModel[secondPageNum].issue} руб.\nПеревыпуск ${widget.debitCardsModel[secondPageNum].reissue} руб."
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Лимиты на снятие',
            firstProductDescription: widget
                    .debitCardsModel[firstPageNum].conditions?.cashWithdrawal ??
                'Нет информации',
            secondProductDescription: secondProductDescription != ''
                ? widget.debitCardsModel[secondPageNum].conditions
                        ?.cashWithdrawal ??
                    'Нет информации'
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
                              url: widget.debitCardsModel[firstPageNum].refLink,
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
              secondProductDescription != ''
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 3),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return CustomWebViewPage(
                                    url: widget.debitCardsModel[secondPageNum].refLink,
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
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
