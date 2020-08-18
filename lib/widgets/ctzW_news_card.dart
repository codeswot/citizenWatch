import 'package:flutter/material.dart';

class CtzwNewsCard extends StatelessWidget {
  const CtzwNewsCard({
    Key key,
    this.onTap,
    this.photo,
    this.tag,
    this.tagColor,
    this.timeOfNews,
    this.headLine,
    this.newsVendor,
  }) : super(key: key);
  final Function onTap;
  final String photo;
  final String tag;
  final Color tagColor;
  final String timeOfNews;
  final String headLine;
  final String newsVendor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: 12.0,
          right: 12.0,
          top: 10.0,
          bottom: 10.0,
        ),
        width: double.infinity,
        height: 130.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  top: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: tagColor,
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                          child: Text(
                            tag,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            timeOfNews,
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Center(
                      child: Container(
                        width: 200,
                        child: Text(
                          headLine,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff333300),
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        newsVendor,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
