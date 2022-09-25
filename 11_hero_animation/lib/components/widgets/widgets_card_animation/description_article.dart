import 'package:flutter/material.dart';

class DescriptionArticle extends StatelessWidget {
  final double paddingLeft;
  final double paddingRight;
  final String description;
  final int id;

  const DescriptionArticle({
    super.key,
    required this.paddingLeft,
    required this.paddingRight,
    required this.description,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: 'description-$id',
        child: Padding(
          padding: EdgeInsets.fromLTRB(paddingLeft, 10, paddingRight, 10),
          child: Center(
            child: Material(
              color: Colors.grey[400],
              child: Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
