import 'package:flutter/material.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';

import 'credit_cards_comparison_data_table_widget.dart';
import 'credit_cards_comparison_widgets/credit_cards_comparison_widget.dart';

class ComparisonCreditCardsWidget extends StatefulWidget {
  final List<ListCreditCardsModel> creditCardsInComparison;
  final VoidCallback onScrollPageViews;
  const ComparisonCreditCardsWidget({
    super.key,
    required this.creditCardsInComparison,
    required this.onScrollPageViews,
  });

  @override
  State<ComparisonCreditCardsWidget> createState() =>
      _ComparisonCreditCardsWidgetState();
}

class _ComparisonCreditCardsWidgetState
    extends State<ComparisonCreditCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          CreditCardsComparisonWidget(
              onScrollPageViews: () {
                widget.onScrollPageViews();
              },
              creditCardsList: widget.creditCardsInComparison,
              onDeleteFromComparison: () {
                setState(() {});
              }),
          CreditCardsComparisonDataTableWidget(creditCardsModel: widget.creditCardsInComparison,)
        ],
      ),
    );
  }
}
