import 'package:flutter/material.dart';
import 'package:val1/components/widgets/widgets_card_animation/icon_add_article.dart';
import 'package:val1/models/article.dart';

class FullDescriptionArticle extends StatelessWidget {
  final Article article;

  const FullDescriptionArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    const double sizeIcon = 70;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: 'image-${article.id}',
                  child: Image.asset(article.image, fit: BoxFit.fitWidth),
                ),
                IconAddArticle(paddingRight: 30, size: sizeIcon, id: article.id),
              ],
            ),
            const SizedBox(height: sizeIcon/2+10),
            Hero(
              tag: 'description-${article.id}',
              child: Material(
                child: Text(
                  article.description,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
