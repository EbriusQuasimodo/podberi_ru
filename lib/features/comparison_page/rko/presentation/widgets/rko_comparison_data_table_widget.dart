import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/shared_widgets/comparison_row_item.dart';
import 'package:podberi_ru/features/web_view_widget.dart';

class RkoComparisonDataTableWidget extends ConsumerStatefulWidget {
  final List<ListRkoModel> rkoModel;

  ///таблица сравнения двух кредиток, используется в [ComparisonPage]
  const RkoComparisonDataTableWidget({
    super.key,
    required this.rkoModel,
  });

  @override
  ConsumerState<RkoComparisonDataTableWidget> createState() =>
      _RkoComparisonDataTableWidgetState();
}

class _RkoComparisonDataTableWidgetState
    extends ConsumerState<RkoComparisonDataTableWidget> {
  @override
  Widget build(BuildContext context) {
    int comparisonLength = ref.watch(comparisonRkoListLengthStateController);
    int firstPageNum = ref.watch(comparisonFirstRkoPageNumStateProvider);
    int secondPageNum = ref.watch(comparisonSecondRkoPageNumStateProvider);
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
                widget.rkoModel[firstPageNum].bankDetails!.bankName,
            secondProductDescription: comparisonLength > 1
                ? widget.rkoModel[secondPageNum].bankDetails!.bankName
                : '',
          ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: false,
          //   rowName: 'Обслуживание',
          //   firstProductDescription:
          //       widget.rkoModel[firstPageNum].paymentSystem,
          //   secondProductDescription: comparisonLength > 1
          //       ? widget.rkoModel[secondPageNum].paymentSystem
          //       : '',
          // ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: false,
          //   rowName: 'Бесплатные переводы юрлицам',
          //   firstProductDescription: widget.rkoModel[firstPageNum].currencies,
          //   secondProductDescription: comparisonLength > 1
          //       ? widget.rkoModel[secondPageNum].currencies
          //       : '',
          // ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: false,
          //   rowName: 'Стоимость перевода юрлицам',
          //   firstProductDescription: widget.rkoModel[firstPageNum].maxService !=
          //           0
          //       ? "От ${widget.rkoModel[firstPageNum].minService} до ${widget.rkoModel[firstPageNum].maxService} рублей в месяц"
          //       : "Бесплатно",
          //   secondProductDescription: comparisonLength > 1
          //       ? widget.rkoModel[secondPageNum].maxService != 0
          //           ? "От ${widget.rkoModel[secondPageNum].minService} до ${widget.rkoModel[secondPageNum].maxService} рублей в месяц"
          //           : "Бесплатно"
          //       : '',
          // ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Для ИП',
            firstProductDescription:
            widget.rkoModel[firstPageNum].forIp ? "Да" : "Нет",
            secondProductDescription: comparisonLength > 1
                ?  widget.rkoModel[secondPageNum].forIp ? "Да" : "Нет"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Для ООО',
            firstProductDescription: widget.rkoModel[firstPageNum].forOoo ? "Да" : "Нет",
            secondProductDescription:
                comparisonLength > 1 ?  widget.rkoModel[secondPageNum].forOoo ? "Да" : "Нет" : '',
          ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: false,
          //   rowName: 'Акции и спецпредложения',
          //   firstProductDescription:
          //       "${widget.rkoModel[firstPageNum].maxCashBack} ${widget.rkoModel[firstPageNum].cashbackFormat}",
          //   secondProductDescription: comparisonLength > 1
          //       ? "${widget.rkoModel[secondPageNum].maxCashBack} ${widget.rkoModel[secondPageNum].cashbackFormat}"
          //       : '',
          // ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Эквайринг',
            firstProductDescription:
                "от ${widget.rkoModel[firstPageNum].minEq} %",
            secondProductDescription: comparisonLength > 1
                ? "от ${widget.rkoModel[secondPageNum].minEq} %"
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Открытие без личной встречи',
            firstProductDescription:
                widget.rkoModel[firstPageNum].openingOnline ? 'Да' : 'Нет',
            secondProductDescription: comparisonLength > 1
                ? widget.rkoModel[secondPageNum].openingOnline
                    ? 'Да'
                    : 'Нет'
                : '',
          ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: false,
          //   rowName: 'Овернайт',
          //   firstProductDescription:
          //       widget.rkoModel[firstPageNum].delivery ? 'есть' : 'нет',
          //   secondProductDescription: comparisonLength >1
          //       ? widget.rkoModel[secondPageNum].delivery
          //           ? 'есть'
          //           : 'нет'
          //       : '',
          // ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: true,
            rowName: 'Стоимость открытия',
            firstProductDescription:
                "${widget.rkoModel[firstPageNum].priceOpen}",
            secondProductDescription: comparisonLength > 1
                ? "${widget.rkoModel[secondPageNum].priceOpen}"
                : '',
          ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: false,
          //   rowName: 'Скорость открытия',
          //   firstProductDescription: widget
          //               .rkoModel[firstPageNum].maxSms !=
          //           0
          //       ? "от ${widget.rkoModel[firstPageNum].minSms} до ${widget.rkoModel[firstPageNum].maxSms} руб. в месяц"
          //       : "Бесплатно",
          //   secondProductDescription: comparisonLength >1
          //       ? widget.rkoModel[secondPageNum].maxSms != 0
          //           ? "от ${widget.rkoModel[secondPageNum].minSms} до ${widget.rkoModel[secondPageNum].maxSms} руб. в месяц"
          //           : "Бесплатно"
          //       : '',
          // ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: false,
          //   rowName: 'Переводы физлицам',
          //   firstProductDescription:
          //       "Выпуск ${widget.rkoModel[firstPageNum].issue} руб.\nПеревыпуск ${widget.rkoModel[firstPageNum].reissue} руб.",
          //   secondProductDescription:comparisonLength >1
          //       ? "Выпуск ${widget.rkoModel[secondPageNum].issue} руб.\nПеревыпуск ${widget.rkoModel[secondPageNum].reissue} руб."
          //       : '',
          // ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: true,
          //   rowName: 'Снятие наличных',
          //   firstProductDescription: widget
          //           .rkoModel[firstPageNum].conditions?.cashWithdrawal ??
          //       'Нет информации',
          //   secondProductDescription: comparisonLength >1
          //       ? widget.rkoModel[secondPageNum].conditions
          //               ?.cashWithdrawal ??
          //           'Нет информации'
          //       : '',
          // ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: true,
          //   rowName: 'Внесение наличных',
          //   firstProductDescription: widget
          //       .rkoModel[firstPageNum].conditions?.cashWithdrawal ??
          //       'Нет информации',
          //   secondProductDescription: comparisonLength >1
          //       ? widget.rkoModel[secondPageNum].conditions
          //       ?.cashWithdrawal ??
          //       'Нет информации'
          //       : '',
          // ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Операционный день',
            firstProductDescription:
                'с ${widget.rkoModel[firstPageNum].operDayHere?.from} до ${widget.rkoModel[firstPageNum].operDayHere?.to} в этом банке \nс ${widget.rkoModel[firstPageNum].operDayThere?.from} до ${widget.rkoModel[firstPageNum].operDayThere?.to} в других банках',
            secondProductDescription: comparisonLength > 1
                ? 'с ${widget.rkoModel[secondPageNum].operDayHere?.from} до ${widget.rkoModel[secondPageNum].operDayHere?.to} в этом банке \nс ${widget.rkoModel[secondPageNum].operDayThere?.from} до ${widget.rkoModel[secondPageNum].operDayThere?.to} в других банках'
                : '',
          ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: true,
          //   rowName: 'Депозиты',
          //   firstProductDescription: widget
          //       .rkoModel[firstPageNum].conditions?.cashWithdrawal ??
          //       'Нет информации',
          //   secondProductDescription: comparisonLength >1
          //       ? widget.rkoModel[secondPageNum].conditions
          //       ?.cashWithdrawal ??
          //       'Нет информации'
          //       : '',
          // ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: true,
          //   rowName: 'Кредиты для бизнеса',
          //   firstProductDescription: widget
          //       .rkoModel[firstPageNum].conditions?.cashWithdrawal ??
          //       'Нет информации',
          //   secondProductDescription: comparisonLength >1
          //       ? widget.rkoModel[secondPageNum].conditions
          //       ?.cashWithdrawal ??
          //       'Нет информации'
          //       : '',
          // ),
          // ComparisonRowItemWidget(
          //   isTextWithHtmlTags: true,
          //   rowName: 'Онлайн-бухгалтерия',
          //   firstProductDescription: widget
          //       .rkoModel[firstPageNum].conditions?.cashWithdrawal ??
          //       'Нет информации',
          //   secondProductDescription: comparisonLength >1
          //       ? widget.rkoModel[secondPageNum].conditions
          //       ?.cashWithdrawal ??
          //       'Нет информации'
          //       : '',
          // ),
          //       ComparisonRowItemWidget(
          //   isTextWithHtmlTags: true,
          //   rowName: 'Подходит для госзакупок',
          //   firstProductDescription: widget
          //       .rkoModel[firstPageNum].rates??
          //       'Нет информации',
          //   secondProductDescription: comparisonLength >1
          //       ? widget.rkoModel[secondPageNum].conditions
          //       ?.cashWithdrawal ??
          //       'Нет информации'
          //       : '',
          // ),
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
                          url: widget.rkoModel[firstPageNum].refLink,
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
              comparisonLength > 1
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 3),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return CustomWebViewPage(
                                url: widget.rkoModel[secondPageNum].refLink,
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
