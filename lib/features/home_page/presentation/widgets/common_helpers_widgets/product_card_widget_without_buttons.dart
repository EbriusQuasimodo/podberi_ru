import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class BankProductCardWidgetWithoutButtons extends StatelessWidget {
  final String productName;
  final String productShortDescription;
  final String productRating;
  final String bankLogoIconPath;
  final VoidCallback onTap;
  const BankProductCardWidgetWithoutButtons({super.key,required this.onTap, required this.productName, required this.productShortDescription, required this.productRating, required this.bankLogoIconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffFFBE0B),
      ),
      width: 280,
      height: 190,
      margin: const EdgeInsets.only(right: 3, left: 3),
      child: Stack(
        children: [

          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 9, right: 7, left: 7, bottom: 9),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ThemeApp.mainWhite,),
              child: SvgPicture.asset(
                  bankLogoIconPath, height: 32,width: 36,),
            ),
          ),

          Positioned(
            left: 16,
            top: 16,
            right: 86,
            child: Text(
              productName,
              maxLines: 3,
              style: TextStyle(
                  color: ThemeApp.mainWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
           Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              productShortDescription,
              style: TextStyle(
                  color: ThemeApp.mainWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              right: 16,
              bottom: 16,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: ThemeApp.mainWhite,
                    size: 20,
                  ),
                  Text(
                    productRating,
                    style: TextStyle(
                        color: ThemeApp.mainWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )
                ],
              )),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  onTap();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
