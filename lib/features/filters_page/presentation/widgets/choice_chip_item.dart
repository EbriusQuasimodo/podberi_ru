import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class ChoiceChipItem extends ConsumerStatefulWidget {
  final List<String>? itemsNames;
  final AutoDisposeStateProvider<List<String>> providerName;
  final List<String> filters;
  final int length;
  final List<BankDetailsModel>? banksList;
///виджет для чойс чипов в фильтрах (чтобы переиспользовать его)
   ChoiceChipItem(
      {super.key, this.itemsNames, this.banksList, required this.filters, required this.length, required this.providerName,});

  @override
  ConsumerState<ChoiceChipItem> createState() => _ChoiceChipItemState();
}

class _ChoiceChipItemState extends ConsumerState<ChoiceChipItem> {
  @override
  Widget build(BuildContext context) {
    var list = <Widget>[const SizedBox(width: 12)];

    for (int i = 0; i < widget.length; i ++) {
      list.add(
        Padding(
            padding: const EdgeInsets.only(left: 3, right: 3, bottom: 26),
            child: ChoiceChip(
              label: Text(widget.itemsNames?[i] ?? widget.banksList?[i].bankName),
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: widget.filters.contains(widget.itemsNames?[i] ?? widget.banksList?[i].bankName)
                      ? ThemeApp.mainWhite
                      : ThemeApp.backgroundBlack),
              selected: widget.filters.contains(widget.itemsNames?[i] ?? widget.banksList?[i].bankName),
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
                    if (!widget.filters.contains(widget.itemsNames?[i] ?? widget.banksList?[i].bankName)) {
                      widget.filters.add(widget.itemsNames?[i] ?? widget.banksList?[i].bankName);
                    }
                  } else {

                    widget.filters.removeWhere((String name) {
                      return name == widget.itemsNames?[i];

                    });
                    widget.filters.removeWhere((String name) {return name ==widget.banksList?[i].bankName;});
                  }
                //  ref.watch(widget.providerName.notifier).state = widget.filters;
                 // print(widget.filters);
                });

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
