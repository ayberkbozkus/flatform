import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonNotificationState();
  }
}

class _PersonNotificationState extends State {
  final Firestore _firestore = Firestore.instance;
  int _currentIndex = 0;
  String toWho = 'Kime';

  List<Notification> allNotification = [];

  @override
  Widget build(BuildContext context) {
    takeNotification();
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Column(
        children:[ 
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              
              color: Colors.white,
                
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Konu'),
                       
                         onChanged: (val) {

                         },
                      ),
                      Padding(
                                  padding: const EdgeInsets.symmetric( vertical: 5),
                                  child: DropdownButton(
                                    hint: Text(toWho),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Tesis Sorumluları"),
                                        value: "Tesis Sorumluları",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Üretim Mühendisleri"),
                                        value: "Üretim Mühendisleri",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Takım"),
                                        value: "Takım",
                                      )
                                    ],
                                    onChanged: (String value) {
                                      setState(() {
                                        toWho = value;
                                        
                                      });
                                    },
                                  ),
                                ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Mesaj'),
                    
                        onChanged: (val) {

                         },
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: FlatButton(
                          child: Text('Bildirim Gönder'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
          Expanded(
                  child: ListView.builder(
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
        ),]
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
  void fireStoreAdd() {
    
  }
}

class Notification {
  String _title;
  String _message;
  DateTime _time;
  Color _color;
  Notification(this._title, this._message, this._time, this._color);
}
