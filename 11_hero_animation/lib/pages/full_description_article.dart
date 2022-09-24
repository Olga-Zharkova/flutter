import 'package:flutter/material.dart';
import 'package:val1/models/article.dart';

class FullDescriptionArticle extends StatelessWidget {
  final Article article;

  const FullDescriptionArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView(
          children: [
            Hero(
              tag: 'image-detail-${article.id}',
              child: Image.asset(article.image, fit: BoxFit.fitWidth),
            ),
            Hero(
              tag: 'description-detail-${article.id}',
              child: Text(
                article.description,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
