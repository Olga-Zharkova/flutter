import 'package:flutter/material.dart';
import 'package:untitled2/pages/end_drawer_menu.dart';
import 'package:untitled2/pages/start_drawer_menu.dart';
import 'package:untitled2/data_types/tab_item.dart';
import 'package:untitled2/components/widgets/containers/etc/my_bottom_sheet.dart';
import 'package:untitled2/components/widgets/containers/etc/main_app_bar.dart';
import 'package:untitled2/components/widgets/containers/etc/my_botton_bar.dart';

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
          child: MyBottomSheet(
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
