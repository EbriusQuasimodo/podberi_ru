import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/shared_widgets/comparison_row_item.dart';
import 'package:podberi_ru/features/web_view_widget.dart';

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
    int comparisonLength = ref.watch(comparisonDebitListLengthStateController);
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
            firstProductDescription:  widget.debitCardsModel[firstPageNum].bankDetails!.bankName,
            secondProductDescription:comparisonLength >1 ? widget.debitCardsModel[secondPageNum].bankDetails!.bankName :'',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Платежная система',
            firstProductDescription:
                widget.debitCardsModel[firstPageNum].paymentSystem,
            secondProductDescription: comparisonLength >1
                ? widget.debitCardsModel[secondPageNum].paymentSystem
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Валюта карты',
            firstProductDescription:
                widget.debitCardsModel[firstPageNum].currencies,
            secondProductDescription: comparisonLength >1
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
            secondProductDescription: comparisonLength >1
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
            secondProductDescription: comparisonLength >1
                ? '${widget.debitCardsModel[secondPageNum].maxCashBack} %'
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
                "${widget.debitCardsModel[firstPageNum].maxCashBack} ${widget.debitCardsModel[firstPageNum].cashbackFormat}",
            secondProductDescription: comparisonLength >1
                ? "${widget.debitCardsModel[secondPageNum].maxCashBack} ${widget.debitCardsModel[secondPageNum].cashbackFormat}"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Начисление бонусов',
            firstProductDescription: widget
                .debitCardsModel[firstPageNum].conditions!.accrualOfBonuses,
            secondProductDescription: comparisonLength >1
                ? widget
                    .debitCardsModel[secondPageNum].conditions!.accrualOfBonuses
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Овердрафт',
            firstProductDescription:
                widget.debitCardsModel[firstPageNum].overdraft ? 'Есть' : 'Нет',
            secondProductDescription: comparisonLength >1
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
            secondProductDescription: comparisonLength >1
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
            secondProductDescription: comparisonLength >1
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
            secondProductDescription: comparisonLength >1
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
            secondProductDescription:comparisonLength >1
                ? "Выпуск ${widget.debitCardsModel[secondPageNum].issue} руб.\nПеревыпуск ${widget.debitCardsModel[secondPageNum].reissue} руб."
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Лимиты на снятие',
            firstProductDescription: widget
                    .debitCardsModel[firstPageNum].conditions?.cashWithdrawal ??
                'Нет информации',
            secondProductDescription: comparisonLength >1
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
                                    .debitCardsModel[secondPageNum].refLink,
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
