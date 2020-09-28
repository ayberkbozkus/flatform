import 'package:flatform/widgets/bottom_nav_bar.dart';
import 'package:flatform/widgets/tabBar/tab_items.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TabItems _currentTab = TabItems.Home;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: CustomBottomNavigation(currentTab: _currentTab, onSelectedTab: (selectedTab) {

        setState(() {
          _currentTab = selectedTab;
        });

      }, ),
    );
  }
}