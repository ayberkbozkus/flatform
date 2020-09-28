import 'package:flatform/widgets/tabBar/tab_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CustomBottomNavigation extends StatelessWidget {

  final TabItems currentTab;
  final ValueChanged<TabItems> onSelectedTab;
  final Map<TabItems, Widget> pageCreator;

  const CustomBottomNavigation({Key key,@required this.currentTab,@required this.onSelectedTab,@required this.pageCreator}) : super(key: key);

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
        
        final showItem = TabItems.values[index];
        
        return CupertinoTabView(
          builder: (context) {return pageCreator[showItem];}
        );
      },
    );
  }

  BottomNavigationBarItem _navItemCreater(TabItems tabItem) {
    final createdTab = TabItemData.allTabs[tabItem];
    return BottomNavigationBarItem(icon: Icon(createdTab.icon), title: Text(createdTab.title),);
  }
}