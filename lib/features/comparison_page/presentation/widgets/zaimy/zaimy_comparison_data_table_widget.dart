import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/comparison_page/presentation/comparison_page.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_page_controller.dart';

import '../comparison_row_item.dart';


class ZaimyComparisonDataTableWidget extends ConsumerStatefulWidget {
  final List<ListZaimyModel> zaimyModel;
  ///таблица сравнения двух кредиток, используется в [ComparisonPage]
  const ZaimyComparisonDataTableWidget({
    super.key,
required this.zaimyModel,
  });

  @override
  ConsumerState<ZaimyComparisonDataTableWidget> createState() => _ZaimyComparisonDataTableWidgetState();
}

class _ZaimyComparisonDataTableWidgetState extends ConsumerState<ZaimyComparisonDataTableWidget> {
  @override
  Widget build(BuildContext context) {
    String firstProductDescription = ref.watch(comparisonFirstZaimyBankNameStateProvider);
    String secondProductDescription = ref.watch(comparisonSecondZaimyBankNameStateController);
    int firstPageNum = ref.watch(comparisonFirstZaimyPageNumStateProvider);
    int secondPageNum = ref.watch(comparisonSecondZaimyPageNumStateController);
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
            rowName: 'Название МФО',
            firstProductDescription: firstProductDescription,
            secondProductDescription: secondProductDescription,
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Сумма займа',
            firstProductDescription:
            "${widget.zaimyModel[firstPageNum].sum} руб.",
            secondProductDescription: secondProductDescription != ''
                ? "${widget.zaimyModel[secondPageNum].sum} руб."
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Тип займа',
            firstProductDescription:
            widget.zaimyModel[firstPageNum].type,
            secondProductDescription: secondProductDescription != ''
                ?  widget.zaimyModel[secondPageNum].type
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Срок займа',
            firstProductDescription: 'от ${widget.zaimyModel[firstPageNum].minTerm} до ${widget.zaimyModel[firstPageNum].maxTerm} ${widget.zaimyModel[firstPageNum].termFormat == 'дни' ? "дн." : "мес."}',
            secondProductDescription: secondProductDescription != ''
                ?  'от ${widget.zaimyModel[secondPageNum].minTerm} до ${widget.zaimyModel[secondPageNum].maxTerm} ${widget.zaimyModel[secondPageNum].termFormat == 'дни' ? "дн." : "мес."}'
                : '',
          ),
          ComparisonRowItemWidget(
            isTextWithHtmlTags: false,
            rowName: 'Процентная ставка',
            firstProductDescription:
            'от ${widget.zaimyModel[firstPageNum].minPercent} до ${widget.zaimyModel[firstPageNum].maxPercent} %',
            secondProductDescription: secondProductDescription != ''
                ? 'от ${widget.zaimyModel[secondPageNum].minPercent} до ${widget.zaimyModel[secondPageNum].maxPercent} %'
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
              secondProductDescription != '' ?
              Expanded(
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
                  :SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
