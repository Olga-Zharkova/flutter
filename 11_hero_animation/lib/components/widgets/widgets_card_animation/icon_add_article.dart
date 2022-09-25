import 'package:flutter/material.dart';

class IconAddArticle extends StatelessWidget {
  final double size;
  final double paddingRight;
  final int id;

  const IconAddArticle({
    super.key,
    required this.size,
    required this.paddingRight,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -size / 2,
      right: paddingRight,
      child: Hero(
        tag: 'icon-$id',
        child: Material(
          child: Container(
            height: size,
            width: size,
            color: Colors.yellow,
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: size / 2,
            ),
          ),
        ),
      ),
    );
  }
}
