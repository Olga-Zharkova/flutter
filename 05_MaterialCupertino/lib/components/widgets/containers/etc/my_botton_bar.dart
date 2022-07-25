import 'package:flutter/material.dart';
import 'package:untitled2/data_types/tab_item.dart';

//кнопки нижней панели экрана
class MyBottonBar extends StatelessWidget {
  const MyBottonBar({
    Key? key,
    required this.onTap,
    required this.currentTabIndex,
    required this.tabBarItems,
  }) : super(key: key);

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
