import 'package:flutter/material.dart';

class TabBars extends StatelessWidget {
  Color themeColor;
  TabController tabController;
  
  TabBars(this.tabController,this.themeColor);

  @override
  Widget build(BuildContext context) {
    return TabBar(
            
            controller: tabController,
            indicatorWeight: 2,
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.blue,
            
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

