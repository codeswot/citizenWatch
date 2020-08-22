import 'package:ctz_wtch/screens/home_feed.dart';
import 'package:ctz_wtch/screens/login_screen.dart';
import 'package:ctz_wtch/screens/news_read_screen.dart';
import 'package:ctz_wtch/screens/register_screen.dart';
import 'package:ctz_wtch/screens/splash_screen.dart';
import 'package:ctz_wtch/screens/upload_screen.dart';
import 'package:ctz_wtch/screens/user_profile.dart';
import 'package:ctz_wtch/screens/video_play_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> myRoutes = {
  SplashScreen.id: (context) => SplashScreen(),
  RegisterScreen.id: (context) => RegisterScreen(),
  UserProfile.id: (context) => UserProfile(),
  LogInScreen.id: (context) => LogInScreen(),
  HomeFeed.id: (context) => HomeFeed(),
  VideoPlaySCreen.id: (context) => VideoPlaySCreen(),
  NewsReadScreen.id: (context) => NewsReadScreen(),
  UploadScreen.id: (context) => UploadScreen(),
};
