import 'package:flutter/material.dart';

class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({
    Key? key,
    required this.textTitle,
    required this.description,
    required this.imageURL,
  }) : super(key: key);

  final String textTitle;
  final String imageURL;
  final String description;
  final double _heighSliverAppBar = 150;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: _heighSliverAppBar,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              textTitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            background: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: _heighSliverAppBar,
                  color: Colors.black38,
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
