import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class StandardItemWithListWidget extends StatelessWidget {
  final String widgetName;
  final String showMoreButtonName;
  final Widget childOfList;
  final VoidCallback onTapShowMoreButton;
  final double listHeight;
  final double? bottomPadding;

  const StandardItemWithListWidget(
      {super.key,
      required this.widgetName,
      required this.showMoreButtonName,
      required this.onTapShowMoreButton,
      required this.childOfList,
      required this.listHeight,
      this.bottomPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: bottomPadding ?? 0),
      padding: const EdgeInsets.only(top: 30, bottom: 21),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ThemeApp.mainWhite,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 22,
            ),
            child: Text(
              widgetName,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          SizedBox(
            height: listHeight,
            child: ListView.builder(
                padding: const EdgeInsets.only(right: 15, left: 15),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return childOfList;
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 22,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  onTapShowMoreButton();
                },
                child: Text(
                  showMoreButtonName,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
