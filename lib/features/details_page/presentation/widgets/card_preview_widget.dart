import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class CardPreviewWidget extends StatefulWidget {
  const CardPreviewWidget({super.key});

  @override
  State<CardPreviewWidget> createState() => _CardPreviewWidgetState();
}

class _CardPreviewWidgetState extends State<CardPreviewWidget> {

  final _controllerBestOffers = PageController(
    viewportFraction: 0.9,
  );

  double currentPage = 0;

  @override
  void initState() {
    _controllerBestOffers.addListener(() {
      setState(() {
        currentPage = _controllerBestOffers.page!.toDouble();
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return       SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        padding: const EdgeInsets.only(top: 30, bottom: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Padding(
              padding:
              EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Text(
                'Тинькофф Black Super Premium Ultra Gaming 3000',
                textAlign: TextAlign.center,
                style:
                TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            ExpandablePageView(
                physics: const BouncingScrollPhysics(),
                controller: _controllerBestOffers,
                children: [
                  Image.asset('assets/images/product_photo.png'),
                  Image.asset('assets/images/product_photo.png'),
                  Image.asset('assets/images/product_photo.png'),
                  Image.asset('assets/images/product_photo.png'),
                ]),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                      (index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 4),
                      alignment: Alignment.centerLeft,
                      height: currentPage == index ? 10 : 8,
                      width: currentPage == index ? 10 : 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index
                            ? ThemeApp.backgroundBlack
                            : ThemeApp.darkestGrey,
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6, left: 15),
                    child: MaterialButton(
                      height: 50,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: ThemeApp.mainBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: const Text(
                        'Заказать карту',
                        style: TextStyle(
                            color: ThemeApp.mainWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(14),
                  color: ThemeApp.grey,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: SvgPicture.asset(
                        'assets/icons/nav_bar_icons/favorites_page.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(14),
                    color: ThemeApp.grey,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: SvgPicture.asset(
                          'assets/icons/nav_bar_icons/comparison_page.svg',
                          height: 24,
                          width: 24,
                        ),
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
