import 'package:flutter/material.dart';

class StartDrawerMenu extends StatelessWidget {
  const StartDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView(
              children: const [
                DrawerHeader(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://www.itl.cat/pngfile/big/186-1861341_widescreen-road-scenery-hd.jpg'),
                  ),
                ),
                ComponentsDrawer(
                  title: 'Home',
                  iconLeading: Icon(Icons.home, size: 40),
                ),
                ComponentsDrawer(
                  title: 'Profile',
                  iconLeading: Icon(Icons.person, size: 40),
                ),
                ComponentsDrawer(
                  title: 'Images',
                  iconLeading: Icon(Icons.image, size: 40),
                ),
              ],
            ),
          ),
          //кнопки регитстрации и выхода в начальном меню навигации
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ButtonDrawer(title: 'Выход', width: 80),
                ButtonDrawer(title: 'Регистрация', width: 120),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ComponentsDrawer extends StatelessWidget {
  final String title;
  final Icon iconLeading;

  const ComponentsDrawer(
      {Key? key, required this.title, required this.iconLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.grey.shade600),
      ),
      leading: iconLeading,
      trailing: IconButton(
          onPressed: () {}, icon: const Icon(Icons.arrow_forward, size: 40)),
    );
  }
}

class ButtonDrawer extends StatelessWidget {
  final String title;
  final double width;

  const ButtonDrawer({Key? key, required this.title, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FloatingActionButton(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
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
