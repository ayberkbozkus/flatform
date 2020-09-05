import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonNotificationState();
  }
}

class _PersonNotificationState extends State {
  int _currentIndex = 0;

  List<Notification> allNotification = [];

  @override
  Widget build(BuildContext context) {
    takeNotification();
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => Container(
            child: Card(
              color: allNotification[index]._color,
              margin: EdgeInsets.all(5),
              elevation: 10,
              child: ListTile(
                title: Text(
                  "${allNotification[index]._title}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  "\n${allNotification[index]._message}\n\n${allNotification[index]._time.year}/${allNotification[index]._time.month}/${allNotification[index]._time.day} ${allNotification[index]._time.hour}:${allNotification[index]._time.minute}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  alertDialogshow(context, index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void takeNotification() {
    allNotification = List.generate(
      4,
      (index) => Notification(
        "$index. Başlık",
        "$index. Bildirim ve açıklama",
        DateTime.now(),
        index % 3 == 0
            ? Colors.blue
            : (index % 2 == 0 ? Colors.red : Colors.green),
      ),
    );
  }

  void alertDialogshow(BuildContext ctx, index) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text("${allNotification[index]._title}"),
          content: Text(
              "${allNotification[index]._message} \n${allNotification[index]._time.year}/${allNotification[index]._time.month}/${allNotification[index]._time.day} ${allNotification[index]._time.hour}:${allNotification[index]._time.minute}\n\n\n"),
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

class Notification {
  String _title;
  String _message;
  DateTime _time;
  Color _color;
  Notification(this._title, this._message, this._time, this._color);
}
