import 'package:boxy/slivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';

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
            title: Text('Все банки'),
            leading: IconButton(
              onPressed: () {
                ref.read(goRouterProvider).pop();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          SliverContainer(
              margin: const EdgeInsets.only(top: 2, bottom: 72),
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeApp.mainWhite,
                ),
              ),
              sliver: SliverPadding(
                padding: const EdgeInsets.only(
                    top: 15, right: 15, left: 15, bottom: 9),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 10,
                    (context, index) => Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          ref
                              .watch(bankFromAllBanksStateProvider.notifier)
                              .state = 'Тинькофф Банк';
                          ref.watch(goRouterProvider).push('/catalog',
                              extra: AppRoute.allBanksPage.name);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 6),
                          padding: EdgeInsets.only(
                              top: 15, left: 15, bottom: 15, right: 20),
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFBE0B),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 9, right: 7, left: 7, bottom: 9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: ThemeApp.mainWhite,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/tinkoff_logo_icon.svg',
                                  height: 32,
                                  width: 36,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Тинькофф банк',
                                style: TextStyle(
                                    color: ThemeApp.mainWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Icon(
                                Icons.star,
                                color: ThemeApp.mainWhite,
                                size: 20,
                              ),
                              Text(
                                '4.8',
                                style: TextStyle(
                                    color: ThemeApp.mainWhite,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
