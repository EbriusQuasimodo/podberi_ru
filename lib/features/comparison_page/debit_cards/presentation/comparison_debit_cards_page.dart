import 'package:flutter/material.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'widgets/debit_cards_comparison_data_table_widget.dart';
import 'widgets/debit_cards_comparison_widgets/debit_cards_product_comparison_widget.dart';

class ComparisonDebitCardsWidget extends StatefulWidget {
  final List<ListDebitCardsModel> debitCardsInComparison;
  final VoidCallback onScrollPageViews;

  const ComparisonDebitCardsWidget({
    super.key,
    required this.debitCardsInComparison,
    required this.onScrollPageViews,
  });

  @override
  State<ComparisonDebitCardsWidget> createState() =>
      _ComparisonDebitCardsWidgetState();
}

class _ComparisonDebitCardsWidgetState
    extends State<ComparisonDebitCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          DebitCardsComparisonWidget(
              onScrollPageViews: () {
                widget.onScrollPageViews();
              },
              debitCardsList: widget.debitCardsInComparison,
              onDeleteFromComparisonTwo: () {
                setState(() {});
              },
              onDeleteFromComparison: () {
                setState(() {});
              }),
          DebitCardsComparisonDataTableWidget(
            debitCardsModel: widget.debitCardsInComparison,
          )
        ],
      ),
    );
  }
}
