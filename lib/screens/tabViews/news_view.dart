import 'package:ctz_wtch/screens/news_read_screen.dart';
import 'package:ctz_wtch/utils/text.dart';
import 'package:ctz_wtch/widgets/ctzW_news_card.dart';
import 'package:flutter/material.dart';

class CtzwNewsView extends StatelessWidget {
  const CtzwNewsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CtzwNewsCard(
            onTap: () {
              Navigator.of(context).pushNamed(NewsReadScreen.id);
            },
            photo: 'images/lightning.jpg',
            tag: 'Braking news',
            tagColor: Color(0xffff3333),
            timeOfNews: '12:30 am.',
            headLine: headlineTest1,
            newsVendor: 'Oracle',
          ),
          CtzwNewsCard(
            photo: 'images/lightning.jpg',
            tag: 'Tech',
            tagColor: Colors.blueAccent,
            timeOfNews: '8:30 am.',
            headLine: headlineTest1,
            newsVendor: 'Vanguard',
          ),
          CtzwNewsCard(
            photo: 'images/lightning.jpg',
            tag: 'Finance',
            tagColor: Colors.green,
            timeOfNews: '8:12 am.',
            headLine: headlineTest1,
            newsVendor: 'BBC',
          ),
          CtzwNewsCard(
            photo: 'images/lightning.jpg',
            tag: 'Agriculture',
            tagColor: Colors.green[800],
            timeOfNews: '8:30 am.',
            headLine: headlineTest1,
            newsVendor: 'Algezeera',
          ),
          CtzwNewsCard(
            photo: 'images/lightning.jpg',
            tag: 'Games',
            tagColor: Colors.black,
            timeOfNews: '1:00 pm.',
            headLine: headlineTest1,
            newsVendor: 'NTA',
          ),
        ],
      ),
    );
  }
}
