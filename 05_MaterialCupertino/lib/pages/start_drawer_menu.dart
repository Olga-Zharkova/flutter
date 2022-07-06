import 'package:flutter/material.dart';

class StartDrawerMenu extends StatelessWidget {
  const StartDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DrawerHeader(
              child: CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
                'https://www.itl.cat/pngfile/big/186-1861341_widescreen-road-scenery-hd.jpg'),
          )),
          Column(
            children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonDrawer(title: 'Выход', width: 80),
              ButtonDrawer(title: 'Регистрация', width: 120),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 1)),
        ],
      ),
    );
  }
}


class ButtonDrawer extends StatelessWidget {
  String title;
  double width;
  ButtonDrawer({Key? key, required this.title, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FloatingActionButton(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0)),
        onPressed: () {},
        backgroundColor: Colors.grey.shade200,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

