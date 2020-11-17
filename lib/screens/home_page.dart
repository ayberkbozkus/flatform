import 'dart:convert';
import 'package:flatform/widgets/tabBar/tabbar.dart';
import 'package:flatform/viewmodel/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'notification.dart';
import 'user_transactions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'MaterialItems.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String mold;
  String moldaverage;
  String moldnumber;
  _getData<StringProperty>(location, facility) async {
    String url = "http://flatformapi.herokuapp.com/users/fakeapi";
    var response = await http.get(url);
    Map<dynamic, dynamic> map = jsonDecode(response.body.toString());
    String tesis = facility.toString();
    String makine = location.toString();
    debugPrint(tesis);
    debugPrint(makine);
    _colorSelect(
        map["fakeapi"][0][tesis]["machines"][makine]["mode"].toString());
  }

  String location = "Türkiye";
  String tesis = 'Tesis Seçin';
  String makine = 'Makine Seçin';
  String energyValue = '';
  int situation = 0;
  Color themeColor = Colors.blue;
  bool selected;
  TabController tabController;
  var headerAppBar;
  _colorSelect<Colors>(value) {
    String mode = value.toString();
    Color tempColor;
    if (mode == "Seri Üretim") {
      tempColor = Color(0xFF32cd32);
    } else if (mode == "Yarı Otomatik") {
      tempColor = Color(0xFFff8c00);
    } else if (mode == "Manuel") {
      tempColor = Color(0xFFccff00);
    } else if (mode == "Setup") {
      tempColor = Color(0xFF1e90ff);
    } else if (mode == "Bekleme") {
      tempColor = Color(0xFF21d6ff);
    } else if (mode == "Bakım") {
      tempColor = Color(0xFFff9292);
    } else {
      tempColor = Color(0xFF2196f3);
    }
    setState(() {
      themeColor = tempColor;
    });
  }

  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: themeColor,
          accentColor: themeColor,
        ),
        home: Scaffold(
          appBar: headerAppBar = AppBar(
            title: Text('$location'),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    _logOut();
                  })
            ],
          ),
          drawer: new Drawer(
            child: ListView(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "Seçiniz",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: () {
                          location = 'Türkiye';
                          setState(() {
                            selected = false;
                            tesis = 'Tesis Seçiniz';
                            situation = 1;
                            themeColor = Colors.blue;
                          });
                        },
                        child: Image.asset(
                          'assets/icons/turkey.png',
                          width: 50,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          location = 'Romanya';
                          print(energyValue);

                          setState(() {
                            selected = null;
                            tesis = 'Tesis Seçiniz';
                            situation = 2;
                            themeColor = Colors.blue;
                          });
                        },
                        child: Image.asset(
                          'assets/icons/romania.png',
                          width: 50,
                        ),
                      )
                    ],
                  ),
                ),
                selected != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: DropdownButton(
                          hint: Text(tesis),
                          items: [
                            DropdownMenuItem(
                              child: Text("T1"),
                              value: "T1",
                            ),
                            DropdownMenuItem(
                              child: Text("T2"),
                              value: "T2",
                            ),
                            DropdownMenuItem(
                              child: Text("T3"),
                              value: "T3",
                            )
                          ],
                          onChanged: (String value) {
                            setState(() {
                              tesis = value;
                              location = value;

                              selected = true;
                              makine = 'Makine Seçiniz';
                              situation = 3;
                              themeColor = Colors.blue;
                            });
                          },
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                      ),
                selected == true
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: DropdownButton(
                          hint: Text(makine),
                          items: machines(location),
                          onChanged: (String value) {
                            setState(() {
                              makine = value;
                              location = value;
                              situation = 4;

                              _getData(makine, tesis);
                            });
                          },
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                      ),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              Container(
                child: StaggeredGridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  children: <Widget>[
                    // String heading, Color themeColor, Stack piechartdisplay, int situation
                    workingSituationItems("Çalışan Makine Sayısı", themeColor,
                        situation, context, location),
                    energyItems("Enerji Tüketimi", themeColor, situation,
                        context, location),
                    totalManufacturingItems("Toplam Üretim", themeColor,
                        situation, context, location),
                    // myradialItemsP("Hatalı Parça", themeColor, gaugechartdisplay, situation, context),
                    productivityItems("Tesis Verimliliği", themeColor,
                        situation, context, location),
                  ],
                  staggeredTiles: [
                    StaggeredTile.extent(1, 220.0),
                    StaggeredTile.extent(1, 220.0),
                    StaggeredTile.extent(2, 220.0),
                    // StaggeredTile.extent(2, 210.0),
                    StaggeredTile.extent(2, 260.0),
                  ],
                ),
              ),
              Container(
                child: PersonNotification(),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      UserTransactions(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: TabBars(tabController, themeColor),
          backgroundColor: Colors.grey[200],
        ),
      ),
    );
  }

  Future<bool> _logOut() async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    bool result = await _userModel.signOut();
    _userModel.signOut();
    print(result.toString() + 'result');
    return result;
  }

  List<DropdownMenuItem<String>> machines(String tesis) {
    if (tesis == 'T1') {
      return [
        DropdownMenuItem(
          child: Text("E053"),
          value: "E053",
        ),
        DropdownMenuItem(
          child: Text("E114"),
          value: "E114",
        ),
        DropdownMenuItem(
          child: Text("E102"),
          value: "E102",
        ),
        DropdownMenuItem(
          child: Text("E117"),
          value: "E117",
        )
      ];
    } else if (tesis == 'T2') {
      return [
        DropdownMenuItem(
          child: Text("E059"),
          value: "E059",
        ),
        DropdownMenuItem(
          child: Text("E083"),
          value: "E083",
        ),
        DropdownMenuItem(
          child: Text("E096"),
          value: "E096",
        ),
        DropdownMenuItem(
          child: Text("E104"),
          value: "E104",
        ),
        DropdownMenuItem(
          child: Text("E109"),
          value: "E109",
        ),
        DropdownMenuItem(
          child: Text("E115"),
          value: "E115",
        ),
      ];
    } else if (tesis == 'T3') {
      return [
        DropdownMenuItem(
          child: Text("E009"),
          value: "E009",
        ),
        DropdownMenuItem(
          child: Text("E018"),
          value: "E018",
        ),
        DropdownMenuItem(
          child: Text("E034"),
          value: "E034",
        ),
        DropdownMenuItem(
          child: Text("E080"),
          value: "E080",
        ),
      ];
    }
  }
}
/*


onTap: () {
                  alertDialogshow(context);
                },


         */
