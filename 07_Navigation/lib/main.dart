import 'package:flutter/material.dart';
import 'package:navigation/pages/albums_page.dart';
import 'package:navigation/pages/description_artist.dart';
import 'package:navigation/pages/home_page.dart';
import 'package:navigation/pages/my_drawer.dart';
import 'package:navigation/pages/not_found.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings setting) {
        switch (setting.name) {
          case HomePage.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            );
          case AlbumsPage.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) => const AlbumsPage(),
            );
          case  DescriptionArtist.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) => const  DescriptionArtist(),
            );
          default: const NotFound();
        }
      },
    ),
  );
}
