import 'package:ctz_wtch/screens/tabViews/news_view.dart';
import 'package:ctz_wtch/screens/tabViews/post_view.dart';
import 'package:ctz_wtch/screens/user_profile.dart';
import 'package:ctz_wtch/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

class HomeFeed extends StatefulWidget {
  static const String id = 'HomeFeed';
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  List<Widget> widgetList = [
    CtzwPostView(),
    CtzwNewsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('CitiZen Watch'),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialog(
                    image:
                        'https://avatars3.githubusercontent.com/u/40618838?s=460&v=4',
                    name: 'Musa Damu',
                    email: "MusaDamsu@dj.com",
                    buttonText: "SIGNOUT",
                    signOut: () {},
                  ),
                );
              },
            )
          ],
          bottom: TabBar(tabs: [
            Tab(
              icon: Column(
                children: [
                  Icon(Icons.whatshot),
                  Text('Posts'),
                ],
              ),
            ),
            Tab(
              icon: Column(
                children: [
                  Icon(Icons.tv),
                  Text('News'),
                ],
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: widgetList,
        ),
      ),
    );
  }
}
