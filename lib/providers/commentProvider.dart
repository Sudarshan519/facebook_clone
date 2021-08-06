import 'package:facebook_clone/model/comment.dart';
import 'package:facebook_clone/utils/apis.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentProvider with ChangeNotifier {
  List<Comment> _comments = [];
  List<Comment> get comments => _comments;
  initPosts() async {
    print('retriving comment');
    var _client = http.Client();

    try {
      await _client.get(Uri.parse(APIs.comments)).then((response) {
        if (response.statusCode == 200) {
          final _jsonResponse = jsonDecode(response.body);
          final _data = _jsonResponse;
          if (_data != null) {
            _data.forEach((item) {
              _comments.add(Comment.fromJson(item));
            });
          }
        }
      });
    } catch (e) {
      print("comments error :$e");
    } finally {
      _client.close();
    }
    notifyListeners();
  }
}
