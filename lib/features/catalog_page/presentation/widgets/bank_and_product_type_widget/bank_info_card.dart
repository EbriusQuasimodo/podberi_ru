import 'package:flutter/material.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class BankInfoCard extends StatelessWidget {
  final String bankName;
  final String bankPicture;
  const BankInfoCard({super.key, required this.bankName, required this.bankPicture});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(
          right: 15, left: 15, bottom: 15, top: 15),
      padding: const EdgeInsets.only(
          top: 15, right: 20, left: 15, bottom: 15),
      decoration: BoxDecoration(
          color: ThemeApp.grey,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 9, right: 7, left: 7, bottom: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ThemeApp.mainWhite,
            ),
            child:Image.network(
              '${Urls.api.files}/${bankPicture}',
              height: 32,
              width: 36,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
         Text(
            bankName,
            style: TextStyle(
                color: ThemeApp.backgroundBlack,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const Icon(
            Icons.star,
            color: ThemeApp.backgroundBlack,
            size: 20,
          ),
          const Text(
            '4.8',
            style: TextStyle(
                color: ThemeApp.backgroundBlack,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          )
        ],
      ),
    );
  }
}
