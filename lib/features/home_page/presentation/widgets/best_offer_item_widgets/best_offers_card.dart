import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class BestOffersCardWidget extends StatelessWidget {
  const BestOffersCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeApp.backgroundBlack,
      ),
      width: double.infinity,
height: 220,
      margin: const EdgeInsets.only(right: 3, left: 3),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/debet_card_tink_image.png'),
            ),
          ),
          const Positioned(
            left: 20,
            top: 20,
            right: 20,
            child: Text(
              'Тинькофф Black - повышенный кэшбек на выбранную категорию',
              maxLines: 3,
              style: TextStyle(
                  color: ThemeApp.mainWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
           Positioned(
            left: 20,
            bottom: 20,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: Text(
                  'ПОДРОБНЕЕ',
                  style: TextStyle(color: ThemeApp.mainWhite, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
