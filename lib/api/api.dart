import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {

  static void apiRequest() async {
    var url = 'http://flatformapi.herokuapp.com/users/fakeapi';
    var response = await http.get(url);
    Map<String, dynamic> json = await jsonDecode(response.body.toString());
    print('Response status: ${response.statusCode}');
    print('Response body: ${json['fakeapi'][0]['T3']['machines']['E009']}');
    
  
    
  }
}