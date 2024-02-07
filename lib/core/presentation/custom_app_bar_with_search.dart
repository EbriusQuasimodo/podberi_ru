import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/shared_presentation/catalog_page.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page.dart';

class CustomAppBarWithSearch extends StatelessWidget {
  final TextEditingController controller;


  ///AppBar который используется на [HomePage] и [SelectProductTypePage], имеет в себе поле для поиска продукта по апишке.
  ///в результате поиска должен будет отправлять на страницу [CatalogPage]
  const CustomAppBarWithSearch({
    super.key,
    required this.controller,

  });

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            color: ThemeApp.mainWhite,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
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
            ],
          ),
        ),
      );
  }
}
