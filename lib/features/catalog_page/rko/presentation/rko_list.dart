import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';

import 'rko_button_widget.dart';
import 'rko_controller.dart';

class RkoListWidget extends ConsumerStatefulWidget {
  final int itemsCount;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///list of Rko
  const RkoListWidget({
    super.key,
    required this.basicApiPageSettingsModel,
    required this.itemsCount,
  });

  @override
  ConsumerState<RkoListWidget> createState() =>
      _RkoListWidgetState();
}

class _RkoListWidgetState extends ConsumerState<RkoListWidget> {
  static const pageSize = 10;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: widget.itemsCount,
          (BuildContext context, int index) {
        page = index ~/ pageSize + 1;
        final indexInPage = index % pageSize;
        widget.basicApiPageSettingsModel.page = page;
        return ref
            .watch(
                rkoControllerProvider(widget.basicApiPageSettingsModel))
            .when(data: (rkoList) {
          if (indexInPage >= rkoList.items.length) {
            return const SizedBox.shrink();
          } else {
            final rko = rkoList.items[indexInPage];
            return RkoWidgetWithButtons(
                basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
                productInfo: rko,
                productRating: '4.8');
          }
        }, error: (error, _) {
              print(_);
          return SizedBox.shrink();
        }, loading: () {
          return SizedBox.shrink();
        });
      }),
    );
  }
}
