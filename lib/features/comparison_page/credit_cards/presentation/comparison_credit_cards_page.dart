import 'package:flutter/material.dart';
import 'package:podberi_ru/core/domain/credit_cards_model/credit_cards_model.dart';
import 'widgets/credit_cards_comparison_data_table_widget.dart';
import 'widgets/credit_cards_page_view_widgets/credit_cards_page_view_widget.dart';

class ComparisonCreditCardsPage extends StatefulWidget {
  final List<ListCreditCardsModel> creditCardsInComparison;

  const ComparisonCreditCardsPage({
    super.key,
    required this.creditCardsInComparison,
  });

  @override
  State<ComparisonCreditCardsPage> createState() =>
      _ComparisonCreditCardsPageState();
}

class _ComparisonCreditCardsPageState
    extends State<ComparisonCreditCardsPage> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          CreditCardsPageViewWidget(

              creditCardsList: widget.creditCardsInComparison,
             ),
          CreditCardsComparisonDataTableWidget(
            creditCardsModel: widget.creditCardsInComparison,
          )
        ],
      ),
    );
  }
}
