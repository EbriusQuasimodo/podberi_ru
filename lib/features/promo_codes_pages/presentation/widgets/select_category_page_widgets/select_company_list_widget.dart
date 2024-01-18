import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/promo_codes_pages/domain/promocodes_company_filters_model.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_controller.dart';

class CompaniesFilterListWidget extends ConsumerStatefulWidget {
  final VoidCallback onTap;
  final PromoCodesAllCompaniesFilters promoCodesAllFilters;

  CompaniesFilterListWidget({
    super.key,
    required this.promoCodesAllFilters,
    required this.onTap,
  });

  @override
  ConsumerState<CompaniesFilterListWidget> createState() =>
      _SelectCompanyListWidgetState();
}

class _SelectCompanyListWidgetState
    extends ConsumerState<CompaniesFilterListWidget> {
  late List<String> selectedCompanies;

  @override
  Widget build(BuildContext context) {
    selectedCompanies = ref.watch(selectedCompanyFilterStateProvider);
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
            if (!selectedCompanies
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
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: selectedCompanies
                          .contains(widget.promoCodesAllFilters.companyName)
                      ? ThemeApp.mainBlue
                      : Colors.transparent,
                  width: selectedCompanies
                          .contains(widget.promoCodesAllFilters.companyName)
                      ? 4
                      : 0)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: widget.promoCodesAllFilters.color,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(1, -1),
                      spreadRadius: 0,
                      blurRadius: 0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-1, 1),
                      spreadRadius: 0,
                      blurRadius: 0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(1, 1),
                      spreadRadius: 0,
                      blurRadius: 0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-1, -1),
                      spreadRadius: 0,
                      blurRadius: 0)
                ]),
            child: ClipOval(
              child: SvgPicture.asset(
                widget.promoCodesAllFilters.imagePath,
                height: selectedCompanies
                        .contains(widget.promoCodesAllFilters.companyName)
                    ? 56
                    : 60,
                width: selectedCompanies
                        .contains(widget.promoCodesAllFilters.companyName)
                    ? 56
                    : 60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
