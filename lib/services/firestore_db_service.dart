import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flatform/models/user.dart';
import 'package:flatform/services/database_base.dart';
import 'package:flutter/material.dart';

class FirestoreDBService implements DBBase{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(AppUser user) async {
    await _firestore.collection('users').doc(user.userID).set(user.toMap());
    return true;
  }
}