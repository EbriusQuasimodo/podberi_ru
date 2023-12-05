import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/presentation/widgets/card_info_widget.dart';
import 'package:podberi_ru/features/details_page/presentation/widgets/card_preview_widget.dart';
import 'package:podberi_ru/features/details_page/presentation/widgets/conditions_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Детали'),
          ),
          const CardPreviewWidget(),
          ///if bank card has custom designs - display widget with remainder of it
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeApp.mainWhite,
              ),
              child: const Padding(
                padding:
                    EdgeInsets.only(top: 21, bottom: 22, left: 15, right: 15),
                child: Text(
                  'Есть возможность кастомизации дизайна',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ThemeApp.mainBlue),
                ),
              ),
            ),
          ),
          const CardInfoWidget(),
          const ConditionsWidget(),
        ],
      ),
    );
  }
}
