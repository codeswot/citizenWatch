import 'package:ctz_wtch/routes/routes.dart';
import 'package:ctz_wtch/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citizen Watch',
      theme: ThemeData(
        backgroundColor: Color(0xffEDEDED),
        scaffoldBackgroundColor: Color(0xffEDEDED),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: myRoutes,
      initialRoute: SplashScreen.id,
    );
  }
}
