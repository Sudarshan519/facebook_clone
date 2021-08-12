
import 'package:facebook_clone/pages/home/storiesWidget.dart';
import 'package:facebook_clone/widgets/addStoryWidget.dart';
import 'package:flutter/material.dart';

class StoriesContainer extends StatefulWidget {
  const StoriesContainer({
    Key key,
  }) : super(key: key);

  @override
  _StoriesContainerState createState() => _StoriesContainerState();
}

class _StoriesContainerState extends State<StoriesContainer> {
  ScrollController scrollController;
  double position = 1;
  double radius = 0;
  @override
  void initState() {
    super.initState();
    radius = 15;
    position = 1;
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels < 100)
        setState(() {
          position = scrollController.position.pixels;
          radius = 50 * scrollController.position.pixels / 100;
        });
      // if (position > 90)
      //   setState(() {
      //     position = 100;
      //     radius = 50;
      //   });
      // print(position);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(children: [
        StoriesWidget(
          scrollController: scrollController,
        ),
        if ((50 - position) > 0)
          Transform.scale(scale: (1 - position / 100), child: addStory()),
        if ((50 - position) < 0)
          AnimatedOpacity(
            opacity: (50 - position) < 0 ? 1 : false,
            duration: Duration(milliseconds: 1),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                duration: Duration(milliseconds: 300),
                height: (150 - position),
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
                              child: Icon(Icons.add, size: (15 - radius / 8)),
                            )
                          ],
                        ))),
              ),
            ),
          ),
      ]),
    );
  }
}
