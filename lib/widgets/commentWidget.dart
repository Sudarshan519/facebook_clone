import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WriteComment extends StatefulWidget {
  const WriteComment({
    Key key,
  }) : super(key: key);

  @override
  _WriteCommentState createState() => _WriteCommentState();
}

class _WriteCommentState extends State<WriteComment> {
  ScrollController scrollController;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        print(scrollController.position.userScrollDirection);
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: DraggableScrollableSheet(
            initialChildSize: 1,
            builder: (BuildContext context, scrollController) {
              return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.grey[300]),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 10,
                                  child: Icon(FontAwesomeIcons.solidThumbsUp,
                                      size: 10))
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
