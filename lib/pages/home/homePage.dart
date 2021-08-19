import 'package:after_layout/after_layout.dart';
import 'package:facebook_clone/pages/addfriend/addFriendWidget.dart';
import 'package:facebook_clone/pages/jobs/jobs.dart';

import 'package:facebook_clone/pages/menu/main.dart';
import 'package:facebook_clone/pages/notifications/notification.dart';
import 'package:facebook_clone/pages/watch/watchlist.dart';
import 'package:facebook_clone/providers/commentProvider.dart';
import 'package:facebook_clone/providers/postProvider.dart';
import 'package:facebook_clone/providers/storiesProvider.dart';
import 'package:facebook_clone/providers/userProvider.dart';
import 'package:facebook_clone/utils/internetConnection.dart';
import 'package:facebook_clone/utils/snackbarUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'homeWidget.dart';

final List<IconData> _tabs = <IconData>[
  Icons.home,
  Icons.people_outline,
  Icons.tv,
  FontAwesomeIcons.briefcase,
  // Icons.view_quilt_sharp,
  Icons.notifications,
  Icons.menu
];

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  int selectedIndex = 0;
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
        backgroundColor: Colors.grey[400],
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              TabWidget(innerBoxIsScrolled: false),
            ];
          },
          body: TabBarView(
            children: [
              HomeWidget(
                  storiesProvider: _storiesProvider,
                  postProvider: _postProvider),
              AddFriend(),
              WatchlistPage(),
              JobsPage(),
              NotificationPage(),
              MenuPage(),
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
      Provider.of<CommentProvider>(context, listen: false).initComments();
      Provider.of<UserProvider>(context, listen: false).initUsers();
    } else {
      SnackbarUtil.showSnackBar(context, "No Internet Connection");
    }
  }
}

class TabWidget extends StatelessWidget {
  final bool innerBoxIsScrolled;
  const TabWidget({
    Key key,
    this.innerBoxIsScrolled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('facebook',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 24)),
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
          // isScrollable: true,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: _tabs
              .map((IconData name) => Tab(
                      icon: Icon(
                    name,
                    // color: Colors.grey,
                  )))
              .toList(),
        ),
        
      ),
    );
  }
}
