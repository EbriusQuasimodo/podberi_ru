import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class SaveButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SaveButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: ThemeApp.mainWhite,
      ),
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              child: MaterialButton(
                height: 50,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: ThemeApp.mainBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: const Text(
                  'Применить',
                  style: TextStyle(
                      color: ThemeApp.mainWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 15, bottom: 15),
            child: Material(
              borderRadius: BorderRadius.circular(14),
              color: ThemeApp.grey,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  onTap();

                },
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(
                    'assets/icons/trash_icon.svg',
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
