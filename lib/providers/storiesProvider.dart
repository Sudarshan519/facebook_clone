import 'dart:convert';

import 'package:facebook_clone/model/stories.dart';
import 'package:facebook_clone/utils/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class StoriesProvider with ChangeNotifier {
  List<Stories> _stories = [];
  List<Stories> get stories => _stories;
  initStories() async {
    print('retriving stories');
    var _client = http.Client();
    _stories.clear();
    try {
      await _client.get(Uri.parse(APIs.stories)).then((response) {
        if (response.statusCode == 200) {
          final _jsonResponse = jsonDecode(response.body);
          final _data = _jsonResponse;
          if (_data != null) {
            _data.forEach((item) {
              _stories.add(Stories.fromJson(item));
            });
          }
        }
      });
    } catch (e) {
      print("stories error :$e");
    } finally {
      _client.close();
    }
    notifyListeners();
  }
}
