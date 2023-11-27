import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class CustomAppBarWithSearch extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final double topPadding;
  final double bottomPadding;

  const CustomAppBarWithSearch({
    super.key,
    required this.controller,
    required this.title,
    required this.bottomPadding,
    required this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        color: ThemeApp.mainWhite,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: bottomPadding, bottom: bottomPadding, left: 15, right: 15),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: TextFormField(
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                controller: controller,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'введите название продукта';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    fillColor: ThemeApp.grey,
                    filled: true,
                    counterText: '',
                    counterStyle: const TextStyle(fontSize: 0),
                    labelText: 'Введите название продукта',
                    labelStyle: const TextStyle(
                        color: ThemeApp.darkestGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    suffixIcon: MaterialButton(
                      shape: const CircleBorder(),
                      onPressed: () {},
                      child: SvgPicture.asset(
                        'assets/icons/search_icon.svg',
                        height: 24,
                        width: 24,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
