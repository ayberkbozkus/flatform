import 'package:flatform/locator.dart';
import 'package:flatform/models/user.dart';
import 'package:flatform/repository/user_repository.dart';
import 'package:flatform/services/auth_base.dart';
import 'package:flutter/material.dart';

enum ViewState {Idle, Busy}

class UserModel with ChangeNotifier implements AuthBase{

  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  AppUser _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<AppUser> currentUser() async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki current user hata: '+e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<AppUser> signInEmail(String email, password) async {
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInEmail(email,password);
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki signout hata: '+e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
      print('object');
    }
  }

  @override
  Future<bool> signOut() async {
    try{
      state = ViewState.Busy;
      return await _userRepository.signOut();
    }catch(e){
      debugPrint('Viewmodeldeki signout hata: '+e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }



}