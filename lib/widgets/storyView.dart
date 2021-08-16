import 'package:facebook_clone/model/stories.dart';
import 'package:facebook_clone/providers/storiesProvider.dart';
import 'package:facebook_clone/utils/timeformat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';

class StoryViewWidget extends StatelessWidget {
  const StoryViewWidget(this.e, {Key key}) : super(key: key);
  final Stories e;
  @override
  Widget build(BuildContext context) {
    final storiesProvider = Provider.of<StoriesProvider>(context);
    final storyController = StoryController();
    PageController pageController =
        PageController(initialPage: storiesProvider.stories.indexOf(e));

    return Scaffold(
        backgroundColor: Colors.black,
        body: PageView.builder(
            controller: pageController,
            itemCount: storiesProvider.stories.length,
            itemBuilder: (context, i) => Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      StoryView(
                        storyItems: [
                          StoryItem.pageImage(
                              url: storiesProvider.stories[i].image,
                              //  caption: storiesProvider.stories[i].name,
                              controller: storyController)
                        ],
                        controller: storyController,
                        onComplete: () {
                          if (storiesProvider.stories.length !=
                              storiesProvider.stories.indexOf(e))
                            pageController.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeIn);
                        },
                        repeat: true,
                      ),
                      Positioned(
                        top: 50,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(
                                    storiesProvider.stories[i].avatar),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    storiesProvider.stories[i].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    TimeFormatting.displayTimeAgoFromTimestamp(
                                        storiesProvider.stories[i].createdAt),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
