import 'package:after_layout/after_layout.dart';
import 'package:facebook_clone/providers/userProvider.dart';
import 'package:facebook_clone/utils/internetConnection.dart';
import 'package:facebook_clone/utils/snackbarUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFriend extends StatefulWidget {
  const AddFriend({Key key}) : super(key: key);

  @override
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void afterFirstLayout(BuildContext context) {
  _initUserData();
  }
  _initUserData() async {
    bool _isConnected = await InternetConnection.checkConnection();
    if (_isConnected) {
      Provider.of<UserProvider>(context, listen: false).initUsers();
     
    } else {
      SnackbarUtil.showSnackBar(context, "No Internet Connection");
    }
  }
}
