import 'package:ctz_wtch/screens/video_play_screen.dart';
import 'package:ctz_wtch/services/geolocation/geolocation_get.dart';
import 'package:ctz_wtch/utils/text.dart';
import 'package:ctz_wtch/widgets/ctzW_post_card.dart';
import 'package:flutter/material.dart';

class CtzwPostView extends StatefulWidget {
  const CtzwPostView({Key key}) : super(key: key);

  @override
  _CtzwPostViewState createState() => _CtzwPostViewState();
}

LocationHelper myLocationHelper = LocationHelper();
String myLocation;

Future getTheLocation() async {
  myLocation = await myLocationHelper.getUserLocation();
  print(myLocation);
}

class _CtzwPostViewState extends State<CtzwPostView> {
  @override
  Widget build(BuildContext context) {
    getTheLocation();

    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext ctxt, int index) {
          return CtzwPostCard(
            userImage: 'images/profile.png',
            userName: 'Musa Damu',
            caption: captionTest1,
            location: myLocation ?? "",
            timeOfPost: '10 min ago',
            isVideo: false,
            postImage: 'images/lightning.jpg',
            videoPlayTap: () {
              Navigator.of(context).pushNamed(VideoPlaySCreen.id);
            },
          );
        },
        itemCount: 2,
      ),
    );
  }
}
