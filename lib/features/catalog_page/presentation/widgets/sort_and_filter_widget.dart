import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';

class SortAndFilterWidget extends ConsumerStatefulWidget {
  final VoidCallback onFiltersButtonTap;
  final VoidCallback onSortButtonTap;
  ///виджет с сортировкой и фильтрами, используется на странице [CatalogPage]
  const SortAndFilterWidget({super.key, required this.onFiltersButtonTap, required this.onSortButtonTap});

  @override
  ConsumerState<SortAndFilterWidget> createState() =>
      _SortAndfilterButtonsWidgetState();
}

class _SortAndfilterButtonsWidgetState
    extends ConsumerState<SortAndFilterWidget> {
  String sortType = 'По новизне';


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            widget.onSortButtonTap();

          },
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/sort_icon.svg',
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                sortType,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            widget.onFiltersButtonTap();
            },
          child: Row(
            children: [
              const Text(
                'Фильтры',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              SvgPicture.asset(
                'assets/icons/filter_icon.svg',
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
