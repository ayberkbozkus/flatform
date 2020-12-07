import 'package:flatform/models/notification.dart';
import 'package:flatform/screens/new_notification.dart';
import 'package:flatform/screens/notification_list.dart';
import '../notification_handler.dart';
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
  final List<NotificationModel> _notificationdata = [];
  @override
  void initState() {
    super.initState();

    NotificationHandler().initializeFCMNotification(context);
  }

  void _sendNotification(String txTitle, String txMessage, String txtoWho) {
    final newTx = NotificationModel(
      title: txTitle,
      message: txMessage,
      toWho: txtoWho,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _notificationdata.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        NewNotification(_sendNotification),
      ],
    );
  }
}
