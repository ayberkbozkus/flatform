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

  AppUser get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<AppUser> currentUser() async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      notifyListeners();
      return _user;
    }catch(e){
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
      notifyListeners();
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki signout hata: '+e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<AppUser> registerEmail(String email, password, team, title) async {
    try{
      // _emailControl(email,password); email farpals mı kontrol
      state = ViewState.Busy;
      _user = await _userRepository.registerEmail(email,password,team,title);
      notifyListeners();
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki signout hata: '+e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<AppUser> signInWithGoogle() async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInWithGoogle();
      notifyListeners();
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki signout hata: '+e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try{
      state = ViewState.Busy;
      bool result = await _userRepository.signOut();
      _user = null;
      notifyListeners();
      print('cikis');
      return result;
    }catch(e){
      debugPrint('Viewmodeldeki signout hata: '+e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }

  bool _emailControl(String email,password) {
    if(!email.contains('@farplas.com')){
      return true;
    }
    else return false;
  }
}