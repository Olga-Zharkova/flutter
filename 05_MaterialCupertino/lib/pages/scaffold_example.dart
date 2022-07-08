import 'package:flutter/material.dart';
import 'package:untitled2/pages/end_drawer_menu.dart';
import 'package:untitled2/pages/start_drawer_menu.dart';
import 'package:untitled2/data_types/tabltem.dart';

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
  final List<TabItem> _tabBar = [
    TabItem(title: 'Photo', icon: const Icon(Icons.home)),
    TabItem(title: 'Chat', icon: const Icon(Icons.chat)),
    TabItem(title: 'Albums', icon: const Icon(Icons.album)),
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
          child: bottomSheet(),
        ),
      );
    }
  }

  //выезжающая область после нажатия на кнопку +
  Widget bottomSheet() {
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
            onPressed: () {
              _controller?.close();
              _controller = null;
              setState(() => _shouldShow = true);
            },
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

  //главная панель приложения
  Widget mainAppBar() {
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

  //кнопки нижней панели экрана
  Widget mainBottomAppBar() {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        onTap: (index) {
          setState(
            () {
              _tabController.index = index;
              _currentTabIndex = index;
            },
          );
        },
        currentIndex: _currentTabIndex,
        items: [
          for (final item in _tabBar)
            BottomNavigationBarItem(icon: item.icon, label: item.title)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75.0),
        child: mainAppBar(),
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
      bottomNavigationBar: mainBottomAppBar(),
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
