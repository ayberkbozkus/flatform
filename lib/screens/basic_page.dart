import 'package:flatform/screens/home_page.dart';
import 'package:flatform/screens/notification.dart';
import 'package:flatform/screens/user_transactions.dart';
import 'package:flatform/widgets/bottom_nav_bar.dart';
import 'package:flatform/widgets/tabBar/tab_items.dart';
import 'package:flutter/material.dart';


class BasicPage extends StatefulWidget {
  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {

  TabItems _currentTab = TabItems.Home;

  Map<TabItems, Widget> allPages () {
    
    return {
      TabItems.Home : HomePage(),
      TabItems.Notification : PersonNotification(),
      TabItems.Ticket : UserTransactions(),
    };

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: CustomBottomNavigation(pageCreator: allPages(), currentTab: _currentTab, onSelectedTab: (selectedTab) {

        setState(() {
          _currentTab = selectedTab;
        });

      }, ),
    );
  }
}