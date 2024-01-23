import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip/custom_choice_chip.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_and_product_type_widget/bank_info_card.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

class BankAndProductTypeWidget extends ConsumerStatefulWidget {
  final VoidCallback onTap;
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  /// виджет с информацией о выбранном банке и также небольшой фильтр по типу продукта
  const BankAndProductTypeWidget({
    super.key,
    required this.onTap,
    required this.basicApiPageSettingsModel,
  });

  @override
  ConsumerState<BankAndProductTypeWidget> createState() =>
      _BankAndProductTypeWidgetState();
}

class _BankAndProductTypeWidgetState
    extends ConsumerState<BankAndProductTypeWidget> {
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'РКО',
    'Микрозаймы',
  ];
  List<String> selectedCategory = [];

  @override
  void didChangeDependencies() {
    setState(() {
      if (widget.basicApiPageSettingsModel.whereFrom == 'allBanksPage') {
        switch (
            ref.watch(productTypeUrlFromAllBanksStateProvider.notifier).state) {
          case 'debit_cards':
            selectedCategory.add('Дебетовые карты');
            break;
          case 'credit_cards':
            selectedCategory.add('Кредитные карты');
            break;
          case 'rko':
            selectedCategory.add('РКО');
            break;
          case 'zaimy':
            selectedCategory.add('Микрозаймы');
            break;
        }
      }
      if (widget.basicApiPageSettingsModel.whereFrom == 'homePageBanks') {
        switch (ref
            .watch(productTypeUrlFromHomeBanksStateProvider.notifier)
            .state) {
          case 'debit_cards':
            selectedCategory.add('Дебетовые карты');
            break;
          case 'credit_cards':
            selectedCategory.add('Кредитные карты');
            break;
          case 'rko':
            selectedCategory.add('РКО');
            break;
          case 'zaimy':
            selectedCategory.add('Микрозаймы');
            break;
        }
      }
    });

    super.didChangeDependencies();
  }

  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 15)
    ]; //sized box is a padding on start

    for (int i = 0; i < bankProductsNamesList.length; i++) {
      list.add(CustomChoiceChip(
        whereFrom: widget.basicApiPageSettingsModel.whereFrom!,
        onTap: () {
          setState(() {});
        },
        categoryName: bankProductsNamesList[i],
        selectedCategory: selectedCategory,
        bankProductsNamesList: bankProductsNamesList,
      ));
    }
    list.add(const SizedBox(
      width: 15,
    )); //add padding on end

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BankInfoCard(
          bankName: widget.basicApiPageSettingsModel.bankDetailsModel!.bankName,
          bankPicture:
              widget.basicApiPageSettingsModel.bankDetailsModel!.logo,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: list(),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
