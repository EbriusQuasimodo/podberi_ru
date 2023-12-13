import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class SortAndFilterWidget extends ConsumerStatefulWidget {
  final VoidCallback onFiltersButtonTap;
  const SortAndFilterWidget({super.key, required this.onFiltersButtonTap});

  @override
  ConsumerState<SortAndFilterWidget> createState() =>
      _SortAndfilterButtonsWidgetState();
}

class _SortAndfilterButtonsWidgetState
    extends ConsumerState<SortAndFilterWidget> {
  String sortType = 'По новизне';
  var sortVariantsList = ['По популярности', 'По рейтингу', 'По новизне'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            showModalBottomSheet(
                constraints: const BoxConstraints(minWidth: double.infinity),
                context: context,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                        color: ThemeApp.mainWhite,
                        borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: ListView.builder(
                        itemCount: sortVariantsList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ThemeApp.grey,
                                borderRadius: BorderRadius.circular(14)),
                            margin: const EdgeInsets.only(bottom: 6),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  setState(() {
                                    sortType = sortVariantsList[index];
                                  });
                                  ref.read(goRouterProvider).pop();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 15, bottom: 15),
                                  child: Text(
                                    sortVariantsList[index],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                });
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
