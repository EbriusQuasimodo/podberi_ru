import 'package:flutter/material.dart';
import 'package:podberi_ru/core/presentation/custom_choice_chip.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_and_product_type_widget/bank_info_card.dart';

class BankAndProductTypeWidget extends StatefulWidget {
  final VoidCallback onTap;

  const BankAndProductTypeWidget({super.key, required this.onTap});

  @override
  State<BankAndProductTypeWidget> createState() =>
      _BankAndProductTypeWidgetState();
}

class _BankAndProductTypeWidgetState extends State<BankAndProductTypeWidget> {
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'РКО'
  ];

  List<String> selectedBankProducts = [];

  List<Widget> list() {
    ///creating list of product type (filter) with unknown height
    var list = <Widget>[
      const SizedBox(width: 15)
    ]; //sized box is a padding on start

    for (var element in bankProductsNamesList) {
      list.add(CustomChoiceChip(
        onTap: () {
          setState(() {});
        },
        element: element,
        selectedBankProducts: selectedBankProducts,
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
        const BankInfoCard(),
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
