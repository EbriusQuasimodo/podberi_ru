import 'package:flutter/material.dart';
import 'package:podberi_ru/core/data/api_exception.dart';
import 'package:podberi_ru/core/presentation/custom_error_card_widget.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class OnErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback onRefreshButtonTap;
  final VoidCallback onGoBackButtonTap;

  const OnErrorWidget({
    super.key,
    required this.error,
    required this.onGoBackButtonTap,
    required this.onRefreshButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    if (error == NothingFoundException().message) {
      return Container(
        margin: const EdgeInsets.only(top: 2, bottom: 72),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 57, left: 57),
            child: Text(error.toString()),
          ),
        ),
      );
    } else if (error.toString() == NoInternetConnectionException().message) {
      return CustomErrorPageWidget(
        buttonName: 'Перезагрузить',
        onTap: () {
          onRefreshButtonTap();
        },
        error: error.toString(),
        bottomPadding: 72,
      );
    }
    return CustomErrorPageWidget(
      buttonName: 'Вернуться',
      onTap: () {
        onGoBackButtonTap();
      },
      error: error.toString(),
      bottomPadding: 72,
    );
  }
}
