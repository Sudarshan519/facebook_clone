import 'package:flutter/material.dart';

Widget addStory() {
  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        // image:
        //     DecorationImage(image: NetworkImage(e.image), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(16)),
    // padding: EdgeInsets.all(8),
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    height: 200,
    width: 100,
    child: Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(16)),
      ),
      Center(
          child: Stack(
        children: [
          CircleAvatar(
            radius: 24,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  'https://scontent.fktm10-1.fna.fbcdn.net/v/t1.6435-9/206085383_458435611892568_1808376874543890904_n.jpg?_nc_cat=1&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=ygaMJmQyejYAX-b6QzQ&_nc_ht=scontent.fktm10-1.fna&oh=8d340c6c02afe31f23dea8d3cdcaae9f&oe=6135C672'),
            ),
          ),
          CircleAvatar(
            radius: 8,
            child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  color: Colors.grey[700],
                  size: 10,
                )),
          ),
        ],
      )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Add your story',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      )
    ]),
    // storiesWidget(
    //   Stories(
    //       image:
    //           'https://scontent.fktm10-1.fna.fbcdn.net/v/t1.6435-9/206085383_458435611892568_1808376874543890904_n.jpg?_nc_cat=1&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=ygaMJmQyejYAX-b6QzQ&_nc_ht=scontent.fktm10-1.fna&oh=8d340c6c02afe31f23dea8d3cdcaae9f&oe=6135C672',
    //       avatar:
    //           "https://scontent.fktm10-1.fna.fbcdn.net/v/t1.6435-9/206085383_458435611892568_1808376874543890904_n.jpg?_nc_cat=1&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=ygaMJmQyejYAX-b6QzQ&_nc_ht=scontent.fktm10-1.fna&oh=8d340c6c02afe31f23dea8d3cdcaae9f&oe=6135C672",
    //       name: 'Add your story'),
  );
}

class AddStory extends StatelessWidget {
  final double position;
  const AddStory({Key key, this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(position);
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          // image:
          //     DecorationImage(image: NetworkImage(e.image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(16)),
      // padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: (200 - position),
      width: 100,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.5),
              borderRadius: BorderRadius.circular(16)),
        ),
        Center(
            child: Stack(
          children: [
            CircleAvatar(
              radius: 24,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                    'https://scontent.fktm10-1.fna.fbcdn.net/v/t1.6435-9/206085383_458435611892568_1808376874543890904_n.jpg?_nc_cat=1&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=ygaMJmQyejYAX-b6QzQ&_nc_ht=scontent.fktm10-1.fna&oh=8d340c6c02afe31f23dea8d3cdcaae9f&oe=6135C672'),
              ),
            ),
            CircleAvatar(
              radius: 8,
              child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    color: Colors.grey[700],
                    size: 10,
                  )),
            ),
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Add your story',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        )
      ]),
      // storiesWidget(
      //   Stories(
      //       image:
      //           'https://scontent.fktm10-1.fna.fbcdn.net/v/t1.6435-9/206085383_458435611892568_1808376874543890904_n.jpg?_nc_cat=1&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=ygaMJmQyejYAX-b6QzQ&_nc_ht=scontent.fktm10-1.fna&oh=8d340c6c02afe31f23dea8d3cdcaae9f&oe=6135C672',
      //       avatar:
      //           "https://scontent.fktm10-1.fna.fbcdn.net/v/t1.6435-9/206085383_458435611892568_1808376874543890904_n.jpg?_nc_cat=1&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=ygaMJmQyejYAX-b6QzQ&_nc_ht=scontent.fktm10-1.fna&oh=8d340c6c02afe31f23dea8d3cdcaae9f&oe=6135C672",
      //       name: 'Add your story'),
    );
  }
}
