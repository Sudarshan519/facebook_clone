import 'package:facebook_clone/model/stories.dart';
import 'package:facebook_clone/widgets/storyView.dart';
import 'package:flutter/material.dart';

Widget storiesWidget(context, Stories e) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => StoryViewWidget(e)));
    },
    child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        height: 200,
        width: 100,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(e.image), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(16)),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.5),
                  borderRadius: BorderRadius.circular(16)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                    e.avatar,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    e.name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )),
            ),
          ],
        )),
  );
}
