import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  final String nameArtist;
  final String aboutArtist;

  const ArtistCard(
      {super.key, required this.nameArtist, required this.aboutArtist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/description_artist',
          arguments: {
            'aboutArtist': aboutArtist,
            'nameArtist': nameArtist,
          },
        );
      },
      child: ListTile(
        title: Text(nameArtist),
      ),
    );
  }
}
