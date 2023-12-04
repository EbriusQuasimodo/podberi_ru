import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_controller.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/select_category_promo_codes_page.dart';

class SelectCompanyListWidget extends ConsumerStatefulWidget {
  final VoidCallback onTap;
  final PromoCodesAllFilters promoCodesAllFilters;

  SelectCompanyListWidget({
    super.key,
    required this.promoCodesAllFilters,
    required this.onTap,
  });

  @override
  ConsumerState<SelectCompanyListWidget> createState() =>
      _SelectCompanyListWidgetState();
}

class _SelectCompanyListWidgetState
    extends ConsumerState<SelectCompanyListWidget> {
  late List<String> selectedBankProducts;

  @override
  Widget build(BuildContext context) {
    selectedBankProducts = ref.watch(selectedCompanyFilterStateProvider);
    return Padding(
      padding: const EdgeInsets.only(right: 3, left: 3),
      child: RawMaterialButton(
        constraints: const BoxConstraints(),
        shape: const CircleBorder(
          side: BorderSide(color: Colors.transparent),
        ),
        padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
        onPressed: () {
          setState(() {
            widget.onTap();
            if (!selectedBankProducts
                .contains(widget.promoCodesAllFilters.companyName)) {
              ref
                  .watch(selectedCompanyFilterStateProvider.notifier)
                  .state
                  .add(widget.promoCodesAllFilters.companyName);
            } else {
              ref
                  .watch(selectedCompanyFilterStateProvider.notifier)
                  .state
                  .removeWhere((String name) {
                return name == widget.promoCodesAllFilters.companyName;
              });
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: widget.promoCodesAllFilters.color,
              shape: BoxShape.circle,
              border: Border.all(
                  color: selectedBankProducts
                          .contains(widget.promoCodesAllFilters.companyName)
                      ? ThemeApp.mainBlue
                      : Colors.transparent,
                  width: selectedBankProducts
                          .contains(widget.promoCodesAllFilters.companyName)
                      ? 4
                      : 0)),
          child: ClipOval(
            child: SvgPicture.asset(
              widget.promoCodesAllFilters.imagePath,
              height: selectedBankProducts
                      .contains(widget.promoCodesAllFilters.companyName)
                  ? 56
                  : 60,
              width: selectedBankProducts
                      .contains(widget.promoCodesAllFilters.companyName)
                  ? 56
                  : 60,
            ),
          ),
        ),
      ),
    );
  }
}
