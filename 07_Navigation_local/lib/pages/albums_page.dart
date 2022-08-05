import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled5/components/widgets/containers/etc/artist_card.dart';
import 'package:untitled5/models/data.dart';
import 'package:untitled5/pages/my_drawer.dart';

class AlbumsPage extends StatefulWidget {
  static const routeName = '/albums';

  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  final ScrollController _controller = ScrollController(initialScrollOffset: 0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final _artists = json.decode(jsonString);

  //ругается на асинхронную функцию, нельзя так получить данные
  //final Future<List> _jsonData = json.decode(fetchFileFromAssets('../models/data.json') as String);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.purple.shade50,
      appBar: AppBar(backgroundColor:  Colors.purple.shade500,),
      body: SafeArea(
        child: ListView.builder(
          controller: _controller,
          itemCount: _artists.length,
          itemBuilder: (context, index) => ArtistCard(
            nameArtist: _artists[index]['name'],
            aboutArtist: _artists[index]['about'],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
