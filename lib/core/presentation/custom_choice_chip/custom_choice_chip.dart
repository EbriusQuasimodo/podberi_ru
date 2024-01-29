import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_page.dart';

import 'custom_choice_chip_controller.dart';

class CustomChoiceChip extends ConsumerStatefulWidget {
  final String categoryName;
  final List<String> selectedCategory;
  final List<String> bankProductsNamesList;
  final VoidCallback onTap;
  final String whereFrom;

  ///кастомный виджет для выбора типа продукта на странице [CatalogPage] если мы перешли на нее из банка
  ///также используется в [FavoritesPage] и [ComparisonPage]
  const CustomChoiceChip({
    super.key,
    required this.onTap,
    required this.categoryName,
    required this.selectedCategory,
    required this.bankProductsNamesList,
    required this.whereFrom,
  });

  @override
  ConsumerState<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends ConsumerState<CustomChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: ChoiceChip(
        label: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(widget.categoryName),
            ),
            widget.selectedCategory.contains(widget.categoryName)
                ? SvgPicture.asset('assets/icons/delete_icon.svg')
                : const SizedBox.shrink(),
          ],
        ),
        labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: widget.selectedCategory.contains(widget.categoryName)
                ? ThemeApp.mainWhite
                : ThemeApp.backgroundBlack),
        selected: widget.selectedCategory.contains(widget.categoryName),
        selectedColor: ThemeApp.mainBlue,
        backgroundColor: ThemeApp.grey,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(14),
        ),
        showCheckmark: false,
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
        onSelected: (bool value) {


            if (value) {
              if (!widget.selectedCategory.contains(widget.categoryName)) {
                widget.selectedCategory.clear();
                widget.selectedCategory.add(widget.categoryName);
                ref
                    .read(customChoiceChipControllerProvider.notifier)
                    .changeCategory(widget.whereFrom, widget.categoryName);
              }
            }
            widget.onTap();
        },
      ),
    );
  }
}
