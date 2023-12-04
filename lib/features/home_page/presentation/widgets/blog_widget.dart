import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/common_helpers_widgets/standard_widget_with_list.dart';

///blog with news widget
class BlogWidget extends StatelessWidget {
  const BlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: StandardItemWithListWidget(
          bottomPadding: 72,
          widgetName: 'Блог',
          showMoreButtonName: "Читать блог",
          onTapShowMoreButton: () {},
          childOfList: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 230,
            margin: const EdgeInsets.only(right: 3, left: 3),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset('assets/images/blog_photo.png')),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ThemeApp.mainBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Центральный банк поднимает ставку, чтобы душить экономику',
                          maxLines: 3,
                          style: TextStyle(
                              color: ThemeApp.mainWhite,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          listHeight: 230),
    );
  }
}
