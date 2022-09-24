import 'package:flutter/material.dart';

class ImageArticle extends StatelessWidget {
  final String image;
  final double borderRadius;
  final int id;

  const ImageArticle({
    super.key,
    required this.borderRadius,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image-$id',
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
