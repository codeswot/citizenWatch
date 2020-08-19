import 'package:ctz_wtch/helper/data.dart';
import 'package:ctz_wtch/helper/news.dart';
import 'package:ctz_wtch/models/categorie_model.dart';
import 'package:ctz_wtch/utils/colors.dart';
import 'package:ctz_wtch/widgets/ctzW_news_card.dart';
import 'package:flutter/material.dart';

class CtzwNewsView extends StatefulWidget {
  const CtzwNewsView({
    Key key,
  }) : super(key: key);

  @override
  _CtzwNewsViewState createState() => _CtzwNewsViewState();
}

class _CtzwNewsViewState extends State<CtzwNewsView> {
  void initState() {
    loading = true;
    super.initState();
    categories = getCategories();
    getNews();
  }

  var newslist;
  bool loading;
  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      loading = false;
    });
  }

  List<CategorieModel> categories = List<CategorieModel>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: newslist.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CtzwNewsCard(
                tag: newslist[index].category ?? "",
                imgUrl: newslist[index].urlToImage ??
                    "https://image.flaticon.com/icons/png/512/21/21601.png",
                title: newslist[index].title ?? "",
                // desc: newslist[index].description ?? "",
                tagColor: myColors[index],
                posturl: newslist[index].articleUrl ?? "",
                newsSource: newslist[index].name ?? "",
                timeOfNews: newslist[index].publshedAt.toString() ?? "",
              );
            });
  }
}
