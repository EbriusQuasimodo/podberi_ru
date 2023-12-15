import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class HomeProductTypeCardWidget extends StatelessWidget {
  final String productName;
  final String imageAsset;
  final VoidCallback onTap;
  ///виджет кнопки с выбором категории или типа продуктка
  const HomeProductTypeCardWidget({super.key, required this.imageAsset, required this.productName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: ThemeApp.mainBlue,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: (){onTap();},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 20),
            child: Text(productName,style: const TextStyle(color: ThemeApp.mainWhite, fontWeight: FontWeight.w500, fontSize: 14),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 14, bottom: 14),
            child: SvgPicture.asset(imageAsset),
          )
        ],
      ),
    );
  }
}
