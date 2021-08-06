import 'dart:convert';

import 'package:facebook_clone/model/user.dart';
import 'package:facebook_clone/utils/apis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  ///store user privately
  List<User> _user = [];

  ///reference for users
  List<User> get user => _user;

  ///retrive user from api call
  initUsers() async {
    print('retriving users');
    var _client = http.Client();
    _user.clear();
    try {
      await _client.get(Uri.parse(APIs.post)).then((response) {
        if (response.statusCode == 200) {
          final _jsonResponse = jsonDecode(response.body);
          final _data = _jsonResponse;
          if (_data != null) {
            _data.forEach((item) {
              _user.add(User.fromJson(item));
            });
          }
        }
      });
    } catch (e) {
      ///show error
      print("user error :$e");
    } finally {
      _client.close();
    }

    ///update data on provider
    notifyListeners();
  }
}
