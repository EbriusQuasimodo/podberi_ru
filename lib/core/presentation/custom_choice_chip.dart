import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class CustomChoiceChip extends StatefulWidget {
  final String element;
  final List<String> selectedBankProducts;
  final List<String> bankProductsNamesList;
  final VoidCallback onTap;
  const CustomChoiceChip({super.key,required this.onTap, required this.element, required this.selectedBankProducts, required this.bankProductsNamesList});

  @override
  State<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: ChoiceChip(
        label: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(widget.element),
            ),
            widget.selectedBankProducts.contains(widget.element)
                ? SvgPicture.asset('assets/icons/delete_icon.svg')
                : const SizedBox.shrink(),
          ],
        ),
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
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
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
