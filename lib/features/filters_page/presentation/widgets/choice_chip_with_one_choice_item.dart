import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';

class ChoiceChipWithOneChoiceItem extends ConsumerStatefulWidget {
  final List<String>? itemsNames;
  final List<String>? itemsToApiNames;
   String filters;
  final int length;
  final VoidCallback onTap;
  ///виджет для чойс чипов в фильтрах (чтобы переиспользовать его)
  ChoiceChipWithOneChoiceItem(
      {super.key, this.itemsNames,  required this.filters, required this.length,required this.itemsToApiNames, required this.onTap,});

  @override
  ConsumerState<ChoiceChipWithOneChoiceItem> createState() => _ChoiceChipWithOneChoiceItemState();
}

class _ChoiceChipWithOneChoiceItemState extends ConsumerState<ChoiceChipWithOneChoiceItem> {
  @override
  Widget build(BuildContext context) {
    var list = <Widget>[const SizedBox(width: 12)];

    for (int i = 0; i < widget.length; i ++) {
      list.add(
        Padding(
            padding: const EdgeInsets.only(left: 3, right: 3, bottom: 26),
            child: ChoiceChip(
              label: Text(widget.itemsNames![i]),
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: widget.filters == widget.itemsToApiNames?[i]
                      ? ThemeApp.mainWhite
                      : ThemeApp.backgroundBlack),
              selected: widget.filters==widget.itemsToApiNames?[i],
              selectedColor: ThemeApp.darkestGrey,
              backgroundColor: ThemeApp.grey,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(14),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 15, left: 15),
              onSelected: (bool value) {

                setState(() {
                  if (value) {
                    if (widget.filters!=widget.itemsToApiNames?[i]) {

                      widget.filters=widget.itemsToApiNames![i] ;

                    }
                  } else {

                    widget.filters='';
                  }
                });
                widget.onTap();
              },

            )),
      );
    }
    list.add(SizedBox(width: 12,));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }
}
