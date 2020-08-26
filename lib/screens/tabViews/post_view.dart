import 'package:ctz_wtch/screens/upload_screen.dart';
import 'package:ctz_wtch/screens/video_play_screen.dart';
import 'package:ctz_wtch/widgets/ctzW_post_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CtzwPostView extends StatefulWidget {
  const CtzwPostView({Key key}) : super(key: key);

  @override
  _CtzwPostViewState createState() => _CtzwPostViewState();
}

class _CtzwPostViewState extends State<CtzwPostView> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    // getTheLocation();

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final usersInformations = snapshot.data.docs;
          List<CtzwPostCard> allPostWidgets = [];
          for (var userInformation in usersInformations) {
            final fullname = userInformation.data()['name'];
            final newsPost = userInformation.data()['newsDescription'];
            final singlePostWidget = CtzwPostCard(
              userImage: '',
              userName: '$fullname',
              caption: '$newsPost',
              timeOfPost: '10 min ago',
              isVideo: false,
              postImage: 'gs://citizenwatch-6de93.appspot.com/dribbble_1x.jpg',
              videoPlayTap: () {
                Navigator.of(context).pushNamed(VideoPlaySCreen.id);
              },
            );
            if(newsPost == ''){
              allPostWidgets.remove(singlePostWidget);
            }
            allPostWidgets.add(singlePostWidget);
          }
          return ListView(
            physics: BouncingScrollPhysics(),
            children: allPostWidgets,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            UploadScreen.id,
          );
        },
      ),
    );
  }
}
