import 'package:flutter/material.dart';
import 'package:podberi_ru/core/styles/theme_app.dart';
import 'package:podberi_ru/features/home_page/presentation/widgets/blog_widgets/blog_button_widget.dart';

class BlogWidget extends StatelessWidget {
  ///blog with news widget
  const BlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:Container(
        margin: EdgeInsets.only(top: 2, bottom: MediaQuery.of(context).padding.bottom),
        padding: const EdgeInsets.only(top: 30, bottom: 21),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.mainWhite,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 22,
              ),
              child: Text(
                'Блог',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return const BlogButtonWidget();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 22,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: const Text(
                    "Читать блог",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
