
import 'package:facebook_clone/providers/storiesProvider.dart';
import 'package:facebook_clone/widgets/storyWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoriesWidget extends StatelessWidget {
  const StoriesWidget({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final _storiesProvider = Provider.of<StoriesProvider>(context);
    return ListView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 120),
        children: [
          ..._storiesProvider.stories.map((e) => storiesWidget(e)),
        ]);
  }
}
