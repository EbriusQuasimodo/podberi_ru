import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

class CustomChoiceChip extends ConsumerStatefulWidget {
  final String element;
  final List<String> selectedBankProducts;
  final List<String> bankProductsNamesList;
  final VoidCallback onTap;
  final String productType;

  const CustomChoiceChip({
    super.key,
    required this.onTap,
    required this.element,
    required this.selectedBankProducts,
    required this.bankProductsNamesList,
    required this.productType,
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
                if (widget.productType == 'allBanksPage') {
                  switch (widget.element) {
                    case 'Дебетовые карты':
                      ref
                          .watch(
                              productTypeUrlFromAllBanksStateProvider.notifier)
                          .state = 'debit_cards';

                      break;
                    case 'Кредитные карты':
                      ref
                          .watch(
                              productTypeUrlFromAllBanksStateProvider.notifier)
                          .state = 'credit_cards';

                      break;
                    case 'РКО':
                      ref
                          .watch(
                              productTypeUrlFromAllBanksStateProvider.notifier)
                          .state = 'rko';

                      break;
                  }
                } if (widget.productType == 'homePageBanks') {
                  switch (widget.element) {
                    case 'Дебетовые карты':
                      ref
                          .watch(
                              productTypeUrlFromHomeBanksStateProvider.notifier)
                          .state = 'debit_cards';

                      break;
                    case 'Кредитные карты':
                      ref
                          .watch(
                              productTypeUrlFromHomeBanksStateProvider.notifier)
                          .state = 'credit_cards';

                      break;
                    case 'РКО':
                      ref
                          .watch(
                              productTypeUrlFromHomeBanksStateProvider.notifier)
                          .state = 'rko';

                      break;
                  }
                }
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
