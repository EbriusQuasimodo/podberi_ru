import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class ChoiceChipItem extends StatefulWidget {
  final List<String> itmesNames;
  final List<String> filters;
  const ChoiceChipItem({super.key, required this.itmesNames, required this.filters});

  @override
  State<ChoiceChipItem> createState() => _ChoiceChipItemState();
}

class _ChoiceChipItemState extends State<ChoiceChipItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 12, right: 12),
          itemCount: widget.itmesNames.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: ChoiceChip(
                  label: Text(widget.itmesNames[index]),
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: widget.filters.contains(widget.itmesNames[index])
                          ? ThemeApp.mainWhite
                          : ThemeApp.backgroundBlack),
                  selected: widget.filters
                      .contains(widget.itmesNames[index]),
                  selectedColor: ThemeApp.darkestGrey,
                  backgroundColor: ThemeApp.grey,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  showCheckmark: false,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        if (!widget.filters.contains(widget.itmesNames[index])) {
                          widget.filters.add(widget.itmesNames[index]);
                        }
                      } else {
                        widget.filters.removeWhere((String name) {
                          return name == widget.itmesNames[index];
                        });
                      }
                    });
                  },
                ));
          }),
    );
  }
}
