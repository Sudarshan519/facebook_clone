import 'package:facebook_clone/model/stories.dart';
import 'package:flutter/material.dart';

Widget storiesWidget(Stories e) {
  return Container(
      decoration: BoxDecoration(
          // image:
          //     DecorationImage(image: NetworkImage(e.image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(16)),
      // padding: EdgeInsets.all(8),
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
          // Image.network(
          //   e.image,
          //   fit: BoxFit.fill,
          //   height: 200,
          //   width: 100,
          // ),
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
      ));
}
