import 'package:after_layout/after_layout.dart';
import 'package:facebook_clone/providers/postProvider.dart';
import 'package:facebook_clone/providers/storiesProvider.dart';
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
  Icons.view_quilt_sharp,
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
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              FacebookLogo(innerBoxIsScrolled: innerBoxIsScrolled),
            ];
          },
          body: TabBarView(
            children: [
              HomeWidget(
                  storiesProvider: _storiesProvider,
                  postProvider: _postProvider),
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

  @override
  void detach() {
    // TODO: implement detach
  }

  @override
  // TODO: implement keptAlive
  bool get keptAlive => throw UnimplementedError();
}

class FacebookLogo extends StatelessWidget {
  final bool innerBoxIsScrolled;
  const FacebookLogo({
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
        // forceElevated: innerBoxIsScrolled,
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
    );
  }
}
