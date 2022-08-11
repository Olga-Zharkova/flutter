import 'package:flutter/material.dart';
import 'package:untitled5/pages/albums_page.dart';
import 'package:untitled5/pages/description_artist.dart';
import 'package:untitled5/pages/home_page.dart';
import 'package:untitled5/pages/not_found.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
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
          case DescriptionArtist.routeName:
            final args = setting.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (BuildContext _) {
                if (args.containsKey('aboutArtist') &&
                    args.containsKey('nameArtist')) {
                  return DescriptionArtist(
                    aboutArtist: args['aboutArtist'],
                    nameArtist: args['nameArtist'],
                  );
                } else {
                  return const DescriptionArtist(
                      aboutArtist: 'Error', nameArtist: 'Error');
                }
              },
            );
          default:
            const NotFound();
        }
      },
    ),
  );
}
