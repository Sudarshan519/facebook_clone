import 'dart:math';

import 'package:facebook_clone/pages/home/storiesContainer.dart';
import 'package:facebook_clone/providers/postProvider.dart';
import 'package:facebook_clone/providers/storiesProvider.dart';
import 'package:facebook_clone/widgets/createPostWidget.dart';
import 'package:facebook_clone/widgets/loadingWidget.dart';
import 'package:facebook_clone/widgets/postWidget.dart';
import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget._postProvider.posts.length == 0)
      return LoadingWIdget();
    else
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
                  StoriesContainer(),
                // SizedBox(height: 10),
                // PeopleYouMayKnow(),
                SizedBox(height: 10),
                if (widget._postProvider.posts.length > 0)
                  ...widget._postProvider.posts.map((e) => Container(
                      margin: EdgeInsets.only(bottom: 10),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: postWidget(context, e))),
              ],
            ),
          ),
        ),
      );
  }
}
