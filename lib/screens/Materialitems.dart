import 'package:flatform/widgets/charts/energy_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

Material mybarItems(String heading, Color themeColor,
  charts.BarChart barchartdisplay, int situation, BuildContext ctx) {
  return Material(
    color: Colors.white,
    elevation: 5.0,
    shadowColor: themeColor,
    borderRadius: BorderRadius.circular(10.0),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // text
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                //Icon

                Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 40),
                        child: FlatButton(
                          height: 25,
                          minWidth: 60,
                          color: themeColor,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          child: Text(
                            'Dün',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 40),
                        child: FlatButton(
                          height: 25,
                          minWidth: 60,
                          color: themeColor,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          child: Text(
                            'Bugün',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Center(
                      child: new Container(
                          height: 140,
                          width:
                              340, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay
                          child: barchartdisplay),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Material mywbarItems(String heading, Color themeColor,
    Stack gaugechartdisplayenergy, int situation, BuildContext ctx) {
  return Material(
    color: Colors.white,
    elevation: 5.0,
    shadowColor: themeColor,
    borderRadius: BorderRadius.circular(10.0),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                //Icon

                Center(
                  child: new Container(
                      height: 150,
                      width: 150,
                      //piechartdisplay    barchartdisplay  wbarchartdisplay
                      child: gaugechartdisplayenergy),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Material myradialItems(String heading, Color themeColor,
    Stack donutchartdisplay, int situation, BuildContext ctx) {
  return Material(
    color: situation == 4 ? Colors.transparent : Colors.white,
    elevation: situation == 4 ? 0 : 5.0,
    shadowColor: themeColor,
    borderRadius: BorderRadius.circular(10.0),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            situation == 4
                ? Column(children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(ctx).size.width / 2.3,
                        child: Card(
                            elevation: 5,
                            shadowColor: themeColor,
                            color: themeColor,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                  child: Text(
                                'Kalıp No: EK2540',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                            )),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(ctx).size.width / 2.3,
                        child: Card(
                          elevation: 5,
                          shadowColor: themeColor,
                          color: themeColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 31),
                            child: Center(
                              child: Text(
                                'Toplam Parça\nSayısı: 324',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(ctx).size.width / 2.3,
                        child: Card(
                            elevation: 5,
                            shadowColor: themeColor,
                            color: themeColor,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Center(
                                  child: Text(
                                'Ortalama Çevrim: 45s',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                            )),
                      ),
                    ),
                  ])
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // text
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          heading,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      //Icon

                      Center(
                        child: new Container(
                            height: 160,
                            width:
                                160, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay    donutchartdisplay   gaugechartdisplay
                            child: donutchartdisplay),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    ),
  );
}

Material myradialItemsP(String heading, Color themeColor,
    Stack gaugechartdisplay, int situation, BuildContext ctx) {
  return Material(
    color: Colors.white,
    elevation: 5.0,
    shadowColor: themeColor,
    borderRadius: BorderRadius.circular(10.0),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,10,0,0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // text
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                //Icon

                Center(
                  child: new Container(
                    padding: const EdgeInsets.fromLTRB(40,10,0,0),
                      height: 160,
                      width:
                          350, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay    donutchartdisplay   gaugechartdisplay
                      child: gaugechartdisplay),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Material mypieItems(String heading, Color themeColor, charts.PieChart piechartdisplay, int situation, ctx) {
  return Material(
    color: Colors.white,
    elevation: 5.0,
    shadowColor: themeColor,
    borderRadius: BorderRadius.circular(10.0),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // text
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                //Icon

                Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          height: 25,
                          minWidth: 60,
                          color: themeColor,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          child: Text(
                            'Dün',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          height: 25,
                          minWidth: 60,
                          color: themeColor,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          child: Text(
                            'Bugün',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Center(
                      child: new Container(
                          height: 190,
                          width:
                              350, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay
                          child: ChartApp()),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}




