import 'package:flutter/material.dart';

class TabBars extends StatelessWidget {
  Color themeColor;
  TabController tabController;
  
  TabBars(this.tabController,this.themeColor);

  @override
  Widget build(BuildContext context) {
    return TabBar(
            controller: tabController,
            indicatorColor: themeColor,
            labelColor: themeColor,
            unselectedLabelColor: themeColor,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.notifications),
              ),
              Tab(
                icon: Icon(Icons.message),
              ),
            ],
          );
  }
}

