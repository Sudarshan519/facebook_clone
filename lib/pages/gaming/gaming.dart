import 'package:flutter/material.dart';

class Gaming extends StatelessWidget {
  const Gaming({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 50,
        ),
        Container(
          child: Text('Watch'),
        )
      ],
    );
  }
}
