import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
///промокодов временно не будет ( планируется добавить после релиза мвп)
class PromoCodesCardWidget extends ConsumerWidget {
  final String productName;
  final String productShortDescription;
  final String companyLogoIconPath;
  final Color color;
  const PromoCodesCardWidget({super.key, required this.productName, required this.productShortDescription, required this.companyLogoIconPath, required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      width: 280,
      height: 190,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(
                  //     color: ThemeApp.mainWhite,
                  //     width: 10),
                 color: ThemeApp.mainWhite,),
              child: SvgPicture.asset(
                companyLogoIconPath,
                color: color,
                height: 50,
                width: 50,
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 15,
            right: 86,
            child: Text(
              productName,
              maxLines: 3,
              style: TextStyle(
                  color: ThemeApp.mainWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          Positioned(
            left: 15,
            top: 53,

            child: Text(
            'До 21.12.2023',
              style: TextStyle(
                  color: ThemeApp.mainWhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 11),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 15,
            right: 84,
            child: Text(
              productShortDescription,
              style: TextStyle(
                  color: ThemeApp.mainWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Positioned(
              right: 15,
              bottom: 15,
              child: MaterialButton(
                color: ThemeApp.mainWhite,
                padding: EdgeInsets.zero,
                height: 40,
                minWidth: 40,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                onPressed: () {
                  // ref
                  //     .watch(goRouterProvider)
                  //     .push(RouteConstants.promocodesDetails);
                },
                child: Icon(Icons.arrow_forward_ios)
              )),
        ],
      ),
    );
  }
}
