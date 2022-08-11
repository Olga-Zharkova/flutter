import 'package:flutter/material.dart';

class DescriptionArtist extends StatelessWidget {
  static const routeName = '/description_artist';
  final String aboutArtist;
  final String nameArtist;

  const DescriptionArtist(
      {super.key, required this.aboutArtist, required this.nameArtist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: Text('artist ${nameArtist.toString()}'),
        centerTitle: true,
        backgroundColor: Colors.purple.shade500,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(
              aboutArtist,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
