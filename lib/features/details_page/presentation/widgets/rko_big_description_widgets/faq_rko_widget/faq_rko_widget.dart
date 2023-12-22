import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/presentation/widgets/rko_big_description_widgets/faq_rko_widget/custom_dropdown_button_widget.dart';

class FaqRkoWidget extends StatefulWidget {
  FaqRkoWidget({super.key});

  @override
  State<FaqRkoWidget> createState() => _FaqRkoWidgetState();
}

class _FaqRkoWidgetState extends State<FaqRkoWidget> {
  bool isOpenFirstFaq = false;
  bool isOpenSecondFaq = false;
  bool isOpenThirdFaq = false;
  bool isOpenFourthFaq = false;
  bool isOpenFifthFaq = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        margin: const EdgeInsets.only(top: 2, bottom: 72),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Text(
                'Частые вопросы',
                style: TextStyle(
                    color: ThemeApp.backgroundBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
            Container(
              height: 2,
              color: ThemeApp.grey,

            ),
            CustomDropdownButtonWidget(isOpen: isOpenFirstFaq),
            Container(
              height: 2,
              color: ThemeApp.grey,

            ),
            CustomDropdownButtonWidget(isOpen: isOpenSecondFaq),
            Container(
              height: 2,
              color: ThemeApp.grey,

            ),
            CustomDropdownButtonWidget(isOpen: isOpenThirdFaq),
            Container(
              height: 2,
              color: ThemeApp.grey,

            ),
            CustomDropdownButtonWidget(isOpen: isOpenFourthFaq),
            Container(
              height: 2,
              color: ThemeApp.grey,

            ),
            CustomDropdownButtonWidget(isOpen: isOpenFifthFaq),
            Container(
              height: 2,
              color: ThemeApp.grey,

            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 30,
                left: 15, right: 15
              ),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                onPressed: (){},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                color: ThemeApp.mainBlue,
                child: const Text('Открыть счет', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: ThemeApp.mainWhite),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
