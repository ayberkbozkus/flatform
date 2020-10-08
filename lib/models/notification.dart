import 'package:flutter/foundation.dart';

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String toWho;
  final DateTime date;

  NotificationModel({
    @required this.id,
    @required this.title,
    @required this.message,
    @required this.toWho,
    @required this.date,
  });
}