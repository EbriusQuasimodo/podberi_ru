import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/catalog_page/presentation/widgets/bank_and_product_type_widget/bank_info_card.dart';

class BankAndProductTypeWidget extends StatefulWidget {
  final VoidCallback onTap;
  const BankAndProductTypeWidget({super.key,required this.onTap});

  @override
  State<BankAndProductTypeWidget> createState() => _BankAndProductTypeWidgetState();
}

class _BankAndProductTypeWidgetState extends State<BankAndProductTypeWidget> {
  final List<String> bankProductsNamesList = [
    'Дебетовые карты',
    'Кредитные карты',
    'РКО'
  ];
  List<String> selectedBankProducts = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       BankInfoCard(),
        SizedBox(
          height: 44,
          child: ListView.builder(
              padding:
              const EdgeInsets.only(left: 12, right: 12),
              itemCount: bankProductsNamesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        left: 3, right: 3),
                    child: ChoiceChip(
                      label: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 25),
                            child: Text(
                                bankProductsNamesList[index]),
                          ),
                          selectedBankProducts.contains(
                              bankProductsNamesList[index])
                              ? SvgPicture.asset(
                              'assets/icons/delete_icon.svg')
                              : const SizedBox.shrink(),
                        ],
                      ),
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: selectedBankProducts.contains(
                              bankProductsNamesList[index])
                              ? ThemeApp.mainWhite
                              : ThemeApp.backgroundBlack),
                      selected: selectedBankProducts.contains(
                          bankProductsNamesList[index]),
                      selectedColor: ThemeApp.mainBlue,
                      backgroundColor: ThemeApp.grey,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0,
                            color: Colors.transparent),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      showCheckmark: false,
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 15),
                      onSelected: (bool value) {
                        widget.onTap();
                        setState(() {
                          if (value) {
                            if (!selectedBankProducts.contains(
                                bankProductsNamesList[index])) {
                              selectedBankProducts.clear();
                              selectedBankProducts.add(
                                  bankProductsNamesList[index]);
                            }
                          } else {
                            selectedBankProducts
                                .removeWhere((String name) {
                              return name ==
                                  bankProductsNamesList[index];
                            });
                          }
                        });
                      },
                    ));
              }),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
