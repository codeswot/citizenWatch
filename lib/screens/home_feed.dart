import 'package:ctz_wtch/screens/tabViews/news_view.dart';
import 'package:ctz_wtch/screens/tabViews/post_view.dart';
// import 'package:ctz_wtch/screens/user_profile.dart';
import 'package:ctz_wtch/widgets/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ctz_wtch/services/databaseService.dart';

class HomeFeed extends StatefulWidget {
  static const String id = 'HomeFeed';
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  Future<User> email = DatabaseService().getUserEmail();
  Future displayName = DatabaseService().getDoc('pSmagK2GfWZFJttoV2SonIYwKBk1');
  Future<String> id = DatabaseService().getCurrentUID();
  
  List<Widget> widgetList = [
    CtzwPostView(),
    CtzwNewsView(),
  ];
  @override
  initState(){
    super.initState();
    print(id);
  }
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
                  builder: (BuildContext context) => FutureBuilder(
                    future: email,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CustomDialog(
                        image:
                            'https://avatars3.githubusercontent.com/u/40618838?s=460&v=4',
                        name: 'Na mairo',
                        email: '${snapshot.data.email}',
                        buttonText: "SIGNOUT",
                        signOut: () {},
                      );
                    },
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
