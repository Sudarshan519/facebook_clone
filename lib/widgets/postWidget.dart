import 'package:facebook_clone/model/post.dart';
import 'package:facebook_clone/utils/const.dart';
import 'package:facebook_clone/utils/timeformat.dart';
import 'package:facebook_clone/widgets/imageview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget postWidget(context, Post post) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 23,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(post.userImage),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
              child: RichText(
                  maxLines: 4,
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: '${post.postedBy}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                          text: ' posted ',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                        TextSpan(
                          text:
                              '${post.title.length > 70 ? post.title.substring(0, 70) + '...' : post.title} \t\n',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600),
                        ),
                        WidgetSpan(
                            child: Icon(Icons.vpn_lock,
                                size: 18, color: Colors.grey)),
                        TextSpan(
                          text:
                              " ${TimeFormatting.displayTimeAgoFromTimestamp(post.createdAt)}",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 14),
                        ),
                      ])))
        ],
      ),
    ),
    Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.content,
              maxLines: 4,
            ),
            Text(
              'SEE ALL...',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )),
    InkWell(
        child: Hero(tag: post.image, child: Image.network(post.image)),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ImageWidget(
                    image: post.image,
                  )));
        }),
    Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8, right: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 11,
              child: CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.thumb_up_outlined,
                    size: 12,
                    color: Colors.white,
                  )),
            ),
            Text(
              " ${post.likes.toString()} likes",
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(
              " ${post.comments.toString()} Comments",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )),
    Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Divider(),
    ),
    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      LikeButton(),
      LikeShareCommentWidget(icon: FontAwesomeIcons.comments, text: 'Comment'),
      LikeShareCommentWidget(icon: FontAwesomeIcons.share, text: 'Share'),
    ]),
    SizedBox(
      height: 10,
    ),
    Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Divider(),
    ),
    CommentWidget(post: post),
  ]);
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key key,
    this.post,
  }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Most Relevant',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.grey),
                ),
                Icon(Icons.arrow_drop_down_rounded, color: Colors.grey),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(someone),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(8),
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200],
                    ),
                    child: Text(post.content,
                        style: TextStyle(color: Colors.grey[700])),
                  ),
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Text(
                  'Like',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  'Comment',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(userimage),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30)),
                      height: 50,
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefix: SizedBox(width: 10),
                            hintText: 'Write a comment',
                            hintStyle: TextStyle(
                              fontSize: 14,
                            ),
                            suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.photo,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    FontAwesomeIcons.smile,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 5),
                                ])),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({Key key}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isliked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isliked = !isliked;
        });
      },
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Icon(
            !isliked
                ? FontAwesomeIcons.thumbsUp
                : FontAwesomeIcons.solidThumbsUp,
            color: !isliked ? Colors.grey : Colors.blue),
        SizedBox(
          width: 10,
        ),
        Text(
          'Like',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: !isliked ? Colors.grey : Colors.blue),
        ),
      ]),
    );
  }
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
    return InkWell(
      onTap: () {},
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Icon(icon, color: Colors.grey),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
        ),
      ]),
    );
  }
}
