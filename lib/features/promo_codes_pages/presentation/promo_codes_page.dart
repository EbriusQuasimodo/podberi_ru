import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class PromoCodesPage extends StatelessWidget {
  const PromoCodesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: Text('Промокоды'),
          ),
        ],
      ),
    );
  }
}
