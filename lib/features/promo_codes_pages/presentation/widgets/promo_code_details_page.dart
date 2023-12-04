import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/promo_codes_pages/presentation/promo_codes_controller.dart';

class PromoCodesDetailsPage extends ConsumerWidget {
  PromoCodesDetailsPage({super.key});

  late String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    category = ref.watch(promoCodesCategoryStateProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text(category),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 2),
              padding: const EdgeInsets.only(top: 15, bottom: 30),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFF5700),
                            borderRadius: BorderRadius.circular(14)),
                        margin: EdgeInsets.only(left: 15, right: 6),
                        height: 50,
                        width: 50,
                        child: SvgPicture.asset(
                          'assets/icons/promo_codes_icons/mnogo_lososya_logo.svg',
                          height: 38,
                          width: 38,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffFF5700),
                                borderRadius: BorderRadius.circular(14)),
                            margin: EdgeInsets.only(
                              right: 15,
                            ),
                            padding: EdgeInsets.only(top: 16, bottom: 17),
                            height: 50,
                            child: Text(
                              'Много лосося',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: ThemeApp.mainWhite),
                            )),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFF5700),
                    ),
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: Image.asset(
                      'assets/images/sushi_image.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 29, bottom: 30, right: 15, left: 15),
                    child: Text(
                      'МногоЛосося - получи скидку 400 руб. на первый заказ в приложении',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ThemeApp.backgroundBlack),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, right: 15, left: 15),
                    child: Text(
                      'Ваш промокод',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ThemeApp.darkestGrey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ThemeApp.grey,
                        borderRadius: BorderRadius.circular(14)),
                    margin: EdgeInsets.only(right: 15, left: 15),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, bottom: 15, right: 29),
                              child: Text('ILIKETOMOVEITMOVEIT',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeApp.backgroundBlack)),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: ThemeApp.mainWhite,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(8),
                                margin: const EdgeInsets.only(
                                    right: 15, top: 15, bottom: 15),
                                child: SvgPicture.asset(
                                  'assets/icons/copy_icon.svg',
                                  height: 24,
                                  width: 24,
                                )),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 2),
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 12, right: 12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, right: 3, left: 3),
                    child: Text(
                      'До конца акции',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: ThemeApp.backgroundBlack),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFF5700),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(
                            left: 3,
                            right: 3,
                          ),
                          padding: EdgeInsets.only(
                            top: 21,
                            bottom: 21,
                            right: 6,
                            left: 6,
                          ),
                          child: Text(
                            '8 д.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ThemeApp.mainWhite,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFF5700),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(
                            left: 3,
                            right: 3,
                          ),
                          padding: EdgeInsets.only(
                            top: 21,
                            bottom: 21,
                            right: 6,
                            left: 6,
                          ),
                          child: Text(
                            '16 ч.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ThemeApp.mainWhite,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFF5700),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(
                            left: 3,
                            right: 3,
                          ),
                          padding: EdgeInsets.only(
                            top: 21,
                            bottom: 21,
                            right: 6,
                            left: 6,
                          ),
                          child: Text(
                            '32 мин.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ThemeApp.mainWhite,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFF5700),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(
                            left: 3,
                            right: 3,
                          ),
                          padding: EdgeInsets.only(
                            top: 21,
                            bottom: 21,
                            right: 6,
                            left: 6,
                          ),
                          child: Text(
                            '18 сек.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ThemeApp.mainWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 2, bottom: 72),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 30, bottom: 20, left: 15, right: 15),
                      child: Text(
                        'Условия',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ThemeApp.backgroundBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
                    child: Text(
                      'Если ты еще никогда не заказывал в Много лосося, то оформи заказ на сумму от 600 рублей и получи скидку 400 рублей по промокоду. Стандартное время доставки – 60 минут. В отдельных зонах время доставки может быть увеличено до 95 минут – узнать, к какой зоне относится ваш адрес, вы можете в приложении. Минимальная сумма доставки — 600 рублей, но она может варьироваться в зависимости от зоны доставки. Акция доступна новым клиентам в Москве и Санкт-Петербурге.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: ThemeApp.backgroundBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6, left: 15, right: 15),
                    child: Text(
                      'Реклама ООО “Много Лосося”',
                      //textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ThemeApp.darkestGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    child: Text(
                      'ИНН 9704003050',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ThemeApp.darkestGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
