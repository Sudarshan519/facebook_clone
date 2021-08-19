import 'package:facebook_clone/pages/watch/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Text('Jobs',
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                Spacer(),
                CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 20,
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[800],
                      size: 15,
                    ))
              ],
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.only(top: 10, left: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [...data.map((e) => JobViews(icon: e[0], text: e[1]))],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, left: 10),
            child: Text(
              'Job at nearby businesses',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue[100]),
                    child: Row(
                      children: [
                        Text(
                          'Kathmandu',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor),
                        ),
                        Container(
                          width: 5,
                        ),
                        DotWidget(),
                        Container(
                          width: 5,
                        ),
                        Text(
                          '200 km',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue[100]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                          size: 12,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 5,
                        ),
                        Text(
                          'Filters',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          CustomDivider(),
          JobsItem(),
          CustomDivider(),
          JobsItem(),
          CustomDivider(),
          JobsItem(),
          CustomDivider(),
          JobsItem(),
          CustomDivider(),
          JobsItem(),
          CustomDivider(),
        ],
      ),
    );
  }
}

class JobsItem extends StatelessWidget {
  const JobsItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Flutter Developer',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Full-Time',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
        ),
        Row(children: [
          Text(
            'New',
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
          Container(
            width: 5,
          ),
          DotWidget(),
          Container(
            width: 5,
          ),
          Text(
            'Abc Studios',
            style: TextStyle(color: Colors.grey[700]),
          ),
          Spacer(),
          Icon(Icons.more_horiz)
        ]),
        Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200]),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.facebook,
                  size: 14,
                  color: Colors.blue,
                ),
                Container(width: 5),
                Text(
                  'Easy to apply ',
                  style: TextStyle(color: Colors.grey[600]
                      // fontSize: 16,
                      ),
                ),
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200]),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.facebookMessenger,
                  color: Colors.purple,
                  size: 14,
                ),
                Container(
                  width: 5,
                ),
                Text(
                  'Responsive employer',
                  style: TextStyle(color: Colors.grey[600]
                      // fontSize: 16,
                      ),
                ),
              ],
            ))
      ]),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(),
    );
  }
}

const data = [
  [FontAwesomeIcons.user, 'You'],
  [FontAwesomeIcons.inbox, 'Inbox'],
  [FontAwesomeIcons.briefcase, 'Manage'],
  [Icons.add, 'Create Job'],
];

class JobViews extends StatelessWidget {
  const JobViews({Key key, this.icon, this.text}) : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.grey[300]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 15,
          ),
          Container(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800]),
          )
        ],
      ),
    );
  }
}
