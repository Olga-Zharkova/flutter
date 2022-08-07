import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled5/components/widgets/containers/etc/artist_card.dart';
import 'package:untitled5/models/data.dart';
import 'package:untitled5/models/fetch_file.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade500,
      ),
      body: SafeArea(
        child: FutureBuilder<String>(
          future: fetchFileFromAssets('assets/data.json'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              String? jsonData = snapshot.data;
              return ListView.builder(
                controller: _controller,
                itemCount: json.decode(jsonData!).length,
                itemBuilder: (context, index) => ArtistCard(
                  nameArtist: json.decode(jsonData)[index]['name'],
                  aboutArtist: json.decode(jsonData)[index]['about'],
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ],
              );
            } else {
              return Column(
                children: const [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  )
                ],
              );
            }
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
