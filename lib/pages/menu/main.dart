import 'package:facebook_clone/pages/login/loginPage.dart';
import 'package:facebook_clone/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        children: [
          Container(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Text('Menu',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Spacer(),
                CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 20,
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[800],
                      size: 15,
                    ))
              ],
            ),
          ),
          Container(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(userimage),
                ),
                Container(
                  width: 10,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Sudarshan Shrestha',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    'View your profile',
                    style: TextStyle(
                      letterSpacing: 1.05,
                      color: Colors.grey[600],
                    ),
                  ),
                ]),
              ],
            ),
          ),
          Container(
            height: 10,
          ),
          Divider(),
          Container(
            height: 10,
          ),
          ListWidget(),
          ListWidget(),
          ListWidget(),
          ListWidget(),
          Container(
            height: 10,
          ),
          SeeMore(),
          Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage())),
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(Icons.help, color: Colors.indigo[200]),
                    Container(
                      width: 10,
                    ),
                    Text(
                      'Help & Support',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    Spacer(),
                    RotatedBox(
                        quarterTurns: 45,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 15,
                        ))
                  ],
                )),
          ),
          Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage())),
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.indigo[200]),
                    Container(
                      width: 10,
                    ),
                    Text(
                      'Settings & Privacy',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    Spacer(),
                    RotatedBox(
                        quarterTurns: 45,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 15,
                        ))
                  ],
                )),
          ),
          Divider(),
          Container(
            height: 10,
          ),
          Logout(),
          Container(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class Logout extends StatelessWidget {
  const Logout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage())),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          'Log out',
        ),
      ),
    );
  }
}

class SeeMore extends StatelessWidget {
  const SeeMore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage())),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          'See more',
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage())),
      child: Container(
          margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.people),
              Container(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'Friends',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Text(
                  //   '...',
                  // ),
                ],
              )
            ],
          )),
    );
  }
}
