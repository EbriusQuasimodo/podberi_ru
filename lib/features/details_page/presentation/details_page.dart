import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/details_page/domain/details_parameters_model.dart';
import 'package:podberi_ru/features/details_page/presentation/widgets/card_info_widget.dart';
import 'package:podberi_ru/features/details_page/presentation/widgets/card_preview_widget.dart';
import 'package:podberi_ru/features/details_page/presentation/widgets/conditions_widget.dart';

import 'details_controller.dart';

class DetailsPage extends ConsumerStatefulWidget {
  final DetailsParameters detailsParameters;

  const DetailsPage({super.key, required this.detailsParameters});

  @override
  ConsumerState<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return ref
        .watch(productDetailsControllerProvider(widget.detailsParameters))
        .when(
      data: (detailsInfo) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                scrolledUnderElevation: 0,
                backgroundColor: ThemeApp.mainWhite,
                pinned: true,
                title: Text('Детали'),
              ),
              CardPreviewWidget(
                productInfo: detailsInfo[0],
                bankName: widget.detailsParameters.bankName!,
              ),

              ///if bank card has custom designs - display widget with remainder of it
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 2),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeApp.mainWhite,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 21, bottom: 22, left: 15, right: 15),
                    child: Text(
                      'Есть возможность кастомизации дизайна',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ThemeApp.mainBlue),
                    ),
                  ),
                ),
              ),
              CardInfoWidget(
                productInfo: detailsInfo[0],
                bankLogoPath: widget.detailsParameters.bankLogoPath!,
                bankName: widget.detailsParameters.bankName!,
              ),
              ConditionsWidget(
                productInfo: detailsInfo[0],
              ),
            ],
          ),
        );
      },
      error: (error, _) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString())),
          );
        });
        return Scaffold(
          body: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                scrolledUnderElevation: 0,
                backgroundColor: ThemeApp.mainWhite,
                pinned: true,
                title: Text(widget.detailsParameters.whereFrom!),
                leading: IconButton(
                  onPressed: () {
                    ref.read(goRouterProvider).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  margin: const EdgeInsets.only(top: 2, bottom: 72),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeApp.mainWhite,
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: Text('Произошла какая-то ошибка(((('),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
