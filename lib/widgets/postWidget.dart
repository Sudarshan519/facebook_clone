import 'package:facebook_clone/model/post.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget postWidget(Post post) {
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: CircleAvatar(radius: 19, backgroundColor: Colors.grey),
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Text(
                post.postedBy,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    ),
    Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text(post.title)),
    Image.network(post.image),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        LikeShareCommentWidget(icon: FontAwesomeIcons.thumbsUp, text: 'LIKE'),
        LikeShareCommentWidget(
            icon: FontAwesomeIcons.comments, text: 'COMMENT'),
        LikeShareCommentWidget(icon: FontAwesomeIcons.share, text: 'SHARE'),
      ]),
    ),
  ]);
}

class LikeShareCommentWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const LikeShareCommentWidget({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(children: [
        Icon(icon, color: Colors.grey),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ]),
    );
  }
}
