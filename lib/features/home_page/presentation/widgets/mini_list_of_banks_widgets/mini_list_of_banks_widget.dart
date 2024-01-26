import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/route_constants.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/mini_list_of_banks_widgets/mini_bank_button_widget.dart';

class MiniListOfBanksWidget extends ConsumerWidget {
  final List<BankListDetailsModel> banksModel;
  const MiniListOfBanksWidget({super.key, required this.banksModel,});
  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 12)
    ]; //sized box is a padding on start
    for (int i = 0; i < banksModel.length; i++) {
      list.add(MiniBankButtonWidget(banksModel: banksModel[i],)
      );
    }
    list.add(const SizedBox(
      width: 12,
    )); //add padding on end

    return list;
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        padding: const EdgeInsets.only(top: 30, bottom: 21),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 22,
                ),
                child: Text(
                  'Выберите банк',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: list(),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 22,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      ref.watch(goRouterProvider).go(RouteConstants.allBanks);
                    },
                    child: const Text(
                      'Все банки',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
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
