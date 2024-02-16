import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/core/domain/pagination_params_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ShowMoreBanksPage extends ConsumerStatefulWidget {
  final int itemCount;
  final List<String> filters;
  final VoidCallback onTapTrashButton;
  final VoidCallback onTapSaveButton;

  ///страница с полным списком всех банков в фильтрах
  ShowMoreBanksPage({
    super.key,
    required this.filters,
    required this.itemCount,
    required this.onTapSaveButton,
    required this.onTapTrashButton,
  });

  @override
  ConsumerState<ShowMoreBanksPage> createState() => _ShowMorePageState();
}

class _ShowMorePageState extends ConsumerState<ShowMoreBanksPage> {
  static const pageSize = 20;
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: new ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: const Text('Фильтры'),
            leading: IconButton(
                onPressed: () {
                  widget.onTapSaveButton();
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
          SliverStack(
            insetOnOverlap: true,
            children: [
              SliverPositioned.fill(
                child: SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 82),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ThemeApp.mainWhite,
                    ),
                  ),
                ),
              ),
              SliverContainer(
                margin: const EdgeInsets.only(top: 2, bottom: 82),
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeApp.mainWhite,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 30, right: 15, left: 15),
                    child: Text(
                      'Банк',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ThemeApp.backgroundBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                sliver: SliverPadding(
                  padding: const EdgeInsets.only(
                      top: 64, right: 15, left: 15, bottom: 9),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: widget.itemCount, (context, index) {
                      page = index ~/ pageSize + 1;
                      final indexInPage = index % pageSize;
                      return ref
                          .watch(allBanksControllerProvider(
                              PaginationParamsModel(fetch:pageSize, page: page)))
                          .when(
                        data: (allBanks) {
    if (indexInPage >= allBanks.items.length) {
    return const SizedBox.shrink();
    } else {
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
                                    if (!widget.filters.contains(
                                        allBanks.items[indexInPage].bankName)) {
                                      //widget.filters.clear();
                                      widget.filters
                                          .add(allBanks.items[indexInPage].bankName);
                                    } else {
                                      widget.filters.removeWhere((String name) {
                                        return name ==
                                            allBanks.items[indexInPage].bankName;
                                      });
                                    }
                                    //ref.watch(widget.providerName.notifier).state = widget.filters;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                          allBanks.items[indexInPage].bankName,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: ThemeApp.backgroundBlack)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ThemeApp.mainWhite,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(
                                          right: 15, top: 15, bottom: 15),
                                      child: SvgPicture.asset(
                                        'assets/icons/filer_check_icon.svg',
                                        height: 16,
                                        width: 16,
                                        color: widget.filters.contains(
                                                allBanks.items[indexInPage].bankName)
                                            ? ThemeApp.mainBlue
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );}
                        },
                        error: (error, _) {
                          return SizedBox.shrink();
                        },
                        loading: () {
                          return SizedBox.shrink();
                        },
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: ThemeApp.mainWhite,
        ),
        height: 80,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: MaterialButton(
                  height: 50,
                  onPressed: () {
                    widget.onTapSaveButton();
                    Navigator.of(context).pop();
                  },
                  color: ThemeApp.mainBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(
                        color: ThemeApp.mainWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 15, bottom: 15),
              child: Material(
                borderRadius: BorderRadius.circular(14),
                color: ThemeApp.grey,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    widget.onTapTrashButton();
                    setState(() {
                      widget.filters.clear();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: SvgPicture.asset(
                      'assets/icons/trash_icon.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
