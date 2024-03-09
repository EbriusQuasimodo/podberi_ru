import 'package:flutter/material.dart';
import 'package:podberi_ru/core/domain/zaimy_model/zaimy_model.dart';

import 'widgets/zaimy_comparison_data_table_widget.dart';
import 'widgets/zaimy_comparison_widgets/zaimy_page_view_widget.dart';

class ComparisonZaimyPage extends StatefulWidget {
  final List<ListZaimyModel> zaimyInComparison;

  const ComparisonZaimyPage({
    super.key,
    required this.zaimyInComparison,
  });

  @override
  State<ComparisonZaimyPage> createState() => _ComparisonZaimyPageState();
}

class _ComparisonZaimyPageState extends State<ComparisonZaimyPage> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ZaimyPageViewWidget(

              zaimyList: widget.zaimyInComparison,
              ),
          ZaimyComparisonDataTableWidget(
            zaimyModel: widget.zaimyInComparison,
          )
        ],
      ),
    );
  }
}
