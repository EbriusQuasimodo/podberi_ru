import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_products_list_widget/list_widgets/debit_cards/debit_cards_list.dart';

import '../credit_cards/credit_cards_comparison_data_table_widget.dart';
import 'zaimy_comparison_data_table_widget.dart';
import 'zaimy_comparison_widgets/zaimy_product_comparison_widget.dart';

class ComparisonZaimyWidget extends StatefulWidget {
  final List<ListZaimyModel> zaimyInComparison;
  final VoidCallback onScrollPageViews;
  const ComparisonZaimyWidget({
    super.key,
    required this.zaimyInComparison,
    required this.onScrollPageViews,
  });

  @override
  State<ComparisonZaimyWidget> createState() =>
      _ComparisonZaimyWidgetState();
}

class _ComparisonZaimyWidgetState
    extends State<ComparisonZaimyWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
     delegate: SliverChildListDelegate(
        [
          ZaimyComparisonWidget(
                  onScrollPageViews: () {
                    widget.onScrollPageViews();
                  },
                  zaimyList: widget.zaimyInComparison,
                  onDeleteFromComparison: () {
                    setState(() {});
                  }), ZaimyComparisonDataTableWidget()

        ],
      ),
    );
  }
}