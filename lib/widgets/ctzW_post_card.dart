import 'package:flutter/material.dart';

class CtzwPostCard extends StatelessWidget {
  const CtzwPostCard({
    Key key,
    this.userImage,
    this.userName,
    this.caption,
    this.location,
    this.timeOfPost,
    this.isVideo,
    this.postImage,
    this.videoThumb,
    this.videoPlayTap,
  }) : super(key: key);
  final String userImage;
  final String userName;
  final String postImage;
  final String videoThumb;
  final String caption;
  final String location;
  final String timeOfPost;
  final bool isVideo;
  final Function videoPlayTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 10.0,
        bottom: 10.0,
      ),
      padding: EdgeInsets.all(
        10.0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: isVideo
                ? Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          videoThumb,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InkWell(
                        onTap: videoPlayTap,
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      postImage,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(userImage),
              ),
              SizedBox(width: 8.0),
              Text(
                userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000033),
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Container(
            child: Text(
              caption,
              style: TextStyle(
                letterSpacing: 1.3,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Color(0xff333300),
              ),
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                location,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
              SizedBox(width: 5.0),
              Text(
                '|',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 5.0),
              Text(
                timeOfPost,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
