import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class ShowMorePage extends ConsumerStatefulWidget {
  final List<String> itemsNames;
  final List<String> filters;

  const ShowMorePage({
    super.key,
    required this.filters,
    required this.itemsNames,
  });

  @override
  ConsumerState<ShowMorePage> createState() => _ShowMorePageState();
}

class _ShowMorePageState extends ConsumerState<ShowMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Фильтры'),
          ),
          SliverContainer(
              //padding:EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 15),
              margin: const EdgeInsets.only(top: 2, bottom: 82),
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeApp.mainWhite,
                ),
              ),
              sliver: SliverPadding(
                padding: const EdgeInsets.only(
                    top: 15, right: 15, left: 15, bottom: 9),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: widget.itemsNames.length,
                      (context, index) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ThemeApp.grey,
                                borderRadius: BorderRadius.circular(14)),
                            margin: EdgeInsets.only(bottom: 6),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  setState(() {
                                    if (!widget.filters
                                        .contains(widget.itemsNames[index])) {
                                      widget.filters.clear();
                                      widget.filters
                                          .add(widget.itemsNames[index]);
                                    } else {
                                      widget.filters.removeWhere((String name) {
                                        return name == widget.itemsNames[index];
                                      });
                                    }
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text(widget.itemsNames[index],
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
                                      padding: EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(
                                          right: 15, top: 15, bottom: 15),
                                      child: Icon(
                                        Icons.done,
                                        color: widget.filters.contains(
                                                widget.itemsNames[index])
                                            ? ThemeApp.backgroundBlack
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              )),
          // SliverFillRemaining(
          //
          //     hasScrollBody: false,
          //   child: Container(
          //     //height: double.infinity,
          //     margin: const EdgeInsets.only(bottom: 82),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
          //       color: ThemeApp.mainWhite,
          //     ),
          //   ),
          // ),
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
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(
                        color: ThemeApp.mainWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  color: ThemeApp.mainBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
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
              // MaterialButton(
              //   height: 50,
              //   onPressed: () {},
              //   child: SvgPicture.asset('assets/icons/trash_icon.svg'),
              //   color: ThemeApp.grey,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(14)),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
