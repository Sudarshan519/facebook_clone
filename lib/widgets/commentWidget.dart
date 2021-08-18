// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class WriteComment extends StatefulWidget {
//   const WriteComment({
//     Key key,
//   }) : super(key: key);

//   @override
//   _WriteCommentState createState() => _WriteCommentState();
// }

// class _WriteCommentState extends State<WriteComment> {
//   ScrollController scrollController;
//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//     scrollController = ScrollController();
//     scrollController.addListener(() {
//       if (scrollController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         print(scrollController.position.userScrollDirection);
//         Navigator.pop(context);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SizedBox.expand(
//         child: DraggableScrollableSheet(
//             initialChildSize: 1,
//             builder: (BuildContext context, scrollController) {
//               return Container(
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).scaffoldBackgroundColor,
//                     borderRadius: BorderRadius.circular(18),
//                     border: Border.all(color: Colors.grey[300]),
//                   ),
//                   child: SingleChildScrollView(
//                     controller: scrollController,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               CircleAvatar(
//                                   radius: 10,
//                                   child: Icon(FontAwesomeIcons.solidThumbsUp,
//                                       size: 10))
//                             ],
//                           ),
//                         ),
//                         Divider(),
//                       ],
//                     ),
//                   ));
//             }),
//       ),
//     );
//   }
// }

import 'package:facebook_clone/model/comment.dart';
import 'package:facebook_clone/model/post.dart';
import 'package:facebook_clone/utils/const.dart';
import 'package:facebook_clone/widgets/postWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key key,
    this.post,
    this.comments,
  }) : super(key: key);
  final Post post;
  final List<Comment> comments;
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
            InkWell(
                child: CommentBox(
                    hinttext: 'Write a comment',
                    ontapped: () {
                      commentBottomSheet(context, comments);
                    })),
          ],
        ));
  }
}

void commentBottomSheet(BuildContext context, comments) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          color: Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.8,
              maxChildSize: 1,
              builder: (_, controller) {
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Column(
                    children: [
                      // Icon(
                      //   Icons.remove,
                      //   color: Colors.grey[600],
                      // ),
                      // Expanded(
                      //   child: ListView.builder(
                      //     controller: controller,
                      //     itemCount: 100,
                      //     itemBuilder: (_, index) {
                      //       return Card(
                      //         child: Padding(
                      //           padding: EdgeInsets.all(8),
                      //           child: Text("Element at index($index)"),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                                radius: 10,
                                child: Icon(FontAwesomeIcons.solidThumbsUp,
                                    size: 10)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(comments.length.toString(),
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 20)),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.arrow_forward_ios, size: 20),
                            Spacer(),
                            Icon(FontAwesomeIcons.thumbsUp, color: Colors.grey),
                          ],
                        ),
                      ),
                      Divider(),

                      Container(
                        height: (MediaQuery.of(context).size.height - 150),
                        // color: Colors.grey,
                        child: SingleChildScrollView(
                            child: Column(children: [
                          ...comments.map((Comment v) => Container(
                                  child: Column(children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.grey,
                                      backgroundImage: NetworkImage(v.avatar),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(8),
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.grey[200],
                                        ),
                                        child: Text(v.comment,
                                            style: TextStyle(
                                                color: Colors.grey[700])),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 50),
                                        child: Text(
                                          'Like',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 30),
                                        child: Text(
                                          'Reply',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ]),
                                SizedBox(height: 10)
                              ])))
                        ])),
                      ),
                      Spacer(),

                      CommentBox(
                        enabled: true,
                        hinttext: 'Write a public comment',
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
