
import 'package:facebook_clone/pages/home/storiesContainer.dart';
import 'package:facebook_clone/widgets/createPostWidget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWIdget extends StatelessWidget {
  const LoadingWIdget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
           
          baseColor: Colors.grey[200],
          highlightColor: Colors.grey[350],
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              createPostWidget(context),
              SizedBox(
                height: 6,
              ),
              StoriesContainer(),
              SizedBox(height: 10),
              FacebookPostWidget(
                'This is a title',
                'This is a content, This is a content',
                'https://r-cf.bstatic.com/images/hotel/max1024x768/116/116281457.jpg',
                backgroundColor: Colors.white,
              ),
            ],
          )),
    );
  }
}

class FacebookPostWidget extends StatelessWidget {
  FacebookPostWidget(this.title, this.content, this.imageUrl,
      {this.backgroundColor});

  final String title;
  final String content;
  final String imageUrl;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(title,
                style:
                    TextStyle(backgroundColor: backgroundColor, fontSize: 30)),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.topLeft,
            child: Text(content,
                style:
                    TextStyle(backgroundColor: backgroundColor, fontSize: 20)),
          ),
          SizedBox(height: 8),
          Image.network(imageUrl,
              width: double.infinity,
              height: 200,
              color: backgroundColor,
              fit: BoxFit.fitWidth),
          SizedBox(height: 8),
        ],
      );
}
