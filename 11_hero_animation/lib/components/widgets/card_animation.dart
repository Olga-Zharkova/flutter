import 'package:flutter/material.dart';
import 'package:val1/components/widgets/widgets_card_animation/description_article.dart';
import 'package:val1/models/article.dart';
import 'package:val1/pages/full_description_article.dart';

import 'widgets_card_animation/icon_add_article.dart';

import 'widgets_card_animation/image_article.dart';

class CardAnimation extends StatelessWidget {
  final Article article;

  const CardAnimation({super.key, required this.article});

  void geFullDescriptionArticle(BuildContext context, Article article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullDescriptionArticle(
          article: article,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 20;
    const double heightCard = 200;
    const double sizeButton = 60;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: InkWell(
        onTap: () => geFullDescriptionArticle(context, article),
        child: Container(
          height: heightCard,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
            color: Colors.grey[400],
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ImageArticle(
                        image: article.image,
                        id: article.id,
                        borderRadius: borderRadius),
                    IconAddArticle(
                      size: sizeButton,
                      paddingRight: borderRadius,
                      id: article.id,
                    ),
                  ],
                ),
              ),
              DescriptionArticle(
                paddingRight: borderRadius + sizeButton + 3,
                paddingLeft: borderRadius,
                description: article.description,
                id: article.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
