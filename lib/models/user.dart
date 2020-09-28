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
  AppUser.fromMap(Map<String, dynamic> map):
    userID = map['userID'],
    email = map['email'],
    team = map['team'],
    title = map['title'],
    createdAt = (map['createdAt'] as Timestamp).toDate(),
    updatedAt = (map['updatedAt'] as Timestamp).toDate(),
    level = map['level'];
  @override
  String toString() {
    return 'User{userID: $userID, email: $email, team: $team, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, level: $level }';
  }
}