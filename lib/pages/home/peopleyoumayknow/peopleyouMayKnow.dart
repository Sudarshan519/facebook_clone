import 'package:facebook_clone/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeopleYouMayKnow extends StatelessWidget {
  const PeopleYouMayKnow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'People you may know',
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.w800),
          ),
        ),
        PeopleWidget(),
        Center(
          child: Container(
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              )
            ]),
          ),
        )
      ]),
    );
  }
}

class PeopleWidget extends StatelessWidget {
  const PeopleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Container(
      color: Colors.white,
      height: 300,
      child: ListView(
        padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        children: [
          ...userProvider.user.map(
            (e) => Container(
              width: 200,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: NetworkImage(
                                e.avatar,
                              ),
                              fit: BoxFit.fill,
                            ))),
                  ),
                  Expanded(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          Text(e.name,
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          Text("${e.id} Mutual Friends",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text('Add Friend',
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text('Remove',
                                      style: TextStyle(color: Colors.white)),
                                )
                              ]),
                        ])),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
