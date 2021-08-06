import 'package:after_layout/after_layout.dart';
import 'package:facebook_clone/providers/postProvider.dart';
import 'package:facebook_clone/providers/storiesProvider.dart';
import 'package:facebook_clone/utils/internetConnection.dart';
import 'package:facebook_clone/utils/snackbarUtil.dart';
import 'package:facebook_clone/widgets/createPostWidget.dart';
import 'package:facebook_clone/widgets/postWidget.dart';
import 'package:facebook_clone/widgets/storyWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

final List<IconData> _tabs = <IconData>[
  Icons.home,
  Icons.people_outline,
  FontAwesomeIcons.tv,
  FontAwesomeIcons.gamepad,
  Icons.notifications_none_outlined,
  Icons.menu
];

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _storiesProvider = Provider.of<StoriesProvider>(context);
    final _postProvider = Provider.of<PostProvider>(context);

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  title: const Text('facebook',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  actions: [
                    CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.grey[800],
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(FontAwesomeIcons.facebookMessenger,
                            size: 15, color: Colors.grey[800]),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                  floating: true,
                  pinned: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: Colors.grey,
                    indicatorColor: Colors.blue,
                    tabs: _tabs
                        .map((IconData name) => Tab(
                                icon: Icon(
                              name,
                              color: Colors.grey,
                            )))
                        .toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              SafeArea(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 3));
                    _storiesProvider.initStories();
                    _postProvider.initPosts();
                  },
                  child: SingleChildScrollView(
                    // physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        createPostWidget(context),
                        SizedBox(
                          height: 10,
                        ),
                        if (_storiesProvider.stories.length > 0)
                          Container(
                            height: 210,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.only(left: 30),
                                children: [
                                  ..._storiesProvider.stories
                                      .map((e) => storiesWidget(e)),
                                ]),
                          ),
                        SizedBox(height: 10),
                        if (_postProvider.posts.length > 0)
                          ..._postProvider.posts.map((e) => Container(
                              margin: EdgeInsets.only(bottom: 10),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: postWidget(e)))
                      ],
                    ),
                  ),
                ),
              ),
              Container(),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    _initHomeData();
  }

  _initHomeData() async {
    bool _isConnected = await InternetConnection.checkConnection();
    if (_isConnected) {
      Provider.of<StoriesProvider>(context, listen: false).initStories();
      Provider.of<PostProvider>(context, listen: false).initPosts();
    } else {
      SnackbarUtil.showSnackBar(context, "No Internet Connection");
    }
  }
}
