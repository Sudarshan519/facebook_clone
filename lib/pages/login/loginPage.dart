import 'package:facebook_clone/pages/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Spacer(),
            Center(
                child: CircleAvatar(
                    radius: 40, child: Icon(FontAwesomeIcons.facebookF))),
            Spacer(),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      decoration: InputDecoration(
                          labelText: 'Username or Email',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ))),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.blueAccent[700],
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (c) => HomePage()));
                      },
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                "Don't have account. Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
