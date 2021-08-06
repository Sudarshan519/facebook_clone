import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget createPostWidget(context) {
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(width: 18),
            CircleAvatar(
              radius: 19,
              backgroundColor: Colors.blue,
              child: CircleAvatar(radius: 17, backgroundColor: Colors.white),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(7),
                  width: 200,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.5,
                          fontSize: 18),
                      labelText: "What's on your mind ?",
                    ),
                    enabled: false,
                  )),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              FontAwesomeIcons.video,
              size: 14,
              color: Colors.red,
            ),
            Text('Live',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            Container(
              width: 1,
              height: 16,
              color: Colors.grey,
            ),
            Icon(Icons.photo, size: 14, color: Colors.green),
            Text('Photo'),
            Container(
              width: 1,
              height: 16,
              color: Colors.grey,
            ),
            Icon(Icons.camera_roll_sharp, size: 14, color: Colors.purple),
            Text('Room'),
          ],
        ),
        SizedBox(height: 8)
      ],
    ),
  );
}
