import 'package:facebook_clone/model/post.dart';
import 'package:facebook_clone/utils/timeformat.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget postWidget(Post post) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 19,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(post.userImage),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
              child: RichText(
                  maxLines: 3,
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
                              '${post.title.length > 90 ? post.title.substring(0, 90) + '...' : post.title} \t',
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
            // Text(post.title,
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(
              post.content,
              maxLines: 4,
              //  overflow: TextOverflow.ellipsis,
            ),
            Text(
              'SEE ALL...',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )),
    Image.network(post.image),
    Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8, right: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 11,
              // backgroundColor: Colors.grey,
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
    Divider(),
    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      LikeButton(),
      LikeShareCommentWidget(icon: FontAwesomeIcons.comments, text: 'COMMENT'),
      LikeShareCommentWidget(icon: FontAwesomeIcons.share, text: 'SHARE'),
    ]),
    SizedBox(
      height: 10,
    )
  ]);
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key key,
  }) : super(key: key);

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
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(8),
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200],
                      // border: Border.all(color: Colors.grey, width: .8),
                    ),
                    // child: Text(post.content,
                    //     style: TextStyle(color: Colors.grey[700])),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

Widget commentsWidget() {
  return Container();
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
          'LIKE',
          style: TextStyle(
              fontWeight: FontWeight.bold,
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
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ]),
    );
  }
}
