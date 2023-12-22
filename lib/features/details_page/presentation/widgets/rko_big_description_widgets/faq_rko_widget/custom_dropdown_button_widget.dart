import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class CustomDropdownButtonWidget extends StatefulWidget {
  bool isOpen;

  CustomDropdownButtonWidget({
    super.key,
    required this.isOpen,
  });

  @override
  State<CustomDropdownButtonWidget> createState() =>
      _CustomDropdownButtonWidgetState();
}

class _CustomDropdownButtonWidgetState
    extends State<CustomDropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          widget.isOpen = !widget.isOpen;
        });
      },
      padding: const EdgeInsets.only(left: 15, right: 15,top: 18, bottom: 18),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Бывают ли белыми негры?'),
              const Spacer(),
              RotationTransition(
                  turns:
                      AlwaysStoppedAnimation(widget.isOpen ? 0 / 360 : 45 / 360),
                  child: SvgPicture.asset(
                    'assets/icons/delete_icon.svg',
                    color: ThemeApp.backgroundBlack,
                  ))
            ],
          ),
          widget.isOpen
              ? const Padding(
                padding: EdgeInsets.only(top: 26),
                child: Text(
                    'Да бывает такое, что у чернокожих родителей рождается белокожий ребенок. Такое состояние называется альбинизм - полное отсутствие меланина в организме. Жизнь негров-альбиносов далеко не сладкая: они страдают от солнечных ожогов так, как у них вообще нет защиты от жестокого африканского солнца, и имееют проблемы со зрением.'),
              )
              : const SizedBox.shrink(),
        ],

      ),
    );
  }
}
