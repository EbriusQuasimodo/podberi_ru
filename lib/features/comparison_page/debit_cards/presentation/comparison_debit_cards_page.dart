import 'package:flutter/material.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'widgets/debit_cards_comparison_data_table_widget.dart';
import 'widgets/debit_cards_page_view_widgets/debit_cards_page_view_widget.dart';

class ComparisonDebitCardsPage extends StatefulWidget {
  final List<ListDebitCardsModel> debitCardsInComparison;
  final VoidCallback onScrollPageViews;

  const ComparisonDebitCardsPage({
    super.key,
    required this.debitCardsInComparison,
    required this.onScrollPageViews,
  });

  @override
  State<ComparisonDebitCardsPage> createState() =>
      _ComparisonDebitCardsPageState();
}

class _ComparisonDebitCardsPageState
    extends State<ComparisonDebitCardsPage> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          DebitCardsPageViewWidget(
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
