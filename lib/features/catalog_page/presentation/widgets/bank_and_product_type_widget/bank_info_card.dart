import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class BankInfoCard extends StatelessWidget {
  const BankInfoCard({super.key});

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
            child: SvgPicture.asset(
              'assets/icons/tinkoff_logo_icon.svg',
              height: 32,
              width: 36,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text(
            'Тинькофф банк',
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
