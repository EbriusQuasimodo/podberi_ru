import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/debit_cards/presentation/debit_cards_controller.dart';
import 'package:podberi_ru/features/details_page/rko/presentation/widgets/tariffs_rko_widget.dart';

import '../../../shared_presentation/shared_widgets/row_description_widget.dart';

class RkoConditionsWidget extends StatefulWidget {
  final ListRkoModel productInfo;
  final  RkoRatesListModel rkoRatesListModel;

  ///виджет с условиями по тарифам рко
  ///используется в [TariffsRkoWidget]
  const RkoConditionsWidget({
    super.key,
    required this.productInfo,
    required this.rkoRatesListModel,
  });

  @override
  State<RkoConditionsWidget> createState() => _RkoConditionsWidgetState();
}

class _RkoConditionsWidgetState extends State<RkoConditionsWidget> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ThemeApp.mainWhite,
      ),
      child: Column(
        children: [
          RowDescriptionWidget(
              isTextWithHtmlTags: false,
              rowDescription:
                  "от ${widget.rkoRatesListModel.service1Month} руб./мес",
              rowName: 'Обслуживание'),
          RowDescriptionWidget(
              isTextWithHtmlTags: false,
              rowDescription:
                  widget.rkoRatesListModel.freeTransfersUr,
              rowName: 'Бесплатные переводы юрлицам'),
          RowDescriptionWidget(
              isTextWithHtmlTags: false,
              rowDescription:
                  "${widget.rkoRatesListModel.priceTransfersUr} ₽ за платеж",
              rowName: 'Переводы юрлицам'),
          RowDescriptionWidget(
              isTextWithHtmlTags: false,
              rowDescription: widget.productInfo.forIp ? "Для ИП" : "Для ООО",
              rowName: 'Кому подойдет'),
          RowDescriptionWidget(
              isTextWithHtmlTags: false,
              rowDescription: "от ${widget.productInfo.minEq} %",
              rowName: 'Эквайринг'),
          RowDescriptionWidget(
              isTextWithHtmlTags: false,
              rowDescription: widget.productInfo.priceOpen == 0
                  ? "Бесплатно"
                  : "${widget.productInfo.priceOpen} руб.",
              rowName: 'Стоимость открытия'),
          showAll
              ? RowDescriptionWidget(
                  isTextWithHtmlTags: false,
                  rowDescription:
                      widget.productInfo.openingOnline ? "Да" : "Нет",
                  rowName: 'Открытие онлайн')
              : const SizedBox.shrink(),
          RowDescriptionWidget(
              isTextWithHtmlTags: true,
              rowDescription:
                  "${widget.rkoRatesListModel.descriptions?.transferCommission}",
              rowName: 'Комиссия за переводы физлицам'),
          showAll
              ? RowDescriptionWidget(
                  isTextWithHtmlTags: true,
                  rowDescription:
                      '${widget.rkoRatesListModel.descriptions?.cashWithdrawal}',
                  rowName: 'Снятие наличных')
              : const SizedBox.shrink(),
          showAll
              ? RowDescriptionWidget(
                  isTextWithHtmlTags: true,
                  rowDescription:
                      "${widget.rkoRatesListModel.descriptions?.depositCash}",
                  rowName: 'Внесение наличных')
              : const SizedBox.shrink(),
          showAll
              ? RowDescriptionWidget(
                  isTextWithHtmlTags: true,
                  rowDescription:
                      "${widget.rkoRatesListModel.descriptions?.stocks}",
                  rowName: 'Акции')
              : const SizedBox.shrink(),
          showAll
              ? RowDescriptionWidget(
                  isTextWithHtmlTags: false,
                  rowDescription:
                      "${widget.rkoRatesListModel.deposits ? "Да${widget.rkoRatesListModel.depositsText != '' ? "," : ""}" : "Нет${widget.rkoRatesListModel.depositsText != '' ? "," : ""}"}"
                      " ${widget.rkoRatesListModel.depositsText}",
                  rowName: 'Депозиты')
              : const SizedBox.shrink(),
          showAll
              ? RowDescriptionWidget(
                  isTextWithHtmlTags: true,
                  rowDescription:
                      "${widget.rkoRatesListModel.credits ? "Да${widget.rkoRatesListModel.creditsText != '' ? "," : ""}" : "Нет${widget.rkoRatesListModel.creditsText != '' ? "," : ""}"}"
                      " ${widget.rkoRatesListModel.creditsText}",
                  rowName: 'Кредиты для бизнеса')
              : const SizedBox.shrink(),
          showAll
              ? RowDescriptionWidget(
                  isTextWithHtmlTags: false,
                  rowDescription:
                      widget.rkoRatesListModel.onlineAccounting
                          ? "Да"
                          : "Нет",
                  rowName: 'Онлайн-бухгалтерия')
              : const SizedBox.shrink(),
          showAll
              ? RowDescriptionWidget(
                  isTextWithHtmlTags: false,
                  rowDescription:
                      widget.rkoRatesListModel.government
                          ? "Да"
                          : "Нет",
                  rowName: 'Подходит для госзакупок')
              : const SizedBox.shrink(),
          showAll
              ? RowDescriptionWidget(
                  isTextWithHtmlTags: true,
                  rowDescription:
                      "<a href=\"${widget.rkoRatesListModel.allConditionsLink}\"rel=\"noopener noreferrer\"target=\"_blank\">${widget.rkoRatesListModel.allConditionsLink}</a>",
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
    );
  }
}
