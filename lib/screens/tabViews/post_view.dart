import 'package:ctz_wtch/screens/video_play_screen.dart';
import 'package:ctz_wtch/utils/text.dart';
import 'package:ctz_wtch/widgets/ctzW_post_card.dart';
import 'package:flutter/material.dart';

class CtzwPostsView extends StatelessWidget {
  const CtzwPostsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CtzwPostCard(
            userImage: 'images/profile.png',
            userName: 'Musa Damu',
            caption: captionTest1,
            location: 'Kaduna',
            timeOfPost: '10 min ago',
            isVideo: true,
            videoThumb: 'images/lightning.jpg',
            videoPlayTap: () {
              Navigator.of(context).pushNamed(VideoPlaySCreen.id);
            },
          ),
          CtzwPostCard(
            userImage: 'images/profile.png',
            userName: 'Nishi ta Damu',
            caption: captionTest1,
            location: 'Abuja',
            timeOfPost: '5 sec ago',
            isVideo: false,
            postImage: 'images/lightning.jpg',
          ),
        ],
      ),
    );
  }
}
