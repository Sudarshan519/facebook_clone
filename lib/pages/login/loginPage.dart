import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('facebook', style: TextStyle(color: Colors.white)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.facebookF),
                TextButton(onPressed: null, child: Text('Username or Email')),
                TextButton(onPressed: null, child: Text('Password ')),
                TextButton(
                  onPressed: null,
                  child: Text('Login'),
                ),
              ],
            ),
            Text("Sign Up for Facebook"),
            Text("Forgot Password")
          ],
        ),
      ),
    );
  }
}
