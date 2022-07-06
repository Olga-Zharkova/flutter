import 'package:flutter/material.dart';

class EndDrawerMenu extends StatelessWidget {
  const EndDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                'https://www.sunhome.ru/i/wallpapers/27/devushki-v50.orig.jpg'),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Text(
            'Юлия',
            style: TextStyle(
              fontSize: 26,
            ),
          )
        ],
      ),
    );
  }
}
