import 'package:facebook_clone/utils/const.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key key}) : super(key: key);

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
              Text('Notifications',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Spacer(),
              CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 20,
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[800],
                    size: 20,
                  ))
            ],
          ),
        ),
        Container(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            'Earlier',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
        ),
        Container(
          height: 10,
        ),
        PostNotification(),
        InviteNotification(),
        PostNotification(seen: true),
        InviteNotification(seen: true),
      ],
    ));
  }
}

class InviteNotification extends StatelessWidget {
  const InviteNotification({Key key, this.seen = false}) : super(key: key);
  final bool seen;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: seen ? Colors.blue[100] : Colors.transparent,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(userimage),
                backgroundColor: Colors.grey,
                radius: 35,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  child: Icon(
                    Icons.people_rounded,
                    color: Colors.white,
                    size: 15,
                  ),
                  radius: 15,
                ),
              )
            ],
          ),
          Container(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 100,
              width: 300,
              padding: EdgeInsets.only(top: 10),
              child: Wrap(
                children: [
                  Text.rich(TextSpan(text: "", children: [
                    TextSpan(
                        text: 'Sudarshan ',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: ' requested you to like', style: TextStyle()),
                    TextSpan(
                      text: ' Kantipur News',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                        text: '\nYesterday at 4:34 am',
                        style: TextStyle(color: Colors.grey[700])),
                    WidgetSpan(
                        child: Container(
                      height: 5,
                    )),
                    WidgetSpan(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              child: Text(
                                'Accept',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[200]),
                              ),
                            ),
                          ),
                          Container(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300]),
                              child: Text(
                                'Decline',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    // TextSpan(
                    //     text: '\nYesterday at 7:35 am', style: TextStyle()),
                  ]))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PostNotification extends StatelessWidget {
  const PostNotification({
    Key key,
    this.seen = false,
  }) : super(key: key);
  final bool seen;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: seen ? Colors.blue[100] : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(someone),
                backgroundColor: Colors.grey,
                radius: 35,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  child: Icon(
                    Icons.people_rounded,
                    color: Colors.white,
                    size: 15,
                  ),
                  radius: 15,
                ),
              )
            ],
          ),
          Container(
            width: 10,
          ),
          Expanded(
            child: Container(
              width: 300,
              padding: EdgeInsets.only(top: 10),
              child: Wrap(
                children: [
                  Text.rich(TextSpan(text: "", children: [
                    TextSpan(
                        text: 'Rishma Dahal',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextSpan(text: ' added a photo in', style: TextStyle()),
                    TextSpan(
                      text: ' Flutter Community',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                        text: '\nYesterday at 4:34 am',
                        style: TextStyle(color: Colors.grey[700])),
                  ]))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
