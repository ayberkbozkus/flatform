import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum TabItems {Home, Notification, Ticket}

class TabItemData {
  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  static Map<TabItems, TabItemData> allTabs = {
    TabItems.Home : TabItemData('Home', Icons.home),
    TabItems.Notification : TabItemData('Notification', Icons.notifications),
    TabItems.Ticket : TabItemData('Ticket', Icons.message)
  };
}