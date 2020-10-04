import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void alertDialogshowCountry(BuildContext ctx, location) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text("Ülke Seçiniz"),
          content: DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text("Turkiye"),
                value: "Turkiye",
              ),
              DropdownMenuItem(
                child: Text("Romanya"),
                value: "Romanya",
              ),
            ],
            onChanged: (String selected) {
              setState(() {
                location = selected;
              });
              debugPrint("$location");
            },
          ),
          actions: <Widget>[
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Tamam"),
                  color: Colors.green,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void alertDialogshowFacility(BuildContext ctx, location) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text("Tesis Seçiniz"),
          content: DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text("Tesis1"),
                value: "Tesis1",
              ),
              DropdownMenuItem(
                child: Text("Tesis2"),
                value: "Tesis2",
              ),
              DropdownMenuItem(
                child: Text("Tesis3"),
                value: "Tesis3",
              )
            ],
            onChanged: (String selected) {
              setState(() {
                location = selected;
              });
              debugPrint("$location");
            },
          ),
          actions: <Widget>[
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Tamam"),
                  color: Colors.green,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void alertDialogshowMachine(BuildContext ctx, location) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text("Makine Seçiniz"),
          content: DropdownButton(
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
              )
            ],
            onChanged: (String selected) {
              setState(() {
                location = selected;
              });
              debugPrint("$location");
            },
          ),
          actions: <Widget>[
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Tamam"),
                  color: Colors.green,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void alertDialogshowMold(BuildContext ctx, location) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text("Kalıp Seçiniz"),
          content: DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text("Kalıp1"),
                value: "Kalıp1",
              ),
              DropdownMenuItem(
                child: Text("Kalıp2"),
                value: "Kalıp2",
              ),
              DropdownMenuItem(
                child: Text("Kalıp3"),
                value: "Kalıp3",
              )
            ],
            onChanged: (String selected) {
              setState(() {
                location = selected;
              });
              debugPrint("$location");
            },
          ),
          actions: <Widget>[
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Tamam"),
                  color: Colors.green,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
