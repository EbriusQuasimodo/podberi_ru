import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class BankProductFilterChoiceChipWidget extends StatefulWidget {
  final String element;
  final List<String> selectedBankProducts;
  final List<String> bankProductsNamesList;
  final VoidCallback onTap;
  ///надо удалить наверно
  const BankProductFilterChoiceChipWidget({super.key, required this.element, required this.selectedBankProducts, required this.bankProductsNamesList, required this.onTap});

  @override
  State<BankProductFilterChoiceChipWidget> createState() => _BankProductFilterChoiceChipWidgetState();
}

class _BankProductFilterChoiceChipWidgetState extends State<BankProductFilterChoiceChipWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: ChoiceChip(
        label: Text(widget.element),
        labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: widget.selectedBankProducts.contains(widget.element)
                ? ThemeApp.mainWhite
                : ThemeApp.backgroundBlack),
        selected: widget.selectedBankProducts.contains(widget.element),
        selectedColor: ThemeApp.mainBlue,
        backgroundColor: ThemeApp.grey,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(14),
        ),
        showCheckmark: false,
        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
        onSelected: (bool value) {
          widget.onTap();
          setState(() {
            if (value) {
              if (!widget.selectedBankProducts.contains(widget.element)) {
                widget.selectedBankProducts.clear();
                widget.selectedBankProducts.add(widget.element);
              }
            } else {
              widget.selectedBankProducts.removeWhere((String name) {
                return name == widget.element;
              });
            }
          });
        },
      ),
    );
  }
}
