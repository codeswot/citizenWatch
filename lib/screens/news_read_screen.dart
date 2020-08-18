import 'package:ctz_wtch/utils/text.dart';
import 'package:flutter/material.dart';

class NewsReadScreen extends StatefulWidget {
  static const String id = 'NewsReadScreen';
  @override
  _NewsReadScreenState createState() => _NewsReadScreenState();
}

class _NewsReadScreenState extends State<NewsReadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            snap: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      child: Text(
                        'Breaking news',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Flexible(
                      child: Text(
                        headlineTest1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              background: Hero(
                tag: 'imageHeader',
                child: Image.asset(
                  'images/lightning.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: Text(
                    newsPost1 + newsPost1 + newsPost1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
