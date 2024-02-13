import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/zaimy/presentation/zaimy_controller.dart';
import 'package:podberi_ru/features/catalog_page/zaimy/presentation/zaimy_button_widget.dart';


class ZaimyListWidget extends ConsumerStatefulWidget {
  final int itemsCount;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  ///list of zaimy. when press on card - go to [LoadDetailsPageByProductType]
  const ZaimyListWidget({
    super.key,
    required this.basicApiPageSettingsModel,
    required this.itemsCount,
  });

  @override
  ConsumerState<ZaimyListWidget> createState() =>
      _ZaimyListWidgetState();
}

class _ZaimyListWidgetState extends ConsumerState<ZaimyListWidget> {

  static const pageSize = 10;
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: widget.itemsCount,(BuildContext context, int index) {
        page = index ~/ pageSize+1;
        final indexInPage = index % pageSize;
        return ref
            .watch(zaimyControllerProvider(
            widget.basicApiPageSettingsModel))
            .when(data: (zaimyCards) {
          if (indexInPage >= zaimyCards.items.length) {
            return const SizedBox.shrink();
          } else {
            final zaimy = zaimyCards.items[indexInPage];
            return ZaimyWidgetWithButtons(
              onTap: () {
                setState(() {});
              },
              basicApiPageSettingsModel: widget.basicApiPageSettingsModel,
              productInfo: zaimy,
              productRating: '4.8');}
        }, error: (error, _) {
          return SizedBox.shrink();
        }, loading: () {
          return SizedBox.shrink();
        });
      }),
    );
  }
}
