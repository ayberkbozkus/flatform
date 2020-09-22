import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();


Future<void> myBackgroundMessageHandler(Map<String, dynamic> message){
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    print('Arka planda gelen data:' +message['data'].toString());
    NotificationHandler.showNotification(message);
  }

  return Future<void>.value();
}

class NotificationHandler{
  FirebaseMessaging _fcm = FirebaseMessaging();

  static final NotificationHandler _singleton = NotificationHandler._internal();
  factory NotificationHandler(){
    return _singleton;
  }
  NotificationHandler._internal();

  initializeFCMNotification(BuildContext context) async {

    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    _fcm.subscribeToTopic("uretim");
    String token = await _fcm.getToken();

    print('token: ' + token);

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: tetiklendi $message");
        showNotification(message);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: tetiklendi $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: tetiklendi $message");
      },
    );

  }

  static void showNotification(Map<String, dynamic> message) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '1234', 'Yeni Mesaj', 'your channel description',
        // style: AndroidNotificationStyle.Messaging,
        // styleInformation: mesajStyle,
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, message["data"]["title"],
        message["data"]["message"], platformChannelSpecifics,
        payload: 'Bildirim tıklanılınca gelen değer' /*jsonEncode(message)*/);

  }

  Future onSelectNotification(String payload) async {
    // final _userModel = Provider.of<UserModel>(myContext);

    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) {}

  // static _downloadAndSaveImage(String url, String name) async {
  //   var directory = await getApplicationDocumentsDirectory();
  //   var filePath = '${directory.path}/$name';
  //   var response = await http.get(url);
  //   var file = File(filePath);
  //   await file.writeAsBytes(response.bodyBytes);
  //   return filePath;
  // }
}