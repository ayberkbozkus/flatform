import '../notification_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PersonNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonNotificationState();
  }
}

class _PersonNotificationState extends State {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _currentIndex = 0;
  int _id;
  String _issue;
  String _towho = 'Kime';
  String _from;
  String _message;
  DateTime _time;
  Color _color;
  
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  List<Notification> allNotification = [];
  final formKey=GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();

    NotificationHandler().initializeFCMNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    takeNotification();
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Column(
        children:[ 
          Padding(
            padding: const EdgeInsets.fromLTRB(2,25,2,2),
            child: Card(
              
              color: Colors.white,
                
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Form(
                        key: formKey,
                        // autovalidate: _autocontrol,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                              hintText: 'Konu',
                              hoverColor: Colors.blue,
                              fillColor: Colors.blue,
                              focusColor: Colors.blue,
                              icon: new Icon(
                                Icons.mail,
                                color: Colors.grey,
                              )),
                              // validator: _emailKontrol,
                              onSaved: (value) => _issue = value,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                  padding: const EdgeInsets.symmetric( vertical: 5),
                                  child: DropdownButton(
                                    hint: Text(_towho),
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
                                        _towho = value;
                                        
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                              hintText: 'Mesaj',
                              icon: new Icon(
                                Icons.mail,
                                color: Colors.grey,
                              )),
                              // validator: _emailKontrol,
                              onSaved: (value) => _message = value,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: FlatButton(
                          child: Text('Bildirim Gönder'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: fireStoreAdd,
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
  void fireStoreAdd() async {
    Map<String, dynamic> notadd = Map();
    notadd['id'] = '100005';
    notadd['issue'] = 'konu2';
    notadd['from'] = 'ayberk';
    notadd['towho'] = 'dogukan';
    notadd['message'] = 'mesaj2';
    notadd['date'] = '1586348757122';
    
    await _firestore.collection('Notifications').doc(notadd['id']).set(notadd).then((value) => debugPrint('veri eklendi'));
  }
  void fireStoreRead() async {
    DocumentSnapshot incomingData = await _firestore.collection('Notifications').doc('100002').get();
    print(incomingData.data()['id']);
  }
}

class Notification {
  String _title;
  String _message;
  DateTime _time;
  Color _color;
  Notification(this._title, this._message, this._time, this._color);
}

// class Notification {
//   int _id;
//   String _issue;
//   String _towho;
//   String _from;
//   String _message;
//   DateTime _time;
//   Color _color;
//   Notification(this._id,this._issue,this._towho,this._from, this._message, this._time, this._color);
// }
