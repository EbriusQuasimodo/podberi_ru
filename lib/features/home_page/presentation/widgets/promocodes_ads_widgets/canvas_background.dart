import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class CanvasBackground extends ConsumerStatefulWidget {
  ///канвас для рисования изогнутой линии в карточке промокодлов на главной странице
  const CanvasBackground({super.key});

  @override
  ConsumerState<CanvasBackground> createState() => _CanvasBackgroundState();
}

class _CanvasBackgroundState extends ConsumerState<CanvasBackground> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalTopBorderClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
          color: ThemeApp.orange,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/sushi_image.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
              filterQuality: FilterQuality.high,
            ),
            //SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.only(top:22.0, bottom: 21),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    ref
                        .watch(goRouterProvider)
                        .go(RouteConstants.selectCategoryPromocodes);
                  },
                  child: Text(
                    'Подробнее',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ThemeApp.mainWhite,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
