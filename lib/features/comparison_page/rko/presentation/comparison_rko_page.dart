import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'widgets/rko_comparison_data_table_widget.dart';
import 'widgets/rko_page_view_widgets/rko_page_view_widget.dart';

class ComparisonRkoPage extends ConsumerStatefulWidget {
  final List<ListRkoModel> rkoInComparison;
  final VoidCallback onScrollPageViews;

  const ComparisonRkoPage({
    super.key,
    required this.rkoInComparison,
    required this.onScrollPageViews,
  });

  @override
  ConsumerState<ComparisonRkoPage> createState() =>
      _ComparisonRkoPageState();
}

class _ComparisonRkoPageState
    extends ConsumerState<ComparisonRkoPage> {

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          RkoPageViewWidget(
              onScrollPageViews: () {
                widget.onScrollPageViews();
              },
              rkoList: widget.rkoInComparison,
              onDeleteFromComparisonTwo: () {
              //  setState(() {});
              },
              onDeleteFromComparison: () {
              //  setState(() {});
              }),
          RkoComparisonDataTableWidget(
            rkoModel: widget.rkoInComparison,
          )
        ],
      ),
    );
  }
}
