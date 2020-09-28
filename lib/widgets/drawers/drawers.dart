import 'package:flutter/material.dart';
import '../../screens/NavBar.dart';

class MainDrawer extends StatefulWidget {
  String location;
  bool selected;
  String tesis;
  int situation;
  Color themeColor;
  String makine;
  MainDrawer(this.themeColor, this.makine,this.selected,this.tesis,this.situation, {this.location='tesis1'});
  @override
  _MainDrawerState createState() => _MainDrawerState(themeColor,makine,selected,tesis,situation,location:location,);
}

class _MainDrawerState extends State<MainDrawer> {
  String location;
  bool selected;
  String tesis;
  int situation;
  Color themeColor;
  String makine;
  _MainDrawerState(this.themeColor,this.makine,this.selected,this.tesis,this.situation,{this.location='tesis1'});
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      FlatButton(onPressed: () {
                        
                        setState(() {
                          location: 'Türkiye';
                          selected = false;
                          tesis = 'Tesis Seçiniz';
                          situation = 1;
                          themeColor = Colors.blue;
                        });
                      }, child: Image.asset('assets/icons/turkey.png', width: 50,),),
                      FlatButton(onPressed: () {
                        location = 'Romanya';
                        setState(() {
                          selected = null;
                          tesis = 'Tesis Seçiniz';
                          situation = 2;
                          themeColor = Colors.blue;
                        });
                        
                      }, child: Image.asset('assets/icons/romania.png', width: 50,),)
                    ],
                  ),
                ),
                selected != null ? Padding(
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
                            ): Padding(padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),),
                selected == true ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: DropdownButton(
                                hint: Text(makine),
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Makine1"),
                                    value: "Makine1",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Makine2"),
                                    value: "Makine2",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Makine3"),
                                    value: "Makine3",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Makine4"),
                                    value: "Makine4",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Makine5"),
                                    value: "Makine5",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Makine6"),
                                    value: "Makine6",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Makine7"),
                                    value: "Makine7",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Makine8"),
                                    value: "Makine8",
                                  )
                                ],
                                onChanged: (String value) {
                                  setState(() {
                                    makine = value;
                                    location = value;
                                    situation = 4;
                                    switch(makine) { 
                                      case 'Makine1': { 
                                          themeColor = Colors.green;
                                      } 
                                      break; 
                                      
                                      case 'Makine2': { 
                                          themeColor = Colors.grey;
                                      } 
                                      break; 

                                      case 'Makine3': { 
                                          themeColor = Colors.red;
                                      } 
                                      break; 
                                          
                                      default: { 
                                          themeColor = Colors.blue;
                                      }
                                      break; 
                                    } 
                                  });
                                },
                              ),
                            ): Padding(padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),),
                
              ],
            ),
          );
  }
  String hello() {
  return 'deneme';
}
}





