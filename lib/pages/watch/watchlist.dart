import 'package:facebook_clone/utils/const.dart';
import 'package:facebook_clone/widgets/postWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const watchlist = ['For you ', 'Live', 'Following', 'Saved', 'Food', 'Gaming'];

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({Key key}) : super(key: key);

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text('Watch',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 30,
            child: ListView(
              padding: EdgeInsets.only(left: 20),
              children: [
                ...watchlist.map((e) => GestureDetector(
                      onTap: () => changeIndex(watchlist.indexOf(e)),
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10),
                        decoration: selected == watchlist.indexOf(e)
                            ? BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(16))
                            : BoxDecoration(),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(e,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w800)),
                      ),
                    ))
              ],
              scrollDirection: Axis.horizontal,
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      watchlist[selected],
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      NewsFeed(),
                      NewsFeed(),
                      NewsFeed(),
                      NewsFeed(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 10,
            color: Colors.grey,
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),

            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(someone),
                      ),
                      Container(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Text(
                                  'eKantipur\t ',
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 2,
                                ),
                                Icon(
                                  Icons.notifications,
                                  color: Colors.grey[700],
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text('7 h '),
                              DotWidget(),
                              Container(
                                width: 5,
                              ),
                              Icon(
                                Icons.vpn_lock,
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.more_horiz),
                      Container(
                        width: 5,
                      ),
                      Icon(Icons.close)
                    ],
                  ),
                ),
                // Text(''),
                Image.network(
                    "https://c.tenor.com/51xaYly91Z4AAAAC/cant-cantdoit.gif"),

                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            child: Icon(
                              Icons.thumb_up,
                              size: 10,
                            ),
                          ),
                          Container(width: 5),
                          Text(
                            '5.7k',
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                          Spacer(),
                          Text('6.2k comments',
                              style: TextStyle(color: Colors.grey[800])),
                          Container(width: 5),
                          DotWidget(),
                          Container(width: 5),
                          Text(
                            '123 shares',
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomLIkeShare(
                          text: 'Like', icon: FontAwesomeIcons.thumbsUp),
                      CustomLIkeShare(
                          text: 'Comment', icon: FontAwesomeIcons.comment),
                      CustomLIkeShare(
                          text: 'Share', icon: FontAwesomeIcons.share)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 10,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  changeIndex(int i) {
    setState(() {
      selected = i;
    });
  }
}

class NewsFeed extends StatelessWidget {
  const NewsFeed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://c.tenor.com/qWlvQ17l6eIAAAAC/we-will-do-it-live-do-it-live.gif",
            height: 200,
            width: 300,
            fit: BoxFit.cover,
          ),
          Text(
              "We offer a master's degree program with internships with IT companies in the USA. A computer science degree or related subject is necessary to apply.",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text(
            'Abc University',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 2,
    );
  }
}

class CustomLIkeShare extends StatelessWidget {
  const CustomLIkeShare({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Container(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
