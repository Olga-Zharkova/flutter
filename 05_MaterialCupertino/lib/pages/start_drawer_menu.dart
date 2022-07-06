import 'package:flutter/material.dart';

class StartDrawerMenu extends StatelessWidget {
  const StartDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 5)),
          const DrawerHeader(
              child: CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
                'https://www.itl.cat/pngfile/big/186-1861341_widescreen-road-scenery-hd.jpg'),
          )),
          const Padding(padding: EdgeInsets.only(top: 15)),
          ListTile(
              title: Text(
                'Home',
                style: TextStyle(fontSize: 22, color: Colors.grey.shade600),
              ),
              leading: const Icon(Icons.home, size: 40),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 40,
                ),
              )),
          const Padding(padding: EdgeInsets.only(top: 15)),
          ListTile(
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 22, color: Colors.grey.shade600),
            ),
            leading: const Icon(Icons.person, size: 40),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward, size: 40)),
          ),
          const Padding(padding: EdgeInsets.only(top: 15)),
          ListTile(
            title: Text(
              'Images',
              style: TextStyle(fontSize: 22, color: Colors.grey.shade600),
            ),
            leading: const Icon(Icons.image, size: 40),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward, size: 40)),
          ),
        ],
      ),
    );
  }
}
