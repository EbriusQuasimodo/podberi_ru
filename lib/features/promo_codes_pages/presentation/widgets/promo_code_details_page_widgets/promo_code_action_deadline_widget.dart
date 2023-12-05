import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class PromoCodeActionDeadlineWidget extends StatelessWidget {
  const PromoCodeActionDeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return       SliverToBoxAdapter(
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
    );
  }
}
