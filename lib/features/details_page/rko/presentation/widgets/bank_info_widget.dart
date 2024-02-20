import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberi_ru/core/constants/urls.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';

class RkoBankInfoWidget extends StatelessWidget {
  final BasicApiPageSettingsModel basicApiPageSettingsModel;

  const RkoBankInfoWidget({
    super.key,
    required this.basicApiPageSettingsModel,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeApp.mainWhite,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeApp.grey,
                  ),
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.only(
                      top: 10.5, bottom: 11.5, right: 8.63, left: 9.16),
                  child: Image.network(
                    '${Urls.api.files}/${basicApiPageSettingsModel.bankDetailsModel?.logo}',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return SvgPicture.asset(
                        'assets/icons/photo_not_found.svg',
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeApp.grey,
                      ),
                      height: 60,
                      padding: const EdgeInsets.only(
                          top: 22, bottom: 21, right: 15, left: 15),
                      child:  Text(
                        basicApiPageSettingsModel.bankDetailsModel!.bankName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ThemeApp.backgroundBlack),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
