import 'dart:math';

import 'package:facebook_clone/model/stories.dart';
import 'package:facebook_clone/providers/postProvider.dart';
import 'package:facebook_clone/providers/storiesProvider.dart';
import 'package:facebook_clone/widgets/addStoryWidget.dart';
import 'package:facebook_clone/widgets/createPostWidget.dart';
import 'package:facebook_clone/widgets/postWidget.dart';
import 'package:facebook_clone/widgets/storyWidget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key key,
    @required StoriesProvider storiesProvider,
    @required PostProvider postProvider,
  })  : _storiesProvider = storiesProvider,
        _postProvider = postProvider,
        super(key: key);

  final StoriesProvider _storiesProvider;
  final PostProvider _postProvider;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  ScrollController scrollController;
  double position = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    radius = 15;
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels < 100)
        print(scrollController.position.pixels);
      setState(() {
        if (scrollController.position.pixels < 100) {
          position = scrollController.position.pixels;
          radius = 50 * position / 100;
        }
      });
      // print(position);
    });
  }

  double radius;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print(position);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
          widget._storiesProvider.initStories();
          widget._postProvider.initPosts();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              createPostWidget(context),
              SizedBox(
                height: 6,
              ),
              if (widget._storiesProvider.stories.length > 0)
                Container(
                  height: 210,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Stack(children: [
                    StoriesWidget(
                        scrollController: scrollController, widget: widget),
                    if (50 - position > 0)
                      Transform.scale(
                          scale: (1 - position / 100), child: addStory()),
                    if ((50 - position) < 0)
                      AnimatedOpacity(
                        opacity: (50 - position) < 0 ? 1 : true,
                        duration: Duration(milliseconds: 200),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            duration: Duration(milliseconds: 300),
                            height: (200 - position - 50),
                            width: (150 - position),
                            child: CircleAvatar(
                                radius: (50 - radius / 10),
                                backgroundColor: Colors.transparent,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                            radius: (50 - radius / 10),
                                            backgroundImage: NetworkImage(
                                                'https://scontent.fktm10-1.fna.fbcdn.net/v/t1.6435-9/206085383_458435611892568_1808376874543890904_n.jpg?_nc_cat=1&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=ygaMJmQyejYAX-b6QzQ&_nc_ht=scontent.fktm10-1.fna&oh=8d340c6c02afe31f23dea8d3cdcaae9f&oe=6135C672'),
                                            backgroundColor: Colors.blue),
                                        CircleAvatar(
                                          radius: (15 - radius / 5),
                                          child: Icon(Icons.add,
                                              size: (15 - radius / 8)),
                                        )
                                      ],
                                    ))),
                          ),
                        ),
                      ),
                  ]),
                ),
              SizedBox(height: 10),
              if (widget._postProvider.posts.length > 0)
                ...widget._postProvider.posts.map((e) => Container(
                    margin: EdgeInsets.only(bottom: 10),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: postWidget(e))),
            ],
          ),
        ),
      ),
    );
  }
}

class StoriesWidget extends StatelessWidget {
  const StoriesWidget({
    Key key,
    @required this.scrollController,
    @required this.widget,
  }) : super(key: key);

  final ScrollController scrollController;
  final HomeWidget widget;

  @override
  Widget build(BuildContext context) {
    return ListView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 120),
        children: [
          // addStory(),
          ...widget._storiesProvider.stories.map((e) => storiesWidget(e)),
        ]);
  }
}
