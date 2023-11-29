import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class RowDescriptionWidget extends StatelessWidget {
  final String rowName;
  final String rowDescription;

  const RowDescriptionWidget({
    super.key,
    required this.rowDescription,
    required this.rowName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                rowName,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                rowDescription,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
        Container(
          height: 2,
          color: ThemeApp.grey,
          margin: EdgeInsets.only(top: 12, bottom: 12),
        )
      ],
    );
  }
}
