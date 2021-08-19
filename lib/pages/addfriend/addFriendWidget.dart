import 'package:after_layout/after_layout.dart';
import 'package:facebook_clone/model/user.dart';
import 'package:facebook_clone/providers/userProvider.dart';
import 'package:facebook_clone/utils/const.dart';
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
    final userProvider = Provider.of<UserProvider>(context);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          Container(
            child: Container(
              color: Colors.grey,
              height: 50,
            ),
          ),
          Row(children: [
            _getSectionHeader(
              'Friends',
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.search, color: Colors.grey)),
            )
          ]),
          _getFriendsFilter(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          _getFriendsRequests(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _getSectionHeader('People you may know'),
            SizedBox(height: 10),
            ...userProvider.user.map(
              (e) => _getFriendsSuggestion(e),
            )
          ]),
        ],
      ),
    );
  }

  Widget _getFriendsSuggestion(User e) {
    return Container(
        padding: new EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: <Widget>[
            _getFriendAvatar(e.avatar),
            Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      e.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '6 mutual friends',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    AddFriendButton(context: context)
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                height: 100,
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }

  Widget _getFriendAvatar(image) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      child: CircleAvatar(
        backgroundImage: NetworkImage(image),
        radius: 50.0,
      ),
      constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
      decoration: BoxDecoration(
          // color: Colors.green,
          ),
    );
  }

  Widget _getSectionHeader(title) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _getFriendsRequests() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getSectionHeader(
            'Friend Requests',
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'No friend Requests',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getFriendsFilter() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: [
          MaterialButton(
            onPressed: () {},
            child: Text('Suggestions', style: TextStyle(color: Colors.grey)),
            color: Colors.grey[300],
            splashColor: Color(0xffDCDDDF),
            textColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text('All Friends', style: TextStyle(color: Colors.grey)),
            color: Colors.grey[300],
            splashColor: Color(0xffDCDDDF),
            textColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _initUserData();
  }

  _initUserData() async {
    bool _isConnected = await InternetConnection.checkConnection();
    if (_isConnected) {
      // Provider.of<UserProvider>(context, listen: false).initUsers();
    } else {
      SnackbarUtil.showSnackBar(context, "No Internet Connection");
    }
  }
}

class AddFriendButton extends StatelessWidget {
  const AddFriendButton({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: () {},
            child: Text('Confirm', style: TextStyle(color: Colors.white)),
            color: Theme.of(context).primaryColor,
            splashColor: Color(0xffDCDDDF),
            textColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {},
            child: Text('Delete', style: TextStyle(color: Colors.black)),
            color: Color(0xffDCDDDF),
            splashColor: Color(0xffEBECF0),
            textColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 5),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
