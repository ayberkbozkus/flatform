import 'package:flatform/widgets/tabBar/tab_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CustomBottomNavigation extends StatelessWidget {

  final TabItems currentTab;
  final ValueChanged<TabItems> onSelectedTab;

  const CustomBottomNavigation({Key key,@required this.currentTab,@required this.onSelectedTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        _navItemCreater(TabItems.Home),
        _navItemCreater(TabItems.Notification),
        _navItemCreater(TabItems.Ticket),
      ],
      onTap: (index)=>onSelectedTab(TabItems.values[index]),),
      tabBuilder: (context,index) {
        return CupertinoTabView(
          builder: (context) => Container  (child: Text('deneme'),),
        );
      },
    );
  }

  BottomNavigationBarItem _navItemCreater(TabItems tabItem) {
    final createdTab = TabItemData.allTabs[tabItem];
    return BottomNavigationBarItem(icon: Icon(createdTab.icon), title: Text(createdTab.title),);
  }
}