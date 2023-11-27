import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class ChoiceChipItem extends StatefulWidget {
  final List<String> itemsNames;
  final List<String> filters;
  final int length;

  const ChoiceChipItem(
      {super.key, required this.itemsNames, required this.filters, required this.length});

  @override
  State<ChoiceChipItem> createState() => _ChoiceChipItemState();
}

class _ChoiceChipItemState extends State<ChoiceChipItem> {
  @override
  Widget build(BuildContext context) {
    var list = <Widget>[const SizedBox(width: 12)];

    for (int i = 0; i < widget.length; i ++) {
      list.add(
        Padding(
            padding: const EdgeInsets.only(left: 3, right: 3, bottom: 26),
            child: ChoiceChip(
              label: Text(widget.itemsNames[i]),
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: widget.filters.contains(widget.itemsNames[i])
                      ? ThemeApp.mainWhite
                      : ThemeApp.backgroundBlack),
              selected: widget.filters.contains(widget.itemsNames[i]),
              selectedColor: ThemeApp.darkestGrey,
              backgroundColor: ThemeApp.grey,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(14),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 15, left: 15),
              onSelected: (bool value) {
                setState(() {
                  if (value) {
                    if (!widget.filters.contains(widget.itemsNames[i])) {
                      widget.filters.add(widget.itemsNames[i]);
                    }
                  } else {
                    widget.filters.removeWhere((String name) {
                      return name == widget.itemsNames[i];
                    });
                  }
                });
              },
            )),
      );
    }
    list.add(SizedBox(width: 12,));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }
}
//[
// ListView.builder(
//   shrinkWrap: true,
//     padding: EdgeInsets.only(left: 12, right: 12, bottom: 26),
//     itemCount: widget.itmesNames.length,
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (BuildContext context, int index) {
//       return Padding(
//           padding: const EdgeInsets.only(left: 3, right: 3),
//           child: ChoiceChip(
//             label: Text(widget.itmesNames[index]),
//             labelStyle: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: widget.filters.contains(widget.itmesNames[index])
//                     ? ThemeApp.mainWhite
//                     : ThemeApp.backgroundBlack),
//             selected: widget.filters
//                 .contains(widget.itmesNames[index]),
//             selectedColor: ThemeApp.darkestGrey,
//             backgroundColor: ThemeApp.grey,
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(width: 0, color: Colors.transparent),
//               borderRadius: BorderRadius.circular(14),
//             ),
//             showCheckmark: false,
//             padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
//             onSelected: (bool value) {
//               setState(() {
//                 if (value) {
//                   if (!widget.filters.contains(widget.itmesNames[index])) {
//                     widget.filters.add(widget.itmesNames[index]);
//                   }
//                 } else {
//                   widget.filters.removeWhere((String name) {
//                     return name == widget.itmesNames[index];
//                   });
//                 }
//               });
//             },
//           ));
//     }),
// ],
