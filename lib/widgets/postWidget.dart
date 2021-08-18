import 'package:facebook_clone/model/comment.dart';
import 'package:facebook_clone/model/post.dart';
import 'package:facebook_clone/providers/commentProvider.dart';
import 'package:facebook_clone/utils/const.dart';
import 'package:facebook_clone/utils/timeformat.dart';
import 'package:facebook_clone/widgets/commentWidget.dart';
import 'package:facebook_clone/widgets/imageview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

Widget postWidget(context, Post post) {
  final _commentProvider = Provider.of<CommentProvider>(context);
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
        child: Image.network(post.image),
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
      LikeShareCommentWidget(
        icon: FontAwesomeIcons.comments,
        text: 'Comment',
        ontap: () {
          commentBottomSheet(context, _commentProvider.comments);
        },
      ),
      LikeShareCommentWidget(
        icon: FontAwesomeIcons.share,
        text: 'Share',
        ontap: () {
          Share.share(post.toJson().toString(), subject: 'Look what I made!');
        },
      ),
    ]),
    SizedBox(
      height: 10,
    ),
    Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Divider(),
    ),
    CommentWidget(post: post, comments: _commentProvider.comments),
  ]);
}

class CommentBox extends StatelessWidget {
  const CommentBox({
    Key key,
    this.hinttext,
    this.ontapped,
    this.enabled = false,
  }) : super(key: key);
  final bool enabled;
  final String hinttext;
  final Function() ontapped;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userimage),
          ),
          SizedBox(width: 5),
          Expanded(
            child: InkWell(
              onTap: () {
                ontapped();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30)),
                alignment: Alignment.center,
                child: TextField(
                  enabled: enabled,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefix: SizedBox(width: 10),
                      hintText: hinttext,
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
            ),
          )
        ],
      ),
    );
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
  final Function ontap;
  final List<Comment> comments;
  const LikeShareCommentWidget({
    Key key,
    this.icon,
    this.text,
    this.ontap,
    this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
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
