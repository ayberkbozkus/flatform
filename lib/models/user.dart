import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class AppUser {

  final String userID;
  String email;
  String team;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  int level;


  AppUser({@required this.userID, @required this.email});

  Map<String, dynamic> toMap() {
    return {
      'userID' : userID,
      'email' : email,
      'team' : team ?? '',
      'title' : title ?? '',
      'createdAt' : createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt' : updatedAt ?? FieldValue.serverTimestamp(),
      'level' : level ?? 1,
    };
  }

}