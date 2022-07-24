import 'package:flutter/material.dart';
import 'package:untitled2/pages/end_drawer_menu.dart';
import 'package:untitled2/pages/start_drawer_menu.dart';
import 'package:untitled2/data_types/tab_item.dart';

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  State<ScaffoldExample> createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;
  bool _shouldShow = true;
  late TabController _tabController;
  int _currentTabIndex = 0;
  final List<TabItem> _tabBar = const [
    TabItem(title: 'Photo', icon: Icon(Icons.home)),
    TabItem(title: 'Chat', icon: Icon(Icons.chat)),
    TabItem(title: 'Albums', icon: Icon(Icons.album)),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void toggleBottomSheet() {
    if (_controller == null) {
      setState(() => _shouldShow = false);
      _controller = scaffoldKey.currentState?.showBottomSheet(
        (context) => Container(
          color: Colors.blue.shade50,
          height: MediaQuery.of(context).size.height * 0.25,
          child: BottomSheet(
            onTap: onTapOnBottomSheet,
          ),
        ),
      );
    }
  }

//действие при нажатии на кнопку
  void onTapOnBottomAppBar(int index) {
    setState(
      () {
        _tabController.index = index;
        _currentTabIndex = index;
      },
    );
  }

  //действие при нажатии на кнопку + в выезжающем меню
  void onTapOnBottomSheet() {
    _controller?.close();
    _controller = null;
    setState(() => _shouldShow = true);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75.0),
        child: MainAppBar(
          openEndDrawer: openEndDrawer,
        ),
      ),
      drawer: const StartDrawerMenu(),
      endDrawer: const EndDrawerMenu(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(
            child: Text('1'),
          ),
          Center(
            child: Text('2'),
          ),
          Center(
            child: Text('3'),
          ),
        ],
      ),
      bottomNavigationBar: MyBottonBar(
        onTap: onTapOnBottomAppBar,
        tabBarItems: _tabBar,
        currentTabIndex: _currentTabIndex,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _shouldShow
          ? FloatingActionButton(
              onPressed: toggleBottomSheet,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

//кнопки нижней панели экрана
class MyBottonBar extends StatelessWidget {
  const MyBottonBar(
      {Key? key,
      required this.onTap,
      required this.currentTabIndex,
      required this.tabBarItems})
      : super(key: key);

  final Function(int) onTap;
  final int currentTabIndex;
  final List<TabItem> tabBarItems;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentTabIndex,
        items: [
          for (final item in tabBarItems)
            BottomNavigationBarItem(icon: item.icon, label: item.title)
        ],
      ),
    );
  }
}

//главная панель приложения
class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key, required this.openEndDrawer}) : super(key: key);

  final Function() openEndDrawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Flutter Demo Home Page',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: openEndDrawer,
          icon: const Icon(
            Icons.person,
            size: 35,
          ),
        ),
      ],
    );
  }
}

//выезжающая область после нажатия на кнопку +
class BottomSheet extends StatelessWidget {
  const BottomSheet({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(flex: 1, child: Icon(Icons.layers_outlined)),
            Expanded(
              flex: 4,
              child: Text('Сумма'),
            ),
            Expanded(
              flex: 1,
              child: Text('200 руб'),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        SizedBox(
          height: 50,
          width: 100,
          child: FloatingActionButton(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            onPressed: onTap,
            backgroundColor: Colors.grey.shade200,
            child: const Text(
              'Оплатить',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


//бывшие виджеты в виде ф-ций
//выезжающая область после нажатия на кнопку +
// Widget bottomSheet() {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           Expanded(flex: 1, child: Icon(Icons.layers_outlined)),
//           Expanded(
//             flex: 4,
//             child: Text('Сумма'),
//           ),
//           Expanded(
//             flex: 1,
//             child: Text('200 руб'),
//           ),
//         ],
//       ),
//       const Padding(padding: EdgeInsets.only(top: 20)),
//       SizedBox(
//         height: 50,
//         width: 100,
//         child: FloatingActionButton(
//           elevation: 1,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//           onPressed: () {
//             _controller?.close();
//             _controller = null;
//             setState(() => _shouldShow = true);
//           },
//           backgroundColor: Colors.grey.shade200,
//           child: const Text(
//             'Оплатить',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

//главная панель приложения
// Widget mainAppBar() {
//   return AppBar(
//     title: const Text(
//       'Flutter Demo Home Page',
//       style: TextStyle(
//         fontSize: 18,
//       ),
//     ),
//     centerTitle: true,
//     actions: [
//       IconButton(
//         onPressed: openEndDrawer,
//         icon: const Icon(
//           Icons.person,
//           size: 35,
//         ),
//       ),
//     ],
//   );
// }

// //кнопки нижней панели экрана
// Widget mainBottomAppBar() {
//   return BottomAppBar(
//     clipBehavior: Clip.antiAlias,
//     child: BottomNavigationBar(
//       onTap: (index) {
//         setState(
//           () {
//             _tabController.index = index;
//             _currentTabIndex = index;
//           },
//         );
//       },
//       currentIndex: _currentTabIndex,
//       items: [
//         for (final item in _tabBar)
//           BottomNavigationBarItem(icon: item.icon, label: item.title)
//       ],
//     ),
//   );
// }