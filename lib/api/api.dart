import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {

  static Future<String> apiRequest() async {
    var url = 'http://flatformapi.herokuapp.com/users/fakeapi';
    var response = await http.get(url);
    Map<String, dynamic> json = await jsonDecode(response.body.toString());
    print('veriler geldi');
    return response.body.toString();
  }
}
