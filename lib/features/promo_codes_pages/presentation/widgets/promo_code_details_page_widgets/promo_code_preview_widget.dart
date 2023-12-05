import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class PromoCodePreviewWidget extends StatelessWidget {
  const PromoCodePreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
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
                      color: const Color(0xffFF5700),
                      borderRadius: BorderRadius.circular(14)),
                  margin: const EdgeInsets.only(left: 15, right: 6),
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
                          color: const Color(0xffFF5700),
                          borderRadius: BorderRadius.circular(14)),
                      margin: const EdgeInsets.only(
                        right: 15,
                      ),
                      padding: const EdgeInsets.only(top: 16, bottom: 17),
                      height: 50,
                      child: const Text(
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
              decoration: const BoxDecoration(
                color: Color(0xffFF5700),
              ),
              margin: const EdgeInsets.only(
                top: 15,
              ),
              padding: const EdgeInsets.only(
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
            const Padding(
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
            const Padding(
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
              margin: const EdgeInsets.only(right: 15, left: 15),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 15, left: 15, bottom: 15, right: 29),
                        child: Text('ILIKETOMOVEITMOVEIT',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: ThemeApp.backgroundBlack)),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: ThemeApp.mainWhite,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(8),
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
    );
  }
}
