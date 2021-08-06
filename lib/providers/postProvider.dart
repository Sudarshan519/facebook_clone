import 'dart:convert';

import 'package:facebook_clone/model/post.dart';
import 'package:facebook_clone/utils/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  initPosts() async {
    print('retriving post');
    var _client = http.Client();
    _posts.clear();
    try {
      await _client.get(Uri.parse(APIs.post)).then((response) {
        if (response.statusCode == 200) {
          final _jsonResponse = jsonDecode(response.body);
          final _data = _jsonResponse;
          if (_data != null) {
            _data.forEach((item) {
              _posts.add(Post.fromJson(item));
            });
          }
        }
      });
    } catch (e) {
      print("post error :$e");
    } finally {
      _client.close();
    }
    notifyListeners();
  }
}
