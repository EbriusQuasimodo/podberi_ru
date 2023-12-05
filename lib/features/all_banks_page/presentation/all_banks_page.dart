import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/widgets/all_banks_list_widget.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';

///all bank page. when press on bank card go to [CatalogPage] with selected bank name
class AllBanksPage extends ConsumerWidget {
  const AllBanksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: ThemeApp.mainWhite,
            pinned: true,
            title: const Text('Все банки'),
            leading: IconButton(
              onPressed: () {
                ref.read(goRouterProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          const AllBanksListWidget(),
        ],
      ),
    );
  }
}
