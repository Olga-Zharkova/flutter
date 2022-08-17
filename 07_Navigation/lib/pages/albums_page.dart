import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled5/components/functions/fetch_file.dart';
import 'package:untitled5/components/widgets/containers/error_data/file_is_empty.dart';
import 'package:untitled5/components/widgets/containers/error_data/loading_data.dart';
import 'package:untitled5/components/widgets/containers/error_data/snapshot_has_error.dart';
import 'package:untitled5/components/widgets/containers/etc/artist_card.dart';

import 'package:untitled5/pages/my_drawer.dart';

class AlbumsPage extends StatefulWidget {
  static const routeName = '/albums';

  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  final ScrollController _controller = ScrollController(initialScrollOffset: 0);
  dynamic data;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
    data = fetchFileFromAssets('assets/data.json');
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
          future: data,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            // String? jsonData = snapshot.data;
            // print('jsonData_is_${jsonData}_.');
            if (snapshot.hasData) {
              String? jsonData = snapshot.data;
              if (jsonData == null || jsonData.isEmpty) {
                return const FileIsEmpty();
              } else {
                return ListView.builder(
                  controller: _controller,
                  itemCount: json.decode(jsonData).length,
                  itemBuilder: (context, index) => ArtistCard(
                    nameArtist: json.decode(jsonData)[index]['name'],
                    aboutArtist: json.decode(jsonData)[index]['about'],
                  ),
                );
              }
            } else {
              return (snapshot.hasError)
                  ? SnapshotHasError(error: {snapshot.error})
                  : const LoadingData();
            }
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
