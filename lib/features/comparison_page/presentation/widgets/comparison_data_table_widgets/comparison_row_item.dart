import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class ComparisonRowItemWidget extends StatelessWidget {
  final String rowName;
  final String firstProductDescription;
  final String secondProductDescription;

  const ComparisonRowItemWidget({
    super.key,
    required this.rowName,
    required this.firstProductDescription,
    required this.secondProductDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Text(
            rowName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: ThemeApp.backgroundBlack,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30),
          padding: EdgeInsets.only(top: 10, bottom: 10),
          color: ThemeApp.grey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 6),
                  child: Text(
                    firstProductDescription,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ThemeApp.backgroundBlack,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    secondProductDescription,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ThemeApp.backgroundBlack,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
